package com.maiphuhai.model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * POJO khớp bảng study_materials (giữ nguyên cấu trúc DB gốc).
 * Không ràng buộc khóa ngoại, chỉ cung cấp các trường cột có sẵn.
 */
public class StudyMaterial {
    private int materialId;          // material_id (PK)
    private String title;
    private String description;
    private String fileUrl;
    private Date uploadedAt;

    public StudyMaterial() {}

    public StudyMaterial(int materialId, String title, String description, String fileUrl, Date uploadedAt) {
        this.materialId = materialId;
        this.title = title;
        this.description = description;
        this.fileUrl = fileUrl;
        this.uploadedAt = uploadedAt;
    }

    public int getMaterialId() {
        return materialId;
    }

    public void setMaterialId(int materialId) {
        this.materialId = materialId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public Date getUploadedAt() {
        return uploadedAt;
    }

    public void setUploadedAt(Date uploadedAt) {
        this.uploadedAt = uploadedAt;
    }

   
}

