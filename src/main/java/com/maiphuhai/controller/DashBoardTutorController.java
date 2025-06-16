package com.maiphuhai.controller;

import com.maiphuhai.service.SessionService;
import com.maiphuhai.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dashboard-tutor")
public class DashBoardTutorController {

    private final SessionService  sessionService;
    private final SubjectService  subjectService;


    @Autowired
    public DashBoardTutorController(SessionService sessionService,
                                    SubjectService subjectService) {
        this.sessionService  = sessionService;
        this.subjectService  = subjectService;
    }


    @GetMapping
    public String showDashboard(Model model) {
        int tutorId = 1;    
        model.addAttribute("sessionList",
                           sessionService.getByTutor(tutorId));
        model.addAttribute("subjectList",
                           subjectService.findAll());
        model.addAttribute("loggedTutorId", tutorId);
        return "main/dashboard-tutor";
    }
}
