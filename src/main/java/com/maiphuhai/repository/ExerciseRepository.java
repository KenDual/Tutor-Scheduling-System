package com.maiphuhai.repository;

import com.maiphuhai.model.Exercise;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        if (rs.getDate("due_date") != null) {
            e.setDueDate(rs.getDate("due_date").toLocalDate());
        }
        return e;
    }

    public List<Exercise> findAllBySessionId(int sessionId) {
        String sql = "SELECT * FROM exercises WHERE session_id = ?";
        return jdbcTemplate.query(sql, this::mapRow, sessionId);
    }

    public Exercise findById(int id) {
        String sql = "SELECT * FROM exercises WHERE exercise_id = ?";
        return jdbcTemplate.queryForObject(sql, this::mapRow, id);
    }

    public void save(Exercise e) {
        String sql = "INSERT INTO exercises (session_id, title, description, due_date) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql,
            e.getSessionId(),
            e.getTitle(),
            e.getDescription(),
            e.getDueDate() != null ? Date.valueOf(e.getDueDate()) : null
        );
    }

    public void update(Exercise e) {
        String sql = "UPDATE exercises SET title = ?, description = ?, due_date = ? WHERE exercise_id = ?";
        jdbcTemplate.update(sql,
            e.getTitle(),
            e.getDescription(),
            e.getDueDate() != null ? Date.valueOf(e.getDueDate()) : null,
            e.getExerciseId()
        );
    }

    public void delete(int id) {
        String sql = "DELETE FROM exercises WHERE exercise_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
