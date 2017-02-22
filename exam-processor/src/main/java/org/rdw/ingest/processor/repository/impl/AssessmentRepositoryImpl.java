package org.rdw.ingest.processor.repository.impl;

import java.util.List;
import org.rdw.ingest.processor.model.Assessment;
import org.rdw.ingest.processor.repository.AssessmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
class AssessmentRepositoryImpl implements AssessmentRepository {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    @Override
    public Assessment findAssessmentByNaturalId(String id) {
        final MapSqlParameterSource parameters = new MapSqlParameterSource("natural_id", id);

        List<Assessment> assessmentList = jdbcTemplate.query("select * from asmt where natural_id= :natural_id", parameters, new AssessmentRowMapper());
        if(assessmentList.size() == 1) return assessmentList.get(0);
        //TODO
        return null;
    }

    @Override
    public Assessment create(final Assessment assessment) {

        //TODO:this does not deal with claims yet
        final String sql = "INSERT INTO asmt (natural_id, grade_id,type_id, subject_id, academic_year, name, label, version) VALUES\n" +
                " (:natural_id, :grade_id, :type_id, :subject_id, :academic_year, :name, :label, :version);\n";

        KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("natural_id", assessment.getNaturalId())
                .addValue("grade_id", assessment.getGradeId())
                .addValue("type_id", assessment.getTypeId())
                .addValue("subject_id", assessment.getSubjectId())
                .addValue("academic_year", assessment.getAcademicYear())
                .addValue("name", assessment.getName())
                .addValue("label", assessment.getLabel())
                .addValue("version", assessment.getVersion());

        jdbcTemplate.update(sql, parameterSource, keyHolder);
        return Assessment.builder().withCopy(assessment).withId(keyHolder.getKey().longValue()).build();

    }

    private static class AssessmentRowMapper implements RowMapper<Assessment> {
        //TODO:this does not deal with claims yet
        @Override
        public Assessment mapRow(ResultSet rs, int rowNum) throws SQLException {
            return Assessment.builder()
                    .withId(rs.getLong("id"))
                    .withNaturalId(rs.getString("natural_id"))
                    .withGradeId(rs.getInt("grade_id"))
                    .withTypeId(rs.getInt("type_id"))
                    .withSubjectId(rs.getInt("subject_id"))
                    .withAcademicYear(rs.getInt("academic_year"))
                    .withName(rs.getString("name"))
                    .withLabel(rs.getString("label"))
                    .withVersion(rs.getString("version"))
                    .build();
        }
    }
}
