package com.maiphuhai.controller;

import com.maiphuhai.model.User;
import com.maiphuhai.service.UserService;
import jakarta.servlet.http.HttpSession;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /* ---------- Tutor / Student ---------- */
    @GetMapping("/login")
    public String showLoginForm() {
        return "account/login-form";           // trỏ tới login-form.jsp
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String role,
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        Optional<User> userOpt = userService.login(email, password, role);

        if (userOpt.isEmpty()) {
            model.addAttribute("error", "Sai email, mật khẩu hoặc vai trò");
            // Trả lại email & role (để form giữ nguyên)
            model.addAttribute("email", email);
            model.addAttribute("role", role);
            return "account/login-form";
        }

        session.setAttribute("USER", userOpt.get());

        return role.equals("tutor")
                ? "redirect:/tutor/dashboard"
                : "redirect:/student/dashboard";
    }

    /* ---------- Admin ---------- */
    @GetMapping("/admin/login")
    public String showAdminLoginForm() {
        return "admin-login";
    }

    @PostMapping("/admin/login")
    public String processAdminLogin(@RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        Optional<User> userOpt = userService.adminLogin(email, password);

        if (userOpt.isEmpty()) {
            model.addAttribute("error", "Sai email hoặc mật khẩu admin");
            model.addAttribute("email", email);
            return "admin-login";
        }

        session.setAttribute("ADMIN", userOpt.get());
        return "redirect:/admin/dashboard-admin";
    }

    /* ---------- Logout chung ---------- */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
