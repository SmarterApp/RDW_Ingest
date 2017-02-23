package org.rdw.ingest.processor.repository.impl;

import org.rdw.ingest.processor.model.IabExam;
import org.rdw.ingest.processor.repository.IabExamRepository;
import org.rdw.ingest.processor.repository.StudentAttributeIabExamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;


@Repository
public class IabExamRepositoryImpl implements IabExamRepository {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    private StudentAttributeIabExamRepository attributeIabExamRepository;

    @Override
    public long create(IabExam exam) {

        //TODO: this should be transactional - I think...?
        final long studentExamId = attributeIabExamRepository.create(exam.getStudentAttributes());

        final String sql = "INSERT INTO iab_exam (iab_exam_student_id, asmt_id, asmt_version, opportunity, status, validity, completeness_id, administration_condition_id, session_id, scale_score, scale_score_std_err, category, completed_at) VALUES\n" +
                " (:iab_exam_student_id, :asmt_id, :asmt_version, :opportunity, :status, :validity, :completeness_id, :administration_condition_id, :session_id, :scale_score, :scale_score_std_err, :category, :completed_at);";

        KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("iab_exam_student_id", studentExamId)
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
                .addValue("category", exam.getCategory())
                .addValue("completed_at", exam.getCompletedAt());

        jdbcTemplate.update(sql, parameterSource, keyHolder);
        return keyHolder.getKey().longValue();
    }
}
