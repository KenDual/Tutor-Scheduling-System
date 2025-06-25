package com.maiphuhai.controller;


import com.maiphuhai.model.Session;
import com.maiphuhai.service.SessionService;
import com.maiphuhai.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardTutorController {

    @Autowired private SessionService  sessionService;
    @Autowired private SubjectService  subjectService;

    @GetMapping("/dashboard-tutor")
    public String view(Model model) {
        int tutorId = 1;
        model.addAttribute("sessionList", sessionService.findById(tutorId));
        model.addAttribute("loggedTutorId", tutorId);
        model.addAttribute("session", new Session());
        model.addAttribute("subjectList", subjectService.findAll());
        return "main/dashboard-tutor";
    }
}
