package com.maiphuhai.repository;

import com.maiphuhai.model.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class SessionRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private Session mapRow(ResultSet rs, int rowNum) throws SQLException {
        Session session = new Session();
        session.setSession_id(rs.getInt("session_id"));
        session.setSession_code(rs.getString("session_code"));
        session.setTutor_id(rs.getInt("tutor_id"));
        session.setSubject_id(rs.getInt("subject_id"));
        session.setLocation(rs.getString("location"));
        session.setCapacity(rs.getInt("capacity"));
        session.setStatus(rs.getString("status"));
        session.setCreated_at(rs.getTimestamp("created_at"));
        return session;
    }

    public List<Session> findAll() {
        String sql = "SELECT * FROM sessions";
        return jdbcTemplate.query(sql, this::mapRow);
    }

    public Session findById(int id) {
        String sql = "SELECT * FROM sessions WHERE session_id = ?";
        return jdbcTemplate.queryForObject(sql, this::mapRow, id);
    }

    public void save(Session session) {
        String sql = "INSERT INTO sessions (session_code, tutor_id, subject_id, location, capacity, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, 
            session.getSession_code(),
            session.getTutor_id(),
            session.getSubject_id(),
            session.getLocation(),
            session.getCapacity(),
            session.getStatus(),
            session.getCreated_at()
        );
    }

    public void update(Session session) {
        String sql = "UPDATE sessions SET session_code = ?, tutor_id = ?, subject_id = ?, location = ?, capacity = ?, status = ?, created_at = ? WHERE session_id = ?";
        jdbcTemplate.update(sql, 
            session.getSession_code(),
            session.getTutor_id(),
            session.getSubject_id(),
            session.getLocation(),
            session.getCapacity(),
            session.getStatus(),
            session.getCreated_at(),
            session.getSession_id()
        );
    }

    public void delete(int id) {
        String sql = "DELETE FROM sessions WHERE session_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
