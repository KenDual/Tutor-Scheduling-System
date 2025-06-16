package com.maiphuhai.repository;

import com.maiphuhai.model.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class SessionRepository {

    @Autowired
    private JdbcTemplate jdbc;

    private final RowMapper<Session> mapper = (rs, rowNum) -> {
        Session s = new Session();
        s.setSessionId(rs.getInt("session_id"));
        s.setTutorId(rs.getInt("tutor_id"));
        s.setSubjectId(rs.getInt("subject_id"));
        s.setDay(rs.getString("day"));
        s.setSlot(rs.getString("slot"));
        s.setLocation(rs.getString("location"));
        s.setFee(rs.getDouble("fee"));
        s.setCapacity(rs.getInt("capacity"));
        s.setStatus(rs.getString("status"));
        s.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        s.setTutorName(rs.getString("tutor_name"));
        s.setSubjectName(rs.getString("subject_name"));
        s.setBooked(rs.getInt("booked"));
        return s;
    };

    public List<Session> findAll() {
        String sql = baseSelect();
        return jdbc.query(sql, mapper);
    }

    public Session findById(int id) {
        String sql = baseSelect() + " WHERE s.session_id = ?";
        return jdbc.queryForObject(sql, mapper, id);
    }

    public List<Session> findByTutor(int tutorId) {
        String sql = baseSelect() + " WHERE s.tutor_id = ? ORDER BY s.day, s.slot";
        return jdbc.query(sql, mapper, tutorId);
    }

    public void save(Session s) {
        String sql = "INSERT INTO sessions (tutor_id, subject_id, day, slot, location, fee, capacity, status) "
                + "VALUES (?,?,?,?,?,?,?,?)";
        jdbc.update(sql, s.getTutorId(), s.getSubjectId(), s.getDay(), s.getSlot(),
                s.getLocation(), s.getFee(), s.getCapacity(), s.getStatus());
    }

    public void update(Session s) {
        String sql = "UPDATE sessions SET tutor_id=?, subject_id=?, day=?, slot=?, location=?, "
                + "fee=?, capacity=?, status=? WHERE session_id=?";
        jdbc.update(sql, s.getTutorId(), s.getSubjectId(), s.getDay(), s.getSlot(),
                s.getLocation(), s.getFee(), s.getCapacity(), s.getStatus(), s.getSessionId());
    }

    public void delete(int id) {
        jdbc.update("DELETE FROM sessions WHERE session_id = ?", id);
    }

    public boolean existsByTutorDaySlot(int tutorId, String day, String slot) {
        String sql = "SELECT COUNT(*) FROM sessions WHERE tutor_id = ? AND day = ? AND slot = ?";
        Integer count = jdbc.queryForObject(sql, Integer.class, tutorId, day, slot);
        return count != null && count > 0;
    }

    private String baseSelect() {
        return "SELECT s.*, "
                + "       u.email           AS tutor_name, "
                + "       sub.name          AS subject_name, "
                + "       ISNULL(bk.booked,0) AS booked "
                + "FROM   sessions s "
                + "JOIN   tutors  t   ON s.tutor_id  = t.tutor_id "
                + "JOIN   users   u   ON t.tutor_id  = u.user_id "
                + "JOIN   subjects sub ON s.subject_id = sub.subject_id "
                + "LEFT JOIN ( "
                + "     SELECT session_id, COUNT(*) booked "
                + "     FROM   bookings GROUP BY session_id "
                + ") bk ON s.session_id = bk.session_id";
    }
}
