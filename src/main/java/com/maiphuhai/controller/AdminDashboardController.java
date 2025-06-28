package com.maiphuhai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminDashboardController {

    @GetMapping("/dashboard-admin")
    public String adminDashboard() {
        return "main/dashboard-admin";
    }
}