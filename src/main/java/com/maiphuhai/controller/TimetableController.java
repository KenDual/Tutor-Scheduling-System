package com.maiphuhai.controller;

import com.maiphuhai.model.Subject;
import com.maiphuhai.model.User;
import com.maiphuhai.service.SessionService;
import com.maiphuhai.service.SubjectService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class TimetableController {

    @Autowired
    private SessionService sessionService;

    @Autowired
    private SubjectService subjectService;

    // Hiển thị form đăng ký ca học
    @GetMapping("/sessions/register")
    public String showRegisterForm(Model model) {
        // Lấy danh sách môn học từ cơ sở dữ liệu
        List<Subject> subjects = subjectService.findAll();
        model.addAttribute("subjects", subjects);
        return "sessions/register"; // Trả về view sessions/register.jsp hoặc .html
    }

    // Xử lý yêu cầu đăng ký ca học
    @PostMapping("/sessions/register")
    public String processRegister(
            @RequestParam String day,
            @RequestParam int slot,
            @RequestParam int subjectId,
            HttpSession session,
            Model model) {

        // Lấy thông tin người dùng từ session (giả sử đã lưu khi đăng nhập)
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null || !"tutor".equals(currentUser.getRole())) {
            model.addAttribute("error", "Chỉ có giáo viên mới có thể đăng ký ca học.");
            return "sessions/register";
        }

        int userId = currentUser.getUser_id();
        int tutorId = userId; // Trong schema của bạn, tutor_id chính là user_id

        // Kiểm tra xem cặp day, slot, tutorId đã tồn tại chưa
        boolean exists = sessionService.existsByDaySlotTutor(day, slot, tutorId);
        if (exists) {
            model.addAttribute("error", "Bạn đã có ca học vào " + day + " - slot " + slot);
            return "sessions/register";
        }

        // Tạo session mới
        try {
            sessionService.register(day, slot, tutorId, subjectId, "Default Location");
            model.addAttribute("msg", "Đăng ký ca học thành công!");
        } catch (Exception e) {
            model.addAttribute("error", "Đăng ký thất bại: " + e.getMessage());
        }

        // Cập nhật lại danh sách môn học để hiển thị trong form
        List<Subject> subjects = subjectService.findAll();
        model.addAttribute("subjects", subjects);
        return "sessions/register";
    }
}
