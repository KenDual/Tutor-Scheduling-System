package com.maiphuhai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/timetable-admin")
public class TimetableAdminController {

    @GetMapping
    public String adminDashboard() {
        return "main/admin/timetable-admin";
    }
}
