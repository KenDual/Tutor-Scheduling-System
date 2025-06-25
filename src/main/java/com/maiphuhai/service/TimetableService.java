
package com.maiphuhai.service;

import com.maiphuhai.model.Timetable;
import com.maiphuhai.repository.TimetableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TimetableService {
    @Autowired
    private TimetableRepository timetableRepository;

    public void save(Timetable timetable) {
        timetableRepository.save(timetable);
    }


    public void delete(int id) {
        timetableRepository.delete(id);
    }
    
    public boolean existsByDaySlotTutor(String dayOfWeek, int slot, int tutorId) {
        return timetableRepository.existsByDaySlotTutor(dayOfWeek, slot, tutorId);
    }
}
    
