package com.maiphuhai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TimetableStudentController {
    
    @GetMapping("/timetable-student")
    public String show(Model model) {
        return "main/timetable-student";
    }
}
