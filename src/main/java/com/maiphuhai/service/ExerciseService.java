package com.maiphuhai.service;

import com.maiphuhai.model.Exercise;
import com.maiphuhai.repository.ExerciseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExerciseService {

    @Autowired
    private ExerciseRepository exerciseRepository;

    public List<Exercise> findAll() {
        return exerciseRepository.findAll();
    }

    public List<Exercise> getBySessionId(int sessionId) {
        return exerciseRepository.findAllBySessionId(sessionId);
    }

    public Exercise getById(int id) {
        return exerciseRepository.findById(id);
    }

    public void add(Exercise e) {
        exerciseRepository.save(e);
    }

    public void update(Exercise e) {
        exerciseRepository.update(e);
    }

    public void delete(int id) {
        exerciseRepository.delete(id);
    }
}
