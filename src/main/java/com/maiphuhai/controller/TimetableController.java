
package com.maiphuhai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TimetableController {
    @GetMapping("/timetable")
    public String showTimetable(){
        return "main/timetable-";
    }
}
