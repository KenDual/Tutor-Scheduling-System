package com.maiphuhai.service;

import com.maiphuhai.model.Session;
import com.maiphuhai.model.Subject;
import com.maiphuhai.repository.SessionRepository;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class SessionService {

    @Autowired
    private SessionRepository repo;
    @Autowired
    private SubjectService subjectService;

    public int getScheduledSessionCount() {
        return repo.findScheduled().size();
    }

    public List<Session> getSessionsForStudent(int studentId) {
        return repo.findByStudent(studentId);
    }

    public List<Session> findAll() {
        return repo.findAll();
    }

    public List<Session> ofStudent(int sid) {
        return repo.findByStudent(sid);
    }

    public List<Session> ofTutor(int tid) {
        return repo.findByTutor(tid);
    }

    public List<Session> ofAdmin() {
        return repo.findAllWithJoin();
    }

    public List<Session> findByTutor(int tutorId) {
        return repo.findByTutor(tutorId);
    }
    
    public List<Session> findScheduled() {
        List<Session> list = repo.findScheduled();
        Map<Integer, String> subMap = subjectService.findAll()
                .stream()
                .collect(Collectors.toMap(
                        Subject::getSubject_id,
                        Subject::getName));
        list.forEach(s
                -> s.setSubjectName(subMap.get(s.getSubject_id()))
        );
        return list;
    }

    public void register(String day, int slot, int tutorId,
            int subjectId, String location) throws Exception {
        if (repo.existsByDaySlotTutor(day, slot, tutorId)) {
            throw new Exception("Tutor đã có ca vào " + day + " - slot " + slot);
        }

        Session s = new Session();
        s.setSession_code("SE" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
        s.setTutor_id(tutorId);
        s.setSubject_id(subjectId);
        s.setDay_of_week(day);
        s.setSlot(slot);
        s.setLocation(location);
        s.setCapacity(10);
        s.setStatus("scheduled");

        int id = repo.save(s);
        s.setSession_id(id);
    }

    public void cancel(int id) {
        Session s = repo.findById(id);
        s.setStatus("cancelled");
        repo.update(s);
    }

    public boolean existsByDaySlotTutor(String day, int slot, int tutorId) {
        return repo.existsByDaySlotTutor(day, slot, tutorId);
    }

    public void deleteSession(int sessionId) {
        Session session = repo.findById(sessionId);
        if (session == null) {
            throw new EmptyResultDataAccessException("Session not found with ID: " + sessionId, 1);
        }
        repo.delete(sessionId);
    }
}
