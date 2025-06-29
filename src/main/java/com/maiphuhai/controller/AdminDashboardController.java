package com.maiphuhai.controller;

import com.maiphuhai.service.StudentService;
import com.maiphuhai.service.TutorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dashboard-admin")
public class AdminDashboardController {

    @Autowired
    private StudentService studentService;
    
    @Autowired
    private TutorService tutorService;

    @GetMapping
    public String studentDashboard(Model model) {
        
        int totalStudents = studentService.findAll().size();
        model.addAttribute("totalStudents", totalStudents);
        
        int totalTutors = tutorService.findAll().size();
        model.addAttribute("totalTutors", totalTutors);
        
        return "main/admin/dashboard-admin";
    }
}