
package com.maiphuhai.service;

import com.maiphuhai.model.Subject;
import com.maiphuhai.repository.SubjectRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubjectService {
    
    @Autowired
    private SubjectRepository subjectRepository;
    
    public List<Subject> findAll() {
        return subjectRepository.findAll();
    }

    public Subject findById(int id) {
        return subjectRepository.findById(id);
    }

    public void save(Subject subject) {
        subjectRepository.save(subject);
    }

    public void update(Subject subject) {
        subjectRepository.update(subject);
    }

    public void delete(int id) {
        subjectRepository.delete(id);
    }
}
