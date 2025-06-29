
package com.maiphuhai.repository;

import com.maiphuhai.model.StudentBooking;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class StudentBookingRepository {
    @Autowired
    private JdbcTemplate jdbc;

    private final RowMapper<StudentBooking> map = (ResultSet rs, int i) -> {
        StudentBooking booking = new StudentBooking();
        booking.setBookingId(rs.getInt("booking_id"));
        booking.setSessionId(rs.getInt("session_id"));
        booking.setStudentId(rs.getInt("student_id"));
        booking.setBookingTime(rs.getTimestamp("booking_time"));
        booking.setStatus(rs.getString("status"));
        return booking;
    };

    public int save(StudentBooking booking) {
        String sql = "INSERT INTO student_bookings (session_id, student_id, status) VALUES (?, ?, ?)";
        KeyHolder kh = new GeneratedKeyHolder();
        jdbc.update(con -> {
            PreparedStatement ps = con.prepareStatement(sql, new String[]{"booking_id"});
            ps.setInt(1, booking.getSessionId());
            ps.setInt(2, booking.getStudentId());
            ps.setString(3, booking.getStatus());
            return ps;
        }, kh);
        return kh.getKey().intValue();
    }

    public List<StudentBooking> findByStudentId(int studentId) {
        String sql = "SELECT * FROM student_bookings WHERE student_id = ?";
        return jdbc.query(sql, map, studentId);
    }

    public List<StudentBooking> findBySessionId(int sessionId) {
        String sql = "SELECT * FROM student_bookings WHERE session_id = ?";
        return jdbc.query(sql, map, sessionId);
    }

    public boolean existsBySessionAndStudent(int sessionId, int studentId) {
        String sql = "SELECT COUNT(*) FROM student_bookings WHERE session_id = ? AND student_id = ? AND status = 'booked'";
        Integer count = jdbc.queryForObject(sql, Integer.class, sessionId, studentId);
        return count != null && count > 0;
    }

    public void updateStatus(int bookingId, String status) {
        String sql = "UPDATE student_bookings SET status = ? WHERE booking_id = ?";
        jdbc.update(sql, status, bookingId);
    }
}
