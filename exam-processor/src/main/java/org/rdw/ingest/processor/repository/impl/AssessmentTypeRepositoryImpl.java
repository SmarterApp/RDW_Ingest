package org.rdw.ingest.processor.repository.impl;

import org.rdw.ingest.processor.repository.AssessmentTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
class AssessmentTypeRepositoryImpl implements AssessmentTypeRepository {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    @Override
    public String toCode(int id) {
        final MapSqlParameterSource parameters = new MapSqlParameterSource("id", id);

        return jdbcTemplate.queryForObject("select code from assessment_type where id= :id", parameters, String.class);
    }
}
