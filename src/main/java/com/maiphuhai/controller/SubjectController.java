package com.maiphuhai.controller;

import com.maiphuhai.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ControllerAdvice;

@ControllerAdvice 
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    @ModelAttribute("subjectList")
    public Object populateSubjects() {
        return subjectService.findAll();
    }
}
