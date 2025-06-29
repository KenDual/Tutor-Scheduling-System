package com.maiphuhai.repository;

import com.maiphuhai.model.Session;
import java.sql.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.*;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class SessionRepository {

    @Autowired
    private JdbcTemplate jdbc;

    /* ---------- RowMapper (kèm subjectName & tutorName) ---------- */
    private final RowMapper<Session> map = (ResultSet rs, int i) -> {
        Session s = new Session();
        s.setSession_id(rs.getInt("session_id"));
        s.setSession_code(rs.getString("session_code"));
        s.setTutor_id(rs.getInt("tutor_id"));
        s.setSubject_id(rs.getInt("subject_id"));
        s.setDay_of_week(rs.getString("day_of_week"));
        s.setSlot(rs.getInt("slot"));
        s.setLocation(rs.getString("location"));
        s.setCapacity(rs.getInt("capacity"));
        s.setStatus(rs.getString("status"));
        s.setCreated_at(rs.getTimestamp("created_at"));
        try {
            s.setSubjectName(rs.getString("subjectName"));
        } catch (SQLException ignore) {
        }
        try {
            s.setTutorName(rs.getString("tutorName"));
        } catch (SQLException ignore) {
        }
        return s;
    };

    /* ---------- Câu SELECT có JOIN ---------- */
    private static final String SELECT_JOIN = "SELECT s.*, sub.name AS subjectName,u.full_name AS tutorName FROM sessions s JOIN subjects sub ON sub.subject_id = s.subject_id JOIN   tutors   t   ON t.tutor_id     = s.tutor_id JOIN   users    u   ON u.user_id      = t.tutor_id";

    /* ---------- save() (không đổi) ---------- */
    public int save(Session s) {
        String sql = "INSERT INTO sessions(session_code,tutor_id,subject_id,day_of_week,slot,location,capacity,status) VALUES (?,?,?,?,?,?,?,?)";
        KeyHolder kh = new GeneratedKeyHolder();
        jdbc.update(con -> {
            PreparedStatement ps = con.prepareStatement(sql, new String[]{"session_id"});
            ps.setString(1, s.getSession_code());
            ps.setInt(2, s.getTutor_id());
            ps.setInt(3, s.getSubject_id());
            ps.setString(4, s.getDay_of_week());
            ps.setInt(5, s.getSlot());
            ps.setString(6, s.getLocation());
            ps.setInt(7, s.getCapacity());
            ps.setString(8, s.getStatus());
            return ps;
        }, kh);
        return kh.getKey().intValue();
    }

    /* ---------- Truy vấn ---------- */
    public List<Session> findAll() {
        return jdbc.query(SELECT_JOIN, map);
    }

    public Session findById(int id) {
        return jdbc.queryForObject(SELECT_JOIN + " WHERE s.session_id=?", map, id);
    }

    public List<Session> findByTutor(int tutorId) {
        return jdbc.query(SELECT_JOIN + " WHERE s.tutor_id=?", map, tutorId);
    }

    public List<Session> findScheduled() {
        return jdbc.query(SELECT_JOIN + " WHERE s.status='scheduled'", map);
    }

    /* ---------- update / delete ---------- */
    public void update(Session s) {
        String sql = "UPDATE sessions SET subject_id=?,day_of_week=?,slot=?,location=?,capacity=?,status=? WHERE session_id=?";
        jdbc.update(sql, s.getSubject_id(), s.getDay_of_week(), s.getSlot(),
                s.getLocation(), s.getCapacity(), s.getStatus(),
                s.getSession_id());
    }

    public void delete(int id) {
        jdbc.update("DELETE FROM sessions WHERE session_id=?", id);
    }

    /* ---------- chống trùng ca ---------- */
    public boolean existsByDaySlotTutor(String day, int slot, int tutorId) {
        String sql = "SELECT COUNT(*) FROM sessions WHERE day_of_week=? AND slot=? AND tutor_id=? AND status<>'cancelled'";
        return jdbc.queryForObject(sql, Integer.class, day, slot, tutorId) > 0;
    }

    /* Ca của một STUDENT (đã book) */
    public List<Session> findByStudent(int stuId) {
        String sql = SELECT_JOIN
                + " JOIN student_bookings b ON b.session_id = s.session_id"
                + " WHERE b.student_id=? AND b.status='booked'";
        return jdbc.query(sql, map, stuId);
    }

    /* Tất cả ca của hệ thống (admin) */
    public List<Session> findAllWithJoin() {      // đã có SELECT_JOIN
        return jdbc.query(SELECT_JOIN, map);
    }
}
