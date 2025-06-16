package com.maiphuhai.service;

import com.maiphuhai.model.Subject;
import com.maiphuhai.repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectService {

    @Autowired
    private SubjectRepository repo;

    public List<Subject> findAll() {
        return repo.findAll();
    }

    public Subject findById(int id) {
        return repo.findById(id);
    }

    public void save(Subject s) {
        repo.save(s);
    }

    public void update(Subject s) {
        repo.update(s);
    }

    public void delete(int id) {
        repo.delete(id);
    }
}
