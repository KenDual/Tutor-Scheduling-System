
package com.maiphuhai.controller;

import com.maiphuhai.model.Subject;
import com.maiphuhai.service.SubjectService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SubjectController {
    @Autowired
    private SubjectService subjectService;

    @GetMapping("/subjects")
    public String list(Model model) {
        List<Subject> subjects = subjectService.findAll();
        model.addAttribute("subjects", subjects);
        return "main/dashboard-admin";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("car", new Subject());
        return "main/dashboard-admin";
    }
    
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("subject_id") int id, Model model) {
        Subject subject = subjectService.findById(id);
        model.addAttribute("subject", subject);
        return "main/dashboard-admin";
    }

    @PostMapping("/edit")
    public String update(@ModelAttribute Subject subject) {
        subjectService.update(subject);
        return "redirect:/dashboard-admin";
    }
    
    @PostMapping("/save")
    public String save(@ModelAttribute Subject subject) {
        if (subject.getSubject_id() == 0 || subject.getSubject_id() < 0){
            subjectService.save(subject);
        } else {
            subjectService.update(subject);
        }
        return "redirect:/dashboard-admin";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("subject_id") int id) {
        subjectService.delete(id);
        return "redirect:/dashboard-admin";
    }
}
