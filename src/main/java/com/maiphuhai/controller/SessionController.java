package com.maiphuhai.controller;

import com.maiphuhai.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/sessions")
public class SessionController {

    @Autowired
    private SessionService sessionService;

    @PostMapping("/request")
    public String requestSession(
            @RequestParam("day") String day,
            @RequestParam("slot") int slot,
            @RequestParam(value = "tutor_id", defaultValue = "1") int tutorId,
            @RequestParam("location") String location,
            @RequestParam("subject_id") int subjectId,
            RedirectAttributes redirectAttributes) {
        try {
            sessionService.registerSession(day, slot, tutorId, location, subjectId);
            redirectAttributes.addFlashAttribute("flashMsg", "Yêu cầu đăng ký ca học đã được gửi!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("flashErr", "Lỗi: " + e.getMessage());
        }
        return "redirect:/main/dashboard-tutor";
    }
}
