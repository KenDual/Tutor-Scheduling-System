package com.maiphuhai.controller;

import com.maiphuhai.model.StudentBooking;
import com.maiphuhai.model.User;
import com.maiphuhai.service.SessionService;
import com.maiphuhai.service.StudentBookingService;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
@RequestMapping("/sessions")
public class SessionController {

    @Autowired
    private SessionService sessionService;
    
    @Autowired
    private StudentBookingService studentBookingService;

    @PostMapping("/register")
    public String registerSession(@RequestParam String day,
            @RequestParam int slot,
            @RequestParam int subjectId,
            HttpSession session) throws Exception {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null || !"tutor".equals(currentUser.getRole())) {
            return "redirect:/login";
        }

        int tutorId = currentUser.getUser_id();
        if (sessionService.existsByDaySlotTutor(day, slot, tutorId)) {
            return "redirect:/timetable-tutor?error=Session already exists for this day and slot";
        }

        sessionService.register(day, slot, tutorId, subjectId, "Default Location");
        return "redirect:/timetable-tutor?success=Session registered successfully";
    }
    
    //Student Booking
    @Autowired
    private StudentBookingService service;

    @PostMapping("/book")
    @ResponseBody
    public ResponseEntity<Map<String, String>> bookSession(@RequestParam int sessionId, @RequestParam int studentId) {
        Map<String, String> response = new HashMap<>();
        try {
            int bookingId = service.bookSession(sessionId, studentId);
            response.put("status", "success");
            response.put("message", "Đăng ký ca học thành công!");
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            response.put("status", "error");
            response.put("message", e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

    @GetMapping("/student/{studentId}")
    @ResponseBody
    public ResponseEntity<List<StudentBooking>> getBookingsByStudent(@PathVariable int studentId) {
        List<StudentBooking> bookings = service.getBookingsByStudent(studentId);
        return ResponseEntity.ok(bookings);
    }

    @GetMapping("/session/{sessionId}")
    @ResponseBody
    public ResponseEntity<List<StudentBooking>> getBookingsBySession(@PathVariable int sessionId) {
        List<StudentBooking> bookings = service.getBookingsBySession(sessionId);
        return ResponseEntity.ok(bookings);
    }

    @PostMapping("/cancel")
    @ResponseBody
    public ResponseEntity<Map<String, String>> cancelBooking(@RequestParam int bookingId) {
        Map<String, String> response = new HashMap<>();
        try {
            service.cancelBooking(bookingId);
            response.put("status", "success");
            response.put("message", "Hủy đăng ký ca học thành công!");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "Không thể hủy đăng ký!");
            return ResponseEntity.badRequest().body(response);
        }
    }
}
