
package com.maiphuhai.repository;

import com.maiphuhai.model.Subject;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SubjectRepository {
    private final JdbcTemplate jdbc;

    public SubjectRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public List<Subject> findAll() {
        String sql = "SELECT subject_id AS subjectId, name, description FROM subjects";
        return jdbc.query(sql, new BeanPropertyRowMapper<>(Subject.class));
    }
}
