package com.maiphuhai.controller;

import com.maiphuhai.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/dashboard-admin")
public class AdminController {

    private final SessionService sessionService;

    @Autowired
    public AdminController(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    @GetMapping
    public String dashboard(Model model) {
        model.addAttribute("sessionList", sessionService.findAll());
        return "main/dashboard-admin";
    }

//    @PostMapping("/sessions/approve")
//    public String approve(@RequestParam("id") int id,
//            RedirectAttributes ra) {
//        sessionService.updateStatus(id, "scheduled");
//        ra.addFlashAttribute("flashMsg", "Ca " + id + " đã được duyệt!");
//        return "redirect:/main/dashboard-admin";
//    }
//
//    @PostMapping("/sessions/reject")
//    public String reject(@RequestParam("id") int id,
//            RedirectAttributes ra) {
//
//        sessionService.delete(id);
//        ra.addFlashAttribute("flashMsg", "Đã xoá ca " + id);
//        return "redirect:/main/dashboard-admin";
//    }
}
