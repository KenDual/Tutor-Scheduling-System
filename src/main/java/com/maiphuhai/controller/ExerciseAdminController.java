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
@RequestMapping("/exercise-admin")
public class ExerciseAdminController {

    @Autowired
    private ExerciseService exerciseService;

    @Autowired
    private SessionService sessionService;

    @Autowired
    private UserService userService;

    @GetMapping
    public String show(Model model, HttpSession session) {
        Integer adminId = (Integer) session.getAttribute("adminId");
        if (adminId == null) {
            return "redirect:/login";
        }

        // Lấy thông tin admin
        Optional<User> admin = userService.findById(adminId);
        if (admin.isPresent()) {
            model.addAttribute("adminName", admin.get().getFull_name());
        } else {
            model.addAttribute("adminName", "Administrator");
        }

        // Lấy danh sách tất cả session (admin có quyền xem tất cả)
        List<Session> sessions = sessionService.findAll();
        model.addAttribute("sessions", sessions);

        // Lấy tất cả bài tập (admin có quyền xem tất cả)
        List<Exercise> exercises = exerciseService.findAll();
        model.addAttribute("exercises", exercises);

        return "main/admin/exercise-admin";
    }

    @GetMapping("/add")
    public String showAddForm(Model model, HttpSession session) {
        Integer adminId = (Integer) session.getAttribute("adminId");
        if (adminId == null) {
            return "redirect:/login";
        }

        List<Session> sessions = sessionService.findAll();
        model.addAttribute("sessions", sessions);
        model.addAttribute("exercise", new Exercise());
        return "main/exercise-form";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Exercise exercise, HttpSession session) {
        Integer adminId = (Integer) session.getAttribute("adminId");
        if (adminId == null) {
            return "redirect:/login";
        }

        exerciseService.add(exercise);
        return "redirect:/exercise-admin";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model, HttpSession session) {
        Integer adminId = (Integer) session.getAttribute("adminId");
        if (adminId == null) {
            return "redirect:/login";
        }

        Exercise exercise = exerciseService.getById(id);
        List<Session> sessions = sessionService.findAll();
        model.addAttribute("exercise", exercise);
        model.addAttribute("sessions", sessions);
        return "main/exercise-form";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Exercise exercise, HttpSession session) {
        Integer adminId = (Integer) session.getAttribute("adminId");
        if (adminId == null) {
            return "redirect:/login";
        }

        exerciseService.update(exercise);
        return "redirect:/exercise-admin";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id, HttpSession session) {
        Integer adminId = (Integer) session.getAttribute("adminId");
        if (adminId == null) {
            return "redirect:/login";
        }

        exerciseService.delete(id);
        return "redirect:/exercise-admin";
    }
}
