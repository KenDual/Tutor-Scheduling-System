package com.maiphuhai.service;

import com.maiphuhai.model.StudyMaterial;
import com.maiphuhai.repository.StudyMaterialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class StudyMaterialService {

    private final StudyMaterialRepository repo;

    @Autowired
    public StudyMaterialService(StudyMaterialRepository repo) {
        this.repo = repo;
    }

    public void upload(StudyMaterial material) {
        material.setUploadedAt(new Date());
        repo.save(material);
    }

    public List<StudyMaterial> listAll() {
        return repo.findAll();
    }

    public StudyMaterial getById(int id) {
        return repo.findById(id)
                .orElseThrow(()
                        -> new RuntimeException("Không tìm thấy tài liệu với id=" + id));
    }

    public void update(StudyMaterial material) {
        material.setUploadedAt(new Date());
        repo.update(material);
    }

    public void delete(int id) {
        repo.deleteById(id);
    }
}
