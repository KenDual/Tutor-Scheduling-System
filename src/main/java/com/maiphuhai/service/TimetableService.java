package com.maiphuhai.service;

import com.maiphuhai.repository.TimetableRepository;
import com.maiphuhai.model.Timetable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TimetableService {

    @Autowired
    private TimetableRepository repo;

    public void create(Timetable t) {
        repo.save(t);
    }

    public void delete(int id) {
        repo.delete(id);
    }

    public boolean tutorHasConflict(String day, int slot, int tutorId) {
        return repo.existsByDaySlotTutor(day, slot, tutorId);
    }
}
