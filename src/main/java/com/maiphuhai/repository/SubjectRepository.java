package com.maiphuhai.repository;

import com.maiphuhai.model.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubjectRepository {

    @Autowired
    private JdbcTemplate jdbc;

    public List<Subject> findAll() {
        String sql = "SELECT * FROM subjects ORDER BY subject_id";
        return jdbc.query(sql, new BeanPropertyRowMapper<>(Subject.class));
    }

    public Subject findById(int id) {
        String sql = "SELECT * FROM subjects WHERE subject_id = ?";
        return jdbc.queryForObject(sql, new BeanPropertyRowMapper<>(Subject.class), id);
    }

    public void save(Subject s) {
        String sql = "INSERT INTO subjects(name, description) VALUES (?,?)";
        jdbc.update(sql, s.getName(), s.getDescription());
    }

    public void update(Subject s) {
        String sql = "UPDATE subjects SET name = ?, description = ? WHERE subject_id = ?";
        jdbc.update(sql, s.getName(), s.getDescription(), s.getSubjectId());
    }

    public void delete(int id) {
        jdbc.update("DELETE FROM subjects WHERE subject_id = ?", id);
    }
}
