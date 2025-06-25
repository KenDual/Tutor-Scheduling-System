package com.maiphuhai.service;

import com.maiphuhai.model.Session;
import com.maiphuhai.model.Timetable;
import com.maiphuhai.repository.SessionRepository;
import com.maiphuhai.repository.TimetableRepository;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SessionService {

    @Autowired
    private SessionRepository sessionRepository;
    private TimetableRepository timetableRepository;
    private TimetableService timetableService;

    public List<Session> findAll() {
        return sessionRepository.findAll();
    }

    public Session findById(int id) {
        return sessionRepository.findById(id);
    }

    public void save(Session session) {
        sessionRepository.save(session);
    }

    public void update(Session session) {
        sessionRepository.update(session);
    }

    public void delete(int id) {
        sessionRepository.delete(id);
    }

    public void registerSession(String day, int slot, int tutorId, String location, int subjectId) throws Exception {
        
        if (timetableService.existsByDaySlotTutor(day, slot, tutorId)) {
            throw new Exception("Ca học vào " + day + ", slot " + slot + " đã được đăng ký!");
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
        String sessionCode = "SESS" + sdf.format(new Date()) + tutorId;

        Session session = new Session();
        session.setSession_code(sessionCode);
        session.setTutor_id(tutorId);
        session.setSubject_id(subjectId);
        session.setLocation(location);
        session.setCapacity(10); // Mặc định
        session.setStatus("pending");
        session.setCreated_at(new Date());

        sessionRepository.save(session);

        Timetable timetable = new Timetable();
        timetable.setSession_id(session.getSession_id());
        timetable.setDay_of_week(day);
        timetable.setSlot(slot);
        timetable.setLocation(location);
        timetable.setStatus("pending");
        timetable.setCreate_at(new Date());

        timetableRepository.save(timetable);
    }
}
