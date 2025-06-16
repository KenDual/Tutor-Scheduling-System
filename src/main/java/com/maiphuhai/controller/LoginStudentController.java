package com.maiphuhai.controller;

import com.maiphuhai.model.UserAccount;
import com.maiphuhai.service.SignupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginStudentController {
    
    @Autowired
    private SignupService signupService;
    
    @GetMapping("/showaccount")
    public String showAccountList(Model model) {
        model.addAttribute("signupService", signupService.findAll());
        return "account/user-account";
    }
    
    //Show login-form
    @GetMapping("/login")
    public String showLogin() {
        return "account/login-form";
    }
    
    @PostMapping("/login")
    public String loginProcess(@ModelAttribute("userAccount") UserAccount userAccount, Model model){
        if(signupService.validateUser(userAccount.getEmail(), userAccount.getPassword())) {
            return "main/dashboard-student";
        } else {
            model.addAttribute("error", "Email for password incorrect");
            return "account/login-form";
        }
    }
}
