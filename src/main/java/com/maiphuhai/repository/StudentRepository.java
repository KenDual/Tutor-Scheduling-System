/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.maiphuhai.repository;

import com.maiphuhai.model.Student;
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

    public Optional<Student> findById(int id) {
        String sql = "SELECT * FROM students WHERE student_id = ?";
        List<Student> students = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Student.class), id);
        return students.isEmpty() ? Optional.empty() : Optional.of(students.get(0));
    }
}