package com.maiphuhai.controller;

import com.maiphuhai.model.Student;
import com.maiphuhai.model.Tutor;
import com.maiphuhai.model.User;
import com.maiphuhai.service.StudentService;
import com.maiphuhai.service.TutorService;
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

    @Autowired
    private TutorService tutorService;

    @Autowired
    private StudentService studentService;

    @GetMapping("/login")
    public String showLoginForm() {
        return "account/login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String email,
            @RequestParam String password,
            @RequestParam String role,
            HttpSession session,
            Model model) {

        Optional<User> userOpt = userService.login(email, password, role);
        if (userOpt.isEmpty()) {
            model.addAttribute("error", "Sai tài khoản hoặc mật khẩu");
            return "account/login";
        }

        User u = userOpt.get();
        session.setAttribute("currentUser", u);
        session.setAttribute("role", u.getRole());

        switch (u.getRole()) {
            case "admin":
                return "redirect:/dashboard-admin";
            case "tutor":
                return "redirect:/dashboard-tutor";
            case "student":
                return "redirect:/dashboard-student";
            default:
                model.addAttribute("error", "Vai trò không hợp lệ");
                return "account/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/forgot-password")
    public String showForgotPwdForm() {
        return "account/forgot-password";
    }

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

    @GetMapping("/signup")
    public String showSignupForm() {
        return "account/signup";
    }

    @PostMapping("/signup")
    public String processSignup(@RequestParam String role,
            @RequestParam String fullName,
            @RequestParam String email,
            @RequestParam String password,
            Model model) {
        if (role == null || role.isEmpty()) {
            model.addAttribute("err", "Vui lòng chọn vai trò");
            return "account/signup";
        }
        if (fullName == null || fullName.isEmpty()) {
            model.addAttribute("err", "Họ tên không được để trống");
            return "account/signup";
        }
        if (email == null || email.isEmpty()) {
            model.addAttribute("err", "Email không được để trống");
            return "account/signup";
        }
        if (password == null || password.isEmpty()) {
            model.addAttribute("err", "Mật khẩu không được để trống");
            return "account/signup";
        }
        if (password.length() < 6) {
            model.addAttribute("err", "Mật khẩu phải có ít nhất 6 ký tự");
            return "account/signup";
        }
        if (userService.findByEmail(email).isPresent()) {
            model.addAttribute("err", "Email đã tồn tại");
            model.addAttribute("email", email);
            return "account/signup";
        }

        User u = new User();
        u.setEmail(email);
        u.setPassword(password);
        u.setRole(role);
        u.setFull_name(fullName);

        if (userService.register(u)) {
            model.addAttribute("msg", "Đăng ký thành công! Vui lòng đăng nhập");
            return "account/login";
        } else {
            model.addAttribute("err", "Đăng ký thất bại");
            return "account/signup";
        }
    }

    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("user", user);

        if ("tutor".equals(user.getRole())) {
            Optional<Tutor> tutorOpt = tutorService.findById(user.getUser_id());
            tutorOpt.ifPresent(tutor -> model.addAttribute("tutor", tutor));
        } else if ("student".equals(user.getRole())) {
            Optional<Student> studentOpt = studentService.findById(user.getUser_id());
            studentOpt.ifPresent(student -> model.addAttribute("student", student));
        }

        return "main/profile";
    }
}
