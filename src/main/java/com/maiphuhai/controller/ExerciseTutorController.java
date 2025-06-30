package com.maiphuhai.controller;

import com.maiphuhai.model.Exercise;
import com.maiphuhai.model.Session;
import com.maiphuhai.model.User;
import com.maiphuhai.service.ExerciseService;
import com.maiphuhai.service.SessionService;
import com.maiphuhai.service.UserService;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/exercise-tutor")
public class ExerciseTutorController {

    @Autowired
    private ExerciseService exerciseService;

    @Autowired
    private SessionService sessionService;

    @Autowired
    private UserService userService;

    @GetMapping
    public String show(Model model, HttpSession session) {
        Integer tutorId = (Integer) session.getAttribute("tutorId");
        if (tutorId == null) {
            return "redirect:/login";
        }

        // Lấy thông tin giảng viên
        Optional<User> tutor = userService.findById(tutorId);
        if (tutor.isPresent()) {
            model.addAttribute("tutorName", tutor.get().getFull_name());
        } else {
            model.addAttribute("tutorName", "Unknown Tutor");
        }

        // Lấy danh sách session của tutor
        List<Session> sessions = sessionService.findByTutor(tutorId);
        model.addAttribute("sessions", sessions);

        // Lấy bài tập theo tutorId
        List<Exercise> exercises = exerciseService.findByTutorId(tutorId);
        model.addAttribute("exercises", exercises);

        return "main/exercise-tutor";
    }

    @GetMapping("/add")
    public String showAddForm(Model model, HttpSession session) {
        Integer tutorId = (Integer) session.getAttribute("tutorId");
        if (tutorId == null) {
            return "redirect:/login";
        }

        List<Session> sessions = sessionService.findByTutor(tutorId);
        model.addAttribute("sessions", sessions);
        model.addAttribute("exercise", new Exercise());
        return "main/exercise-form";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Exercise exercise) {
        exerciseService.add(exercise);
        return "redirect:/exercise-tutor";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model, HttpSession session) {
        Integer tutorId = (Integer) session.getAttribute("tutorId");
        if (tutorId == null) {
            return "redirect:/login";
        }

        Exercise e = exerciseService.getById(id);
        List<Session> sessions = sessionService.findByTutor(tutorId);

        model.addAttribute("exercise", e);
        model.addAttribute("sessions", sessions);
        return "main/exercise-form";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Exercise exercise) {
        exerciseService.update(exercise);
        return "redirect:/exercise-tutor";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        exerciseService.delete(id);
        return "redirect:/exercise-tutor";
    }
}
