package com.maiphuhai.controller;

import com.maiphuhai.model.User;
import com.maiphuhai.service.SessionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/sessions")
public class SessionController {

    @Autowired private SessionService sessionService;

    @GetMapping
    public String listSessions(HttpSession httpSession, Model model) {
        User u = (User) httpSession.getAttribute("user");
        if (u == null || !"tutor".equals(u.getRole())) {
            return "redirect:/login";
        }
        model.addAttribute("sessions", sessionService.findByTutor(u.getUser_id()));
        return "main/session-list";   // trỏ tới JSP ở trên
    }
}
