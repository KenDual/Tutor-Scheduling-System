package com.maiphuhai.repository;

import com.maiphuhai.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserRepository {

    @Autowired
    private JdbcTemplate jdbc;

    private static final String SQL_INSERT = "INSERT INTO users(email, password, role, full_name, phone) VALUES (?,?,?,?,?)";
    private static final String SQL_SELECT_BY_ID = "SELECT * FROM users WHERE user_id = ?";
    private static final String SQL_SELECT_BY_EMAIL_ROLE_PWD = "SELECT * FROM users WHERE email = ? AND password = ? AND role = ?";
    private static final String SQL_SELECT_BY_EMAIL = "SELECT * FROM users WHERE email = ?";
    private static final String SQL_UPDATE = "UPDATE users SET email=?, password=?, role=?, full_name=?, phone=? WHERE user_id=?";
    private static final String SQL_DELETE = "DELETE FROM users WHERE user_id = ?";

    private final RowMapper<User> mapper = new RowMapper<User>() {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User u = new User();
            u.setUser_id(rs.getInt("user_id"));
            u.setEmail(rs.getString("email"));
            u.setPassword(rs.getString("password"));
            u.setRole(rs.getString("role"));
            u.setFull_name(rs.getString("full_name"));
            u.setPhone(rs.getString("phone"));
            u.setCreate_at(rs.getTimestamp("create_at").toLocalDateTime());
            return u;
        }
    };

    // --- CRUD ---
    public int save(User u) {
        return jdbc.update(SQL_INSERT, u.getEmail(), u.getPassword(), u.getRole(), u.getFull_name(), u.getPhone());
    }

    public List<User> findAll() {
        String sql = "SELECT * FROM users";
        return jdbc.query(sql, mapper);
    }

    public Optional<User> findById(int id) {
        try {
            List<User> list = jdbc.query(SQL_SELECT_BY_ID, mapper, id);
            return list.isEmpty() ? Optional.empty() : Optional.of(list.get(0));
        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }

    public Optional<User> findByEmail(String email) {
        List<User> list = jdbc.query(SQL_SELECT_BY_EMAIL, mapper, email);
        return list.isEmpty() ? Optional.empty() : Optional.of(list.get(0));
    }

    public Optional<User> findByCredentials(String email, String password, String role) {
        List<User> list = jdbc.query(SQL_SELECT_BY_EMAIL_ROLE_PWD, mapper, email, password, role);
        return list.isEmpty() ? Optional.empty() : Optional.of(list.get(0));
    }

    public void update(User user) {
        String sql = "UPDATE users SET email=?, password=?, role=?, full_name=?, phone=? WHERE user_id=?";
        jdbc.update(sql, user.getEmail(), user.getPassword(), user.getRole(), user.getFull_name(), user.getPhone(), user.getUser_id());
    }

    @Transactional
    public int delete(int id) {
        Optional<User> userOpt = findById(id);
        if (userOpt.isEmpty()) {
            return 0;
        }
        User user = userOpt.get();

        if ("tutor".equals(user.getRole())) {
            // Xóa exercises liên quan
            jdbc.update("DELETE FROM exercises WHERE session_id IN (SELECT session_id FROM sessions WHERE tutor_id = ?)", id);

            // Xóa student_bookings liên quan
            jdbc.update("DELETE FROM student_bookings WHERE session_id IN (SELECT session_id FROM sessions WHERE tutor_id = ?)", id);

            // Xóa sessions
            jdbc.update("DELETE FROM sessions WHERE tutor_id = ?", id);

            // Xóa tutor
            jdbc.update("DELETE FROM tutors WHERE tutor_id = ?", id);
        } else if ("student".equals(user.getRole())) {
            // Xóa student_bookings
            jdbc.update("DELETE FROM student_bookings WHERE student_id = ?", id);

            // Xóa student
            jdbc.update("DELETE FROM students WHERE student_id = ?", id);
        }

        // Cuối cùng xóa user
        return jdbc.update(SQL_DELETE, id);
    }

    private static final String SQL_UPDATE_PASSWORD_BY_EMAIL
            = "UPDATE users SET password=? WHERE email=?";

    public int updatePasswordByEmail(String email, String newPwd) {
        return jdbc.update(SQL_UPDATE_PASSWORD_BY_EMAIL, newPwd, email);
    }

    public int saveOrUpdate(User u) {
        if (u.getUser_id() == 0) {
            // Tạo mới
            return jdbc.update(SQL_INSERT, u.getEmail(), u.getPassword(), u.getRole(), u.getFull_name(), u.getPhone());
        } else {
            // Cập nhật
            return jdbc.update(SQL_UPDATE, u.getEmail(), u.getPassword(), u.getRole(), u.getFull_name(), u.getPhone(), u.getUser_id());
        }
    }
}
