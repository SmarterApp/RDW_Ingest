package org.rdw.ingest.processor.repository.impl;

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

        return jdbcTemplate.query("select * from asmt where natural_id= :natural_id", parameters, new AssessmentRowMapper()).get(0);
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
        return Assessment.builder().copy(assessment).id(keyHolder.getKey().longValue()).build();

    }

    private static class AssessmentRowMapper implements RowMapper<Assessment> {
        //TODO:this does not deal with claims yet
        @Override
        public Assessment mapRow(ResultSet rs, int rowNum) throws SQLException {
            return Assessment.builder()
                    .id(rs.getLong("id"))
                    .naturalId(rs.getString("natural_id"))
                    .gradeId(rs.getInt("grade_id"))
                    .typeId(rs.getInt("type_id"))
                    .subjectId(rs.getInt("subject_id"))
                    .academicYear(rs.getInt("academic_year"))
                    .name(rs.getString("name"))
                    .label(rs.getString("label"))
                    .version(rs.getString("version"))
                    .build();
        }
    }
}
