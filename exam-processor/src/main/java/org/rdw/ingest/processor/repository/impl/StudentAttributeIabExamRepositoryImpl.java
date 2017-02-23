package org.rdw.ingest.processor.repository.impl;

import org.rdw.ingest.processor.model.StudentAttributes;
import org.rdw.ingest.processor.repository.StudentAttributeIabExamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
class StudentAttributeIabExamRepositoryImpl implements StudentAttributeIabExamRepository {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    @Override
    public long create(StudentAttributes studentAttributes) {

        final String sql = "INSERT INTO iab_exam_student (grade_id, student_id, school_id, iep, lep, section504, economic_disadvantage, migrant_status, eng_prof_lvl, t3_program_type, language_code, prim_disability_type) \n" +
                "VALUES (:grade_id, :student_id, :school_id, :iep, :lep, :section504, :economic_disadvantage, :migrant_status, :eng_prof_lvl, :t3_program_type, :language_code, :prim_disability_type);";

        KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("grade_id", studentAttributes.getGradeId())
                .addValue("student_id", studentAttributes.getStudentId())
                .addValue("school_id", studentAttributes.getResponsibleSchoolId())
                .addValue("iep", studentAttributes.getIdeaIndicator())
                .addValue("lep", studentAttributes.getLep())
                .addValue("section504", studentAttributes.getSection504())
                .addValue("economic_disadvantage", studentAttributes.getEconomicDisadvantage())
                .addValue("migrant_status", studentAttributes.getMigrantStatus())
                .addValue("eng_prof_lvl", studentAttributes.getEngProfLvl())
                .addValue("t3_program_type", studentAttributes.getT3ProgramType())
                .addValue("language_code", studentAttributes.getLanguageCode())
                .addValue("prim_disability_type", studentAttributes.getPrimDisabilityType());

        jdbcTemplate.update(sql, parameterSource, keyHolder);
        return keyHolder.getKey().longValue();
    }
}
