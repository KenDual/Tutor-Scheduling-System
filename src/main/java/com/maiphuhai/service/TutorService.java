package com.maiphuhai.service;

import com.maiphuhai.model.Tutor;
import com.maiphuhai.repository.TutorRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TutorService {

    @Autowired
    private TutorRepository tutorRepository;
    
    public List<Tutor> findAll() {
        return tutorRepository.findAll();
    }

    public Optional<Tutor> findById(int id) {
        return tutorRepository.findById(id);
    }
}
