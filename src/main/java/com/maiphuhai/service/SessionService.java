package com.maiphuhai.service;

import com.maiphuhai.model.Session;
import com.maiphuhai.repository.SessionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SessionService {

    @Autowired
    private SessionRepository repo;

    public List<Session> getAll() {
        return repo.findAll();
    }

    public Session getById(int id) {
        return repo.findById(id);
    }

    public List<Session> getByTutor(int tutorId) {
        return repo.findByTutor(tutorId);
    }

    public void add(Session s) {
        repo.save(s);
    }

    public void update(Session s) {
        repo.update(s);
    }

    public void delete(int id) {
        repo.delete(id);
    }


    public void updateStatus(int id, String status) {
        repo.updateStatus(id, status);
    }

    public boolean existsByTutorDaySlot(int tutorId, String day, String slot) {
        return repo.existsByTutorDaySlot(tutorId, day, slot);
    }
}
