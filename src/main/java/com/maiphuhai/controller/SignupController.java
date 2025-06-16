
package com.maiphuhai.controller;

import com.maiphuhai.model.UserAccount;
import com.maiphuhai.service.SignupService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/signup")
public class SignupController {
    
    @Autowired
    private SignupService signupService;
    
    //Show signup-form
    @GetMapping
    public String processSignupForm(Model model) {
        model.addAttribute("userAccount", new UserAccount());
        return "account/signup-form";
    }
    //Submit signup-form
    @PostMapping
    public String processSignup(@Valid @ModelAttribute("userAccount")UserAccount userAccount, BindingResult result) {
        if (result.hasErrors()) {
            return "account/signup-form";
        } else {
            signupService.add(userAccount);
            return "redirect:/login-form";
        }
    }
}
