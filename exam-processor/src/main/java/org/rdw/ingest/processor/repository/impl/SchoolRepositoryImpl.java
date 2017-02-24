package org.rdw.ingest.processor.repository.impl;

import org.rdw.ingest.processor.model.District;
import org.rdw.ingest.processor.model.School;
import org.rdw.ingest.processor.repository.SchoolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
class SchoolRepositoryImpl implements SchoolRepository {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    //TODO: discuss no transaction here
    @Override
    public int findOrCreateByNaturalId(final School school) {
        final Integer districtId = findOrCreate(school.getDistrict());

        final String sql = "INSERT INTO school (district_id, name, natural_id) \n" +
                "SELECT :district_id, :name, :natural_id\n" +
                "FROM DUAL\n" +
                "WHERE NOT EXISTS(\n" +
                "    SELECT 1\n" +
                "    FROM school\n" +
                "    WHERE natural_id = :natural_id \n" +
                ") LIMIT 1;\n";

        final KeyHolder keyHolder = new GeneratedKeyHolder();
        final SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("natural_id", school.getNaturalId())
                .addValue("name", school.getName())
                .addValue("district_id", districtId);

        jdbcTemplate.update(sql, parameterSource, keyHolder);

        final Number id = keyHolder.getKey();
        if (id != null) return id.intValue();
        return jdbcTemplate.queryForObject("select id from school where natural_id = :natural_id", new MapSqlParameterSource("natural_id", school.getNaturalId()), Integer.class);
    }

    public int findOrCreate(final District district) {
        final String sql = "INSERT INTO district (name, natural_id)\n" +
                "SELECT :name, :natural_id\n" +
                "FROM DUAL\n" +
                "WHERE NOT EXISTS(\n" +
                "    SELECT 1\n" +
                "    FROM district\n" +
                "    WHERE natural_id = :natural_id \n" +
                ") LIMIT 1;\n";

        final KeyHolder keyHolder = new GeneratedKeyHolder();
        final SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("natural_id", district.getNaturalId())
                .addValue("name", district.getName());

        jdbcTemplate.update(sql, parameterSource, keyHolder);

        final Number id = keyHolder.getKey();
        if (id != null) return id.intValue();
        return jdbcTemplate.queryForObject("select id from district where natural_id = :natural_id", new MapSqlParameterSource("natural_id", district.getNaturalId()), Integer.class);
    }
}
