package com.maiphuhai.controller;

import com.maiphuhai.model.User;
import com.maiphuhai.service.SessionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/sessions")
public class SessionController {

    @Autowired
    private SessionService sessionService;

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
}
