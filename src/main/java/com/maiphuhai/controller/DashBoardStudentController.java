
package com.maiphuhai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class DashBoardStudentController {
    @GetMapping("/dashboard-student")
    public String showDashboard() {
        return "main/dashboard-student";
    }
}
