package com.maiphuhai.controller;

import com.maiphuhai.model.User;
import com.maiphuhai.service.SessionService;
import com.maiphuhai.service.SubjectService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DashBoardTutorController {

    @Autowired
    private SessionService sessionService;
    
    @Autowired
    private SubjectService subjectService;

    /* Hiển thị dashboard + form đăng ký */
    @GetMapping("/dashboard-tutor")
    public String view(HttpSession sess, Model m) {
        User u = (User) sess.getAttribute("USER");
        if (u == null || !"tutor".equals(u.getRole())) {
            return "redirect:/403";
        }
        m.addAttribute("sessions", sessionService.findByTutor(u.getUser_id()));
        m.addAttribute("subjectList", subjectService.findAll());
        return "main/dashboard-tutor";
    }

    /* Xử lý đăng ký ca */
    @PostMapping("/sessions/register")
    public String register(@RequestParam String day,
            @RequestParam int slot,
            @RequestParam int subjectId,
            @RequestParam String location,
            HttpSession sess,
            RedirectAttributes ra) {
        try {
            User u = (User) sess.getAttribute("USER");
            sessionService.register(day, slot, u.getUser_id(), subjectId, location);
            ra.addFlashAttribute("msg", "Đăng ký thành công!");
        } catch (Exception ex) {
            ra.addFlashAttribute("err", ex.getMessage());
        }
        return "redirect:/dashboard-tutor";
    }
}
