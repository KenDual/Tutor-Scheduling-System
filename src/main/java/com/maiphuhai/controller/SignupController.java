
package com.maiphuhai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/signup")
public class SignupController {
    

    @GetMapping
    public String processSignupForm() {
       
        return "account/signup-form";
    }

}
