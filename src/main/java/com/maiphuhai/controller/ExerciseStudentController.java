package com.maiphuhai.controller;

import com.maiphuhai.model.Exercise;
import com.maiphuhai.service.ExerciseService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/exercise-student")
public class ExerciseStudentController {

    @Autowired
    private ExerciseService exerciseService;

    @GetMapping
    public String show(Model model) {
        List<Exercise> exercises = exerciseService.findAll();
        System.out.println("Exercises: " + exercises);
        model.addAttribute("exercises", exercises);
        return "main/exercise-student";
    }
    
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        exerciseService.delete(id);
        return "redirect:/exercise-student";
    }
}
