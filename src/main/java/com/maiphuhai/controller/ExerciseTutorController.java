package com.maiphuhai.controller;

import com.maiphuhai.model.Exercise;
import com.maiphuhai.service.ExerciseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/exercise-tutor")
public class ExerciseTutorController {
    
    @Autowired
    private ExerciseService exerciseService;

    // Hiển thị danh sách theo sessionId
    @GetMapping
    public String show(Model model) {
        List<Exercise> exercises = exerciseService.findAll();
        System.out.println("Exercises: " + exercises);
        model.addAttribute("exercises", exercises);
        return "main/exercise-tutor";
    }

    // Form thêm mới
    @GetMapping("/add")
    public String showAddForm(@RequestParam("sessionId") int sessionId, Model model) {
        Exercise e = new Exercise();
        e.setSessionId(sessionId);
        model.addAttribute("exercise", e);
        return "main/exercise-tutor";
    }

    // Xử lý thêm
    @PostMapping("/add")
    public String add(@ModelAttribute Exercise exercise) {
        exerciseService.add(exercise);
        return "redirect:/exercises?sessionId=" + exercise.getSessionId();
    }

    // Form sửa
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Exercise e = exerciseService.getById(id);
        model.addAttribute("exercise", e);
        return "main/exercise-tutor";
    }

    // Xử lý cập nhật
    @PostMapping("/edit")
    public String edit(@ModelAttribute Exercise exercise) {
        exerciseService.update(exercise);
        return "redirect:/exercises?sessionId=" + exercise.getSessionId();
    }

    // Xử lý xóa
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        Exercise e = exerciseService.getById(id);
        exerciseService.delete(id);
        return "redirect:/exercises?sessionId=" + e.getSessionId();
    }
}
