
package com.maiphuhai.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeScreenController {
    
    @RequestMapping("/")
    public String showHomeScreen(Model model) {
        model.addAttribute("home", "");
        return "main/home-screen";
    }
    
    @GetMapping("/about-us")
    public String showAboutUs(){
        return "about-us";
    }
}
