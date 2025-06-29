package com.maiphuhai.service;

import com.maiphuhai.model.StudentBooking;
import com.maiphuhai.repository.StudentBookingRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class StudentBookingService {
    @Autowired
    private StudentBookingRepository repo;

    public int bookSession(int sessionId, int studentId) {
        if (repo.existsBySessionAndStudent(sessionId, studentId)) {
            throw new RuntimeException("Bạn đã đăng ký ca học này!");
        }
        StudentBooking booking = new StudentBooking();
        booking.setSessionId(sessionId);
        booking.setStudentId(studentId);
        booking.setStatus("booked");
        return repo.save(booking);
    }

    public List<StudentBooking> getBookingsByStudent(int studentId) {
        return repo.findByStudentId(studentId);
    }

    public List<StudentBooking> getBookingsBySession(int sessionId) {
        return repo.findBySessionId(sessionId);
    }

    public void cancelBooking(int bookingId) {
        repo.updateStatus(bookingId, "cancelled");
    }
}
