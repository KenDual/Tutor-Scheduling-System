package com.maiphuhai.controller;

import com.maiphuhai.model.Session;
import com.maiphuhai.model.User;
import com.maiphuhai.service.SessionService;
import com.maiphuhai.service.SubjectService;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TimetableStudentController {
    
    @Autowired
    private SubjectService subjectService;

    @Autowired
    private SessionService sessionService;

    @GetMapping("/timetable-student")
    public String show(Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null || !"student".equals(user.getRole())) {
            return "redirect:/login";
        }
        
        int studentId = user.getUser_id();
        List<Session> sessions = sessionService.ofAdmin();
        model.addAttribute("sessions", sessions);
        model.addAttribute("subjects", subjectService.findAll());
        
        return "main/timetable-student";
    }
}
