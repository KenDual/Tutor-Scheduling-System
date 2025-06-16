package com.maiphuhai.repository;

import com.maiphuhai.model.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class SessionRepository {

    @Autowired
    private JdbcTemplate jdbc;

    /* ----------------------------------------------------------------
     * RowMapper: ánh xạ cột gốc + cột JOIN
     * ---------------------------------------------------------------- */
    private final RowMapper<Session> mapper = new RowMapper<Session>() {
        @Override
        public Session mapRow(ResultSet rs, int rowNum) throws SQLException {
            Session s = new Session();
            s.setSessionId(rs.getInt("session_id"));
            s.setTutorId(rs.getInt("tutor_id"));
            s.setSubjectId(rs.getInt("subject_id"));
            s.setDay(rs.getString("day"));
            s.setSlot(rs.getString("slot"));
            s.setStatus(rs.getString("status"));

            /* bổ sung từ JOIN  (nếu bạn có các field này trong model) */
            s.setTutorName(rs.getString("tutor_name"));
            s.setSubjectName(rs.getString("subject_name"));
            s.setBooked(rs.getInt("booked"));
            return s;
        }
    };

    public void delete(int id) {
        jdbc.update("DELETE FROM sessions WHERE session_id = ?", id);
    }

    public Session findById(int id) {
        String sql = baseSelect() + " WHERE s.session_id = ?";
        return jdbc.queryForObject(sql, mapper, id);
    }

    public List<Session> findAll() {
        String sql = baseSelect() + " ORDER BY s.day, s.slot";
        return jdbc.query(sql, mapper);
    }

    public List<Session> findByTutor(int tutorId) {
        String sql = baseSelect()
                + " WHERE s.tutor_id = ? "
                + " ORDER BY s.day, s.slot";
        return jdbc.query(sql, mapper, tutorId);
    }

    public boolean existsByTutorDaySlot(int tutorId, String day, String slot) {
        String sql = "SELECT COUNT(*) FROM sessions "
                + "WHERE tutor_id = ? AND day = ? AND slot = ?";
        Integer cnt = jdbc.queryForObject(sql, Integer.class, tutorId, day, slot);
        return cnt != null && cnt > 0;
    }

    private String baseSelect() {
        return "SELECT  s.*, "
                + "        u.email              AS tutor_name, "
                + "        sub.name             AS subject_name, "
                + "        ISNULL(bk.booked,0)  AS booked "
                + "FROM    sessions s "
                + "JOIN    tutors   t  ON s.tutor_id  = t.tutor_id "
                + "JOIN    users    u  ON t.tutor_id  = u.user_id "
                + "JOIN    subjects sub ON s.subject_id = sub.subject_id "
                + "LEFT JOIN ( "
                + "     SELECT session_id, COUNT(*) AS booked "
                + "     FROM   bookings "
                + "     GROUP  BY session_id "
                + ") bk ON s.session_id = bk.session_id";
    }

    public void updateStatus(int id, String status) {
        String sql = "UPDATE sessions SET status = ? WHERE session_id = ?";
        jdbc.update(sql, status, id);
    }


    public void save(Session s) {
        String sql = "INSERT INTO sessions "
                + "(tutor_id, subject_id, day, slot, status) "
                + "VALUES (?,?,?,?,?)";
        jdbc.update(sql,
                s.getTutorId(),
                s.getSubjectId(),
                s.getDay(),
                s.getSlot(),
                s.getStatus());
    }

    /* SỬA lại phương thức update (không còn location/fee/capacity) */
    public void update(Session s) {
        String sql = "UPDATE sessions SET "
                + "tutor_id = ?, subject_id = ?, day = ?, slot = ?, status = ? "
                + "WHERE session_id = ?";
        jdbc.update(sql,
                s.getTutorId(),
                s.getSubjectId(),
                s.getDay(),
                s.getSlot(),
                s.getStatus(),
                s.getSessionId());
    }

}
