
package com.maiphuhai.controller;

import com.maiphuhai.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class DashBoardStudentController {

    @Autowired 
    private SessionService sessionService;

    @GetMapping("/dashboard-student")
    public String studentDash(Model model){
        model.addAttribute("sessions", sessionService.findScheduled());
        return "main/dashboard-student";
    }
}
