package com.maiphuhai.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginStudentController {
    


    
    //Show login-form
    @GetMapping("/login")
    public String showLogin() {
        return "account/login-form";
    }
    

}
