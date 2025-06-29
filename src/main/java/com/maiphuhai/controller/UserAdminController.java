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

    //Hiển thị toàn bộ người dùng
    @GetMapping
    public String show(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "main/admin/user-admin";
    }
    
    //Ấn edit chuyển trang user-edit
    @GetMapping("/edit/{userId}")
    public String editUser(@PathVariable int userId, Model model) {
        Optional<User> userOpt = userService.findById(userId);
        if (userOpt.isPresent()) {
            model.addAttribute("user", userOpt.get());
            return "account/user-form";
        } else {
            return "redirect:/user-admin?error=User not found";
        }
    }

    //Phương thức Update
    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user, Model model) {
        try {
            userService.update(user);
            return "redirect:/user-admin";
        } catch (Exception e) {
            model.addAttribute("error", "Error updating user: " + e.getMessage());
            model.addAttribute("user", user);
            return "account/user-form";
        }
    }

    //Phương thức xóa
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
