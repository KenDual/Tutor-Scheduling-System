
package com.maiphuhai.controller;

import com.maiphuhai.service.SignupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeScreenController {
    
    @Autowired
    private SignupService signUpService;
    
    @RequestMapping("/")
    public String showHomeScreen(Model model) {
        model.addAttribute("home", "");
        return "home-screen";
    }
}
