package com.maiphuhai.controller;


import com.maiphuhai.model.Session;
import com.maiphuhai.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/sessions")
public class SessionController {

    @Autowired
    private SessionService sessionService;

    @PostMapping("/request")
    public String request(@ModelAttribute Session session,
                          RedirectAttributes ra) {

        if (sessionService.existsByTutorDaySlot(
                session.getTutorId(), session.getDay(), session.getSlot())) {
            ra.addFlashAttribute("flashErr", "Bạn đã gửi yêu cầu trùng ca!");
            return "redirect:/dashboard-tutor#schedule";
        }

        session.setStatus("scheduled");
        sessionService.add(session);

        ra.addFlashAttribute("flashMsg", "Gửi yêu cầu thành công!");
        return "redirect:/dashboard-tutor#schedule";
    }

    @PostMapping("/delete/{id}")
    @ResponseBody
    public void delete(@PathVariable int id) {
        sessionService.delete(id);
    }
}
