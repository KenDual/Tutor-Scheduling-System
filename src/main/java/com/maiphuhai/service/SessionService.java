package com.maiphuhai.service;

import com.maiphuhai.model.Session;
import com.maiphuhai.repository.SessionRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SessionService {

    @Autowired
    private SessionRepository repo;

    public boolean exists(int tutorId, String day, String slot) {
        return repo.existsByTutorDaySlot(tutorId, day, slot);
    }

    /* Nếu muốn trả về đối tượng sau khi lưu (lấy sessionId) */
    public Session saveAndReturn(Session s) {
        repo.save(s);
        return repo.findById(
                repo.findByTutor(s.getTutorId())
                        .stream()
                        .filter(x -> x.getDay().equals(s.getDay()) && x.getSlot().equals(s.getSlot()))
                        .findFirst().get().getSessionId());
    }

    public List<Session> getAll() {
        return repo.findAll();
    }

    public Session getById(int id) {
        return repo.findById(id);
    }

    public List<Session> getByTutor(int tid) {
        return repo.findByTutor(tid);
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

    public boolean existsByTutorDaySlot(int tutorId, String day, String slot) {
        return repo.existsByTutorDaySlot(tutorId, day, slot);
    }
}
