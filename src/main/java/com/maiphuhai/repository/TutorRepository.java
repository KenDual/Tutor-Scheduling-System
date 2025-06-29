
package com.maiphuhai.repository;

import com.maiphuhai.model.Tutor;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TutorRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Optional<Tutor> findById(int id) {
        String sql = "SELECT * FROM tutors WHERE tutor_id = ?";
        List<Tutor> tutors = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Tutor.class), id);
        return tutors.isEmpty() ? Optional.empty() : Optional.of(tutors.get(0));
    }
}