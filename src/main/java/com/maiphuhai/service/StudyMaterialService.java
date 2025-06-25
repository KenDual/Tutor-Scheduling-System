package com.maiphuhai.service;

import com.maiphuhai.model.StudyMaterial;
import com.maiphuhai.repository.StudyMaterialRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class StudyMaterialService {

    private final StudyMaterialRepository repo;

    public StudyMaterialService(StudyMaterialRepository repo) {
        this.repo = repo;
    }

    // ---------- giáo viên upload ----------
    public void upload(StudyMaterial material) {
        material.setUploadedAt(new Date());
        repo.save(material);
    }

    // ---------- xem tất cả ----------
    public List<StudyMaterial> listAll() {
        return repo.findAll();
    }

    // ---------- lấy chi tiết ----------
    public StudyMaterial getById(int id) {
        return repo.findById(id).orElse(null);
    }
}
