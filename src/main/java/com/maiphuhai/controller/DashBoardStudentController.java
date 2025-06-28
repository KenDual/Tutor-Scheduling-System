package com.maiphuhai.controller;

import com.maiphuhai.service.ExerciseService;
import com.maiphuhai.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardStudentController {
    
    @Autowired
    private SessionService sessionService;
    
    @Autowired
    private ExerciseService exerciseService;

    @GetMapping("/dashboard-student")
    public String studentDashboard(Model model) {
        
        int totalSessions = sessionService.findScheduled().size();
        model.addAttribute("totalSessions", totalSessions);
        
        int totalExercises = exerciseService.findAll().size();
        model.addAttribute("totalExercises", totalExercises);
        
        return "main/dashboard-student";
    }
}
