package com.maiphuhai.repository;

import com.maiphuhai.model.StudyMaterial;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Repository
public class StudyMaterialRepository {

    private final JdbcTemplate jdbc;

    public StudyMaterialRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    /* ---------- RowMapper: đọc mọi cột ---------- */
    private static final RowMapper<StudyMaterial> MAPPER = new RowMapper<>() {
        @Override
        public StudyMaterial mapRow(ResultSet rs, int rowNum) throws SQLException {
            StudyMaterial m = new StudyMaterial();
            m.setMaterialId(rs.getInt("material_id"));
            m.setTitle(rs.getString("title"));
            m.setDescription(rs.getString("description"));
            m.setFileUrl(rs.getString("file_url"));
            m.setUploadedAt(rs.getTimestamp("uploaded_at"));   // Timestamp → Date
            return m;
        }
    };

    /* ---------- INSERT: ghi uploaded_at ---------- */
    public int save(StudyMaterial m) {
        String sql
                = "INSERT INTO study_materials"
                + "(title, description, file_url, uploaded_at)"
                + "VALUES (?,?,?,?)";
        return jdbc.update(sql,
                m.getTitle(),
                m.getDescription(),
                m.getFileUrl(),
                new Timestamp(m.getUploadedAt().getTime()));   // Date → Timestamp
    }

    /* ---------- SELECT helpers ---------- */
    public Optional<StudyMaterial> findById(int id) {
        String sql = "SELECT * FROM study_materials WHERE material_id = ?";
        List<StudyMaterial> list = jdbc.query(sql, MAPPER, id);
        return list.isEmpty() ? Optional.empty() : Optional.of(list.get(0));
    }

    public List<StudyMaterial> findAll() {
        String sql = "SELECT * FROM study_materials ORDER BY uploaded_at DESC";
        return jdbc.query(sql, MAPPER);
    }

    //NEW
    /**
     * Cập nhật metadata (title, description, file_url nếu có)
     */
    public int update(StudyMaterial m) {
        String sql = "UPDATE study_materials SET title = ?, description = ?"
                + (m.getFileUrl() != null ? ", file_url = ?" : "")
                + " WHERE material_id = ?";
        if (m.getFileUrl() != null) {
            return jdbc.update(sql,
                    m.getTitle(), m.getDescription(), m.getFileUrl(), m.getMaterialId());
        } else {
            return jdbc.update(sql,
                    m.getTitle(), m.getDescription(), m.getMaterialId());
        }
    }

    /**
     * Xóa theo ID
     */
    public int deleteById(int id) {
        return jdbc.update("DELETE FROM study_materials WHERE material_id = ?", id);
    }
}
