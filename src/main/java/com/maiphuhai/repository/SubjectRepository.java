package com.maiphuhai.repository;

import com.maiphuhai.model.Subject;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SubjectRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
        Subject subject = new Subject();
        subject.setSubject_id(rs.getInt("subject_id"));
        subject.setName(rs.getString("name"));
        subject.setDescription(rs.getString("description"));
        subject.setCreate_at(rs.getDate("create_at"));
        return subject;
    }

    public List<Subject> findAll() {
        String sql = "SELECT * FROM subjects";
        return jdbcTemplate.query(sql, this::mapRow);
    }

    public Subject findById(int id) {
        String sql = "SELECT * FROM subjects WHERE subject_id = ?";
        return jdbcTemplate.queryForObject(sql, this::mapRow, id);
    }

    public void save(Subject subject) {
        String sql = "INSERT INTO subjects (name, description, create_at) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, subject.getName(), subject.getDescription(), subject.getCreate_at());
    }

    public void update(Subject subject) {
        String sql = "UPDATE subjects SET name = ?, description = ?, create_at = ? WHERE id = ?";
        jdbcTemplate.update(sql, subject.getName(), subject.getDescription(), subject.getCreate_at(), subject.getSubject_id());
    }

    public void delete(int id) {
        String sql = "DELETE FROM subjects WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
