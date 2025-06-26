package com.maiphuhai.controller;

import com.maiphuhai.model.User;
import com.maiphuhai.service.UserService;
import jakarta.servlet.http.HttpSession;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginForm() {
        return "account/login-form";
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
            model.addAttribute("email", email);
            model.addAttribute("role", role);
            return "account/login-form";
        }

        session.setAttribute("USER", userOpt.get());

        return role.equals("tutor")
                ? "redirect:/dashboard-tutor"
                : "redirect:/dashboard-student";
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

    /* ---------- Forgot password (GET) ---------- */
    @GetMapping("/forgot-password")
    public String showForgotPwdForm() {
        return "account/forgot-password";
    }

    /* ---------- Forgot password (POST) ---------- */
    @PostMapping("/forgot-password")
    public String processForgotPwd(@RequestParam String email,
            @RequestParam String newPassword,
            Model model) {

        boolean done = userService.resetPasswordByEmail(email, newPassword);

        if (done) {
            model.addAttribute("msg", "Đổi mật khẩu thành công! Vui lòng đăng nhập.");
            return "account/forgot-password";
        } else {
            model.addAttribute("err", "Email không tồn tại!");
            model.addAttribute("email", email);
            return "account/forgot-password";
        }
    }

    /* ---------- Sign-up (GET) ---------- */
    @GetMapping("/signup")
    public String showSignupForm() {
        return "account/signup-form";
    }

    /* ---------- Sign-up (POST) ---------- */
    @PostMapping("/signup")
    public String processSignup(@RequestParam String role,
            @RequestParam String fullName,
            @RequestParam String email,
            @RequestParam String password,
            Model model) {

        // email đã tồn tại?
        if (userService.findByEmail(email).isPresent()) {
            model.addAttribute("err", "Email đã tồn tại");
            model.addAttribute("email", email);
            return "account/signup-form";
        }

        User u = new User();
        u.setEmail(email);
        u.setPassword(password);
        u.setRole(role);
        u.setFull_name(fullName);

        if (userService.register(u)) {
            model.addAttribute("msg", "Đăng ký thành công! Vui lòng đăng nhập");
            return "account/login-form";
        } else {
            model.addAttribute("err", "Đăng ký thất bại");
            return "account/signup-form";
        }
    }

}
