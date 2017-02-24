package org.rdw.ingest.processor.repository.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.rdw.ingest.processor.model.District;
import org.rdw.ingest.processor.model.School;
import org.rdw.ingest.processor.repository.SchoolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class SchoolRepositoryIT {
    @Autowired
    private SchoolRepository repository;

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    @Test
    @Sql(statements = {
            "INSERT INTO district (id, name, natural_id) VALUES (22, 'Sample District 1', '01247430000000');",
            "INSERT INTO school (id, district_id, name, natural_id) VALUES (27, 22, 'Sample School 1', '30664640124743');"
    })
    public void itShouldReturnExistingId() {
        final int id = repository.findOrCreateByNaturalId(School.builder()
                .withName("Sample School 1")
                .withNaturalId("30664640124743")
                .withDistrict(District.builder().withNaturalId("01247430000000").withName("Sample District 1").build())
                .build());

        assertThat(id).isEqualTo(27);
    }

    @Test
    public void itShouldReturnCreateNewId() {
        Integer id = jdbcTemplate.queryForObject("select count(*) from school where natural_id = :natural_id and name = :name", new MapSqlParameterSource()
                .addValue("natural_id", "01247430000000").addValue("name", "Sample District 1"), Integer.class);
        assertThat(id).isEqualTo(0);

        id = repository.findOrCreateByNaturalId(School.builder()
                .withName("Sample School 1")
                .withNaturalId("30664640124743")
                .withDistrict(District.builder().withNaturalId("01247430000000").withName("Sample District 1").build())
                .build());

        assertThat(id).isNotNull();
    }
}