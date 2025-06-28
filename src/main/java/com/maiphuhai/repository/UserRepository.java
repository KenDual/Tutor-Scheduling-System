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

    public Optional<User> findById(int id) {
        List<User> list = jdbc.query(SQL_SELECT_BY_ID, mapper, id);
        return list.isEmpty() ? Optional.empty() : Optional.of(list.get(0));
    }

    public Optional<User> findByEmail(String email) {
        List<User> list = jdbc.query(SQL_SELECT_BY_EMAIL, mapper, email);
        return list.isEmpty() ? Optional.empty() : Optional.of(list.get(0));
    }

    public Optional<User> findByCredentials(String email, String password, String role) {
        List<User> list = jdbc.query(SQL_SELECT_BY_EMAIL_ROLE_PWD, mapper, email, password, role);
        return list.isEmpty() ? Optional.empty() : Optional.of(list.get(0));
    }

    public int update(User u) {
        return jdbc.update(SQL_UPDATE, u.getEmail(), u.getPassword(), u.getRole(), u.getFull_name(), u.getPhone(), u.getUser_id());
    }

    public int delete(int id) {
        return jdbc.update(SQL_DELETE, id);
    }

    private static final String SQL_UPDATE_PASSWORD_BY_EMAIL
            = "UPDATE users SET password=? WHERE email=?";

    public int updatePasswordByEmail(String email, String newPwd) {
        return jdbc.update(SQL_UPDATE_PASSWORD_BY_EMAIL, newPwd, email);
    }
}
