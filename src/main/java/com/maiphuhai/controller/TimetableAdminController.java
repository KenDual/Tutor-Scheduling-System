package com.maiphuhai.controller;

import com.maiphuhai.model.Session;
import com.maiphuhai.model.User;
import com.maiphuhai.service.SessionService;
import com.maiphuhai.service.SubjectService;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TimetableAdminController {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private SessionService sessionService;

    @GetMapping("/timetable-admin")
    public String adminDashboard(Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null || !"admin".equals(user.getRole())) {
            return "redirect:/login";
        }

        int tutorId = user.getUser_id();
        List<Session> sessions = sessionService.ofAdmin();
        model.addAttribute("sessions", sessions);
        model.addAttribute("subjects", subjectService.findAll());

        return "main/admin/timetable-admin";
    }

    @PostMapping("/timetable-admin/delete-session")
    @ResponseBody
    public ResponseEntity<String> deleteSession(@RequestParam("sessionId") int sessionId) {
        try {
            sessionService.deleteSession(sessionId);
            return ResponseEntity.ok("success");
        } catch (EmptyResultDataAccessException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Session not found");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error deleting session: " + e.getMessage());
        }
    }
}
