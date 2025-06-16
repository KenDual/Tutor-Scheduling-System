
package com.maiphuhai.service;

import com.maiphuhai.model.Subject;
import com.maiphuhai.repository.SubjectRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class SubjectService {
    private final SubjectRepository repo;

    public SubjectService(SubjectRepository repo) {
        this.repo = repo;
    }

    public List<Subject> findAll() {
        return repo.findAll();
    }
}
