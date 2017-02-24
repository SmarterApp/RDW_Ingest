package org.rdw.ingest.processor.repository.impl;

import org.rdw.ingest.processor.model.Student;
import org.rdw.ingest.processor.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
class StudentRepositoryImpl implements StudentRepository {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;


    @Override
    public long findOrCreateBySsid(final Student student) {
        final String sql = "INSERT INTO student (ssid, last_or_surname, first_name, middle_name, gender_id, ethnicity_id, first_entry_into_us_school_at, lep_entry_at, lep_exit_at, birthday) \n" +
                "SELECT :ssid, :last_or_surname, :first_name, :middle_name, :gender_id, :ethnicity_id, :first_entry_into_us_school_at, :lep_entry_at, :lep_exit_at, :birthday\n" +
                "FROM DUAL\n" +
                "WHERE NOT EXISTS(\n" +
                "    SELECT 1\n" +
                "    FROM student\n" +
                "    WHERE ssid = :ssid \n" +
                ") LIMIT 1;\n";

        final KeyHolder keyHolder = new GeneratedKeyHolder();
        final SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("ssid", student.getSsid())
                .addValue("last_or_surname", student.getLastOrSurname())
                .addValue("first_name", student.getFirstName())
                .addValue("middle_name", student.getMiddleName())
                .addValue("gender_id", student.getGenderId())
                .addValue("ethnicity_id", student.getEthnicityId())
                .addValue("first_entry_into_us_school_at", student.getFirsEntryIntoUSSchoolAt())
                .addValue("lep_entry_at", student.getLepEntryAt())
                .addValue("lep_exit_at", student.getLepExitAt())
                .addValue("birthday", student.getBirthday());


        jdbcTemplate.update(sql, parameterSource, keyHolder);

        final Number id = keyHolder.getKey();
        if (id != null) return id.intValue();
        return jdbcTemplate.queryForObject("select id from student where ssid = :ssid", new MapSqlParameterSource("ssid", student.getSsid()), Long.class);
    }
}
