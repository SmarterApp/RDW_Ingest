package org.rdw.ingest.processor.repository.impl;

import java.util.List;
import org.rdw.ingest.processor.model.Exam;
import org.rdw.ingest.processor.model.ExamClaim;
import org.rdw.ingest.processor.model.ExamItem;
import org.rdw.ingest.processor.model.StudentExamAttributes;
import org.rdw.ingest.processor.repository.ExamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ExamRepositoryImpl implements ExamRepository {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    //TODO: discuss a transaction with the team
    @Transactional
    @Override
    public long create(final Exam exam) {
        final long studentExamId = create(exam.getStudentExamAttributes());

        final String sql = "INSERT INTO exam (exam_student_id, asmt_id, asmt_version, opportunity, status, validity, completeness_id, administration_condition_id, session_id, scale_score, scale_score_std_err, achievement_level, completed_at) VALUES\n" +
                " (:exam_student_id, :asmt_id, :asmt_version, :opportunity, :status, :validity, :completeness_id, :administration_condition_id, :session_id, :scale_score, :scale_score_std_err, :achievement_level, :completed_at);";

        final KeyHolder keyHolder = new GeneratedKeyHolder();
        final SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("exam_student_id", studentExamId)
                .addValue("asmt_id", exam.getAssessmentId())
                .addValue("asmt_version", exam.getAsmtVersion())
                .addValue("opportunity", exam.getOpportunity())
                .addValue("status", exam.getStatus())
                .addValue("validity", exam.isValid())
                .addValue("completeness_id", exam.getCompleteness())
                .addValue("administration_condition_id", exam.getAdministrationConditionId())
                .addValue("session_id", exam.getSessionId())
                .addValue("scale_score", exam.getScaleScore())
                .addValue("scale_score_std_err", exam.getScaleScoreStdErr())
                .addValue("achievement_level", exam.getAchievementLevel())
                .addValue("completed_at", exam.getCompletedAt());

        jdbcTemplate.update(sql, parameterSource, keyHolder);
        final Long id = keyHolder.getKey().longValue();
        batchCreateExamClaims(exam.getExamClaims(), id);
        batchCreateExamItems(exam.getExamItems(), id);
        return id;
    }

    protected void batchCreateExamClaims(final List<ExamClaim> examClaims, final long examId) {
        final SqlParameterSource[] batchParameters = examClaims.stream()
                .map(examClaim -> new MapSqlParameterSource("exam_id", examId)
                        .addValue("claim_id", examClaim.getClaimId())
                        .addValue("scale_score", examClaim.getScaleScore())
                        .addValue("scale_score_std_err", examClaim.getScaleScoreStdErr())
                        .addValue("category", examClaim.getCategory()))
                .toArray(MapSqlParameterSource[]::new);

        jdbcTemplate.batchUpdate("INSERT INTO exam_claim_score (exam_id, claim_id, scale_score, scale_score_std_err, category) VALUES\n" +
                "(:exam_id, :claim_id, :scale_score, :scale_score_std_err, :category);", batchParameters);

    }

    protected long create(final StudentExamAttributes studentExamAttributes) {

        final String sql = "INSERT INTO exam_student (grade_id, student_id, school_id, iep, lep, section504, economic_disadvantage, migrant_status, eng_prof_lvl, t3_program_type, language_code, prim_disability_type) \n" +
                "VALUES (:grade_id, :student_id, :school_id, :iep, :lep, :section504, :economic_disadvantage, :migrant_status, :eng_prof_lvl, :t3_program_type, :language_code, :prim_disability_type);";

        final KeyHolder keyHolder = new GeneratedKeyHolder();
        final SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("grade_id", studentExamAttributes.getGradeId())
                .addValue("student_id", studentExamAttributes.getStudentId())
                .addValue("school_id", studentExamAttributes.getResponsibleSchoolId())
                .addValue("iep", studentExamAttributes.getIdeaIndicator())
                .addValue("lep", studentExamAttributes.getLep())
                .addValue("section504", studentExamAttributes.getSection504())
                .addValue("economic_disadvantage", studentExamAttributes.getEconomicDisadvantage())
                .addValue("migrant_status", studentExamAttributes.getMigrantStatus())
                .addValue("eng_prof_lvl", studentExamAttributes.getEngProfLvl())
                .addValue("t3_program_type", studentExamAttributes.getT3ProgramType())
                .addValue("language_code", studentExamAttributes.getLanguageCode())
                .addValue("prim_disability_type", studentExamAttributes.getPrimDisabilityType());

        jdbcTemplate.update(sql, parameterSource, keyHolder);
        return keyHolder.getKey().longValue();
    }

    protected void batchCreateExamItems(final List<ExamItem> examItems, final long examId) {
        final SqlParameterSource[] batchParameters = examItems.stream()
                .map(examItem -> new MapSqlParameterSource("exam_id", examId)
                        .addValue("item_key", examItem.getKey())
                        .addValue("bank_key", examItem.getBankKey())
                        .addValue("response", examItem.getResponse())
                        .addValue("score_status", examItem.getScoreStatus())
                        .addValue("score", examItem.getScore()))
                .toArray(MapSqlParameterSource[]::new);

        jdbcTemplate.batchUpdate("\n" +
                "INSERT INTO exam_item (exam_id, item_key, bank_key, score, score_status, response) VALUES\n" +
                "(:exam_id, :item_key, :bank_key, :score, :score_status, :response);", batchParameters);

    }
}
