package com.maiphuhai.controller;

import com.maiphuhai.model.Session;
import com.maiphuhai.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/sessions")
public class SessionController {

    @Autowired
    private SessionService sessionService;

    /* thêm một ca */
    @PostMapping(value = "/add",
            consumes = "application/json",
            produces = "application/json")
    @ResponseBody
    public ResponseEntity<?> add(@RequestBody Session payload) {
        if (sessionService.existsByTutorDaySlot(
                payload.getTutorId(),
                payload.getDay(),
                payload.getSlot())) {
            return ResponseEntity.status(409).body("duplicate");
        }

        sessionService.add(payload);
        return ResponseEntity.ok(payload);        // trả lại cho JS vẽ
    }

    /* xoá một ca */
    @PostMapping("/delete/{id}")
    @ResponseBody
    public void delete(@PathVariable int id) {
        sessionService.delete(id);
    }
}
