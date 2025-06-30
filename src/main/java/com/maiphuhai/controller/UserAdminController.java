package com.maiphuhai.controller;

import com.maiphuhai.model.User;
import com.maiphuhai.service.UserService;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user-admin")
public class UserAdminController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String show(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "main/admin/user-admin";
    }

    @GetMapping("/edit/{userId}")
    public String editUser(@PathVariable int userId, Model model) {
        User user = userService.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + userId));
        model.addAttribute("user", user);
        return "account/user-form";
    }

    @GetMapping("/save")
    public String showCreateForm(Model model) {
        User newUser = new User();
        newUser.setUser_id(0);
        model.addAttribute("user", newUser);
        return "account/user-form";
    }

    @PostMapping("/save")
    public String saveUser(@RequestParam(required = false) Integer user_id,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String fullName,
            @RequestParam(required = false) String phone,
            @RequestParam String role) {

        User user = new User();
        if (user_id != null && user_id > 0) {
            // Lấy user hiện tại nếu có
            Optional<User> existingUser = userService.findById(user_id);
            if (existingUser.isPresent()) {
                user = existingUser.get();
            }
        }

        // Cập nhật thông tin
        user.setEmail(email);
        user.setPassword(password);
        user.setFull_name(fullName);
        user.setPhone(phone != null ? phone : "");
        user.setRole(role);

        userService.saveOrUpdate(user);
        return "redirect:/user-admin";
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity<String> deleteUser(@RequestParam int userId) {
        try {
            userService.delete(userId);
            return ResponseEntity.ok("User deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Error deleting user");
        }
    }
}
