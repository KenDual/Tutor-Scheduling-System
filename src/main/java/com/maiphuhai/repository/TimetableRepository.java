package com.maiphuhai.repository;

import com.maiphuhai.model.Timetable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class TimetableRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private Timetable mapRow(ResultSet rs, int rowNum) throws SQLException {
        Timetable timetable = new Timetable();
        timetable.setTimetable_id(rs.getInt("timetable_id"));
        timetable.setSession_id(rs.getInt("session_id"));
        timetable.setDay_of_week(rs.getString("day_of_week"));
        timetable.setSlot(rs.getInt("slot"));
        timetable.setLocation(rs.getString("location"));
        timetable.setStatus(rs.getString("status"));
        timetable.setCreate_at(rs.getTimestamp("create_at"));
        return timetable;
    }

    public void save(Timetable timetable) {
        String sql = "INSERT INTO timetable (session_id, day_of_week, slot, start_time, end_time, location, status, create_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
            timetable.getSession_id(),
            timetable.getDay_of_week(),
            timetable.getSlot(),
            timetable.getLocation(),
            timetable.getStatus(),
            timetable.getCreate_at()
        );
    }
    
    public void delete(int id) {
        String sql = "DELETE FROM timetable WHERE session_id = ?";
        jdbcTemplate.update(sql, id);
    }

    // Kiểm tra xem ca học đã tồn tại hay chưa
    public boolean existsByDaySlotTutor(String dayOfWeek, int slot, int tutorId) {
        String sql = "SELECT COUNT(*) FROM timetable t JOIN sessions s ON t.session_id = s.session_id " +
                     "WHERE t.day_of_week = ? AND t.slot = ? AND s.tutor_id = ?";
        int count = jdbcTemplate.queryForObject(sql, Integer.class, dayOfWeek, slot, tutorId);
        return count > 0;
    }
}
