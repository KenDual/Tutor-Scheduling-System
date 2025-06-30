package com.maiphuhai.repository;

import com.maiphuhai.model.Exercise;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class ExerciseRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private Exercise mapRow(ResultSet rs, int rowNum) throws SQLException {
        Exercise e = new Exercise();
        e.setExerciseId(rs.getInt("exercise_id"));
        e.setSessionId(rs.getInt("session_id"));
        e.setTitle(rs.getString("title"));
        e.setDescription(rs.getString("description"));
        if (rs.getTimestamp("due_date") != null) {
            e.setDueDate(rs.getTimestamp("due_date").toLocalDateTime().toString());
        }
        return e;
    }

    public List<Exercise> findAll() {
        String sql = "SELECT * FROM exercises";
        return jdbcTemplate.query(sql, this::mapRow);
    }

    public List<Exercise> findAllBySessionId(int sessionId) {
        String sql = "SELECT * FROM exercises WHERE session_id = ?";
        return jdbcTemplate.query(sql, this::mapRow, sessionId);
    }

    public Exercise findById(int id) {
        String sql = "SELECT * FROM exercises WHERE exercise_id = ?";
        return jdbcTemplate.queryForObject(sql, this::mapRow, id);
    }

    // Trong ExerciseRepsository.java
    public List<Exercise> findByTutorId(int tutorId) {
        String sql = "SELECT e.* FROM exercises e "
                + "JOIN sessions s ON e.session_id = s.session_id "
                + "WHERE s.tutor_id = ?";
        return jdbcTemplate.query(sql, this::mapRow, tutorId);
    }

    public void save(Exercise e) {
        String sql = "INSERT INTO exercises (session_id, title, description, due_date) VALUES (?, ?, ?, ?)";

        LocalDateTime dueDateTime = null;
        if (e.getDueDate() != null && !e.getDueDate().isEmpty()) {
            dueDateTime = LocalDateTime.parse(e.getDueDate());
        }
        jdbcTemplate.update(sql,
                e.getSessionId(),
                e.getTitle(),
                e.getDescription(),
                e.getDueDate() != null ? Timestamp.valueOf(e.getDueDate()) : null
        );
    }

    public void update(Exercise e) {
        String sql = "UPDATE exercises SET session_id = ?, title = ?, description = ?, due_date = ? WHERE exercise_id = ?";

        // Chuyển đổi String sang LocalDateTime
        LocalDateTime dueDateTime = null;
        if (e.getDueDate() != null && !e.getDueDate().isEmpty()) {
            dueDateTime = LocalDateTime.parse(e.getDueDate());
        }
        jdbcTemplate.update(sql,
                e.getSessionId(),
                e.getTitle(),
                e.getDescription(),
                e.getDueDate() != null ? Timestamp.valueOf(e.getDueDate()) : null,
                e.getExerciseId()
        );
    }

    public void delete(int id) {
        String sql = "DELETE FROM exercises WHERE exercise_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
