package com.maiphuhai.repository;

import com.maiphuhai.model.Timetable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class TimetableRepository {

    @Autowired private JdbcTemplate jdbc;

    /* ---------- RowMapper ---------- */
    private final RowMapper<Timetable> map = (rs, i) -> {
        Timetable t = new Timetable();
        t.setTimetable_id(rs.getInt("timetable_id"));
        t.setSession_id(rs.getInt("session_id"));
        t.setDay_of_week(rs.getString("day_of_week"));
        t.setSlot(rs.getInt("slot"));
        t.setLocation(rs.getString("location"));
        t.setStatus(rs.getString("status"));
        t.setCreate_at(rs.getTimestamp("create_at").toLocalDateTime());
        return t;
    };

    /* ---------- INSERT ---------- */
    public void save(Timetable t){
        String sql = "INSERT INTO timetable (session_id, day_of_week, slot, location, status) VALUES (?,?,?,?,?)";
        jdbc.update(sql,
            t.getSession_id(),
            t.getDay_of_week(),
            t.getSlot(),
            t.getLocation(),
            t.getStatus()
        );
    }

    /* ---------- DELETE theo khóa chính ---------- */
    public void delete(int timetableId){
        jdbc.update("DELETE FROM timetable WHERE timetable_id=?", timetableId);
    }

    /* ---------- Ràng buộc trùng lịch ---------- */
    public boolean existsByDaySlotTutor(String day,int slot,int tutorId){
        String sql = "SELECT COUNT(*) FROM timetable t JOIN sessions s ON t.session_id=s.session_id WHERE t.day_of_week=? AND t.slot=? AND s.tutor_id=? AND t.status<>'cancelled'";
        Integer c = jdbc.queryForObject(sql, Integer.class, day, slot, tutorId);
        return c!=null && c>0;
    }
}
