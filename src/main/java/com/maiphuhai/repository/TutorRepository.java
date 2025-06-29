package com.maiphuhai.repository;

import com.maiphuhai.model.Tutor;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    
    private Tutor mapRow(ResultSet rs, int rowNum) throws SQLException {
        Tutor e = new Tutor();
        e.setTutor_id(rs.getInt("tutor_id"));
        e.setEducation(rs.getString("education"));
        e.setProfile(rs.getString("profile"));
        e.setFee_default(rs.getDouble("fee_default"));
        return e;
    }
    
    public List<Tutor> findAll() {
        String sql = "SELECT * FROM tutors";
        return jdbcTemplate.query(sql, this::mapRow);
    }

    public Optional<Tutor> findById(int id) {
        String sql = "SELECT * FROM tutors WHERE tutor_id = ?";
        List<Tutor> tutors = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Tutor.class), id);
        return tutors.isEmpty() ? Optional.empty() : Optional.of(tutors.get(0));
    }
}