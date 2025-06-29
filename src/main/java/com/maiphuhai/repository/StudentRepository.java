package com.maiphuhai.repository;

import com.maiphuhai.model.Student;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StudentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    private Student mapRow(ResultSet rs, int rowNum) throws SQLException {
        Student e = new Student();
        e.setStudent_id(rs.getInt("student_id"));
        e.setGrade_level(rs.getString("grade_level"));
        e.setLearning_goal(rs.getString("learning_goal"));
        return e;
    }
    
    public List<Student> findAll() {
        String sql = "SELECT * FROM students";
        return jdbcTemplate.query(sql, this::mapRow);
    }

    public Optional<Student> findById(int id) {
        String sql = "SELECT * FROM students WHERE student_id = ?";
        List<Student> students = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Student.class), id);
        return students.isEmpty() ? Optional.empty() : Optional.of(students.get(0));
    }
}