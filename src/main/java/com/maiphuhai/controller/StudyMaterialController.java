package com.maiphuhai.controller;

import com.maiphuhai.model.StudyMaterial;
import com.maiphuhai.service.StudyMaterialService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/materials")
public class StudyMaterialController {

    private final StudyMaterialService service;

    public StudyMaterialController(StudyMaterialService service) {
        this.service = service;
    }

    @GetMapping("/upload")
    public String form(Model model) {
        model.addAttribute("material", new StudyMaterial());
        return "material-form"; // JSP
    }

    @PostMapping("/upload")
    public String upload(@ModelAttribute("material") @Valid StudyMaterial material,
            BindingResult rs,
            @RequestParam("file") MultipartFile file,
            HttpSession session,
            RedirectAttributes rattr) throws IOException {

        if (rs.hasErrors()) {
            return "material-form";
        }

        /* ----- 1. Thư mục lưu: webapp/files ----- */
        String folder = session.getServletContext().getRealPath("/") + "files";
        Files.createDirectories(Path.of(folder));

        /* ----- 2. Đổi tên an toàn ----- */
        String original = file.getOriginalFilename();
        String safe = original.replaceAll("[^a-zA-Z0-9._-]", "_");
        String saved = java.util.UUID.randomUUID() + "_" + safe;

        /* ----- 3. Ghi file ----- */
        Path dest = Path.of(folder, saved).normalize();
        file.transferTo(dest);

        /* ----- 4. Lưu DB ----- */
        material.setFileUrl("/files/" + saved);
        material.setUploadedAt(new java.util.Date());
        service.upload(material);

        rattr.addFlashAttribute("msg", "Upload thành công!");
        return "redirect:/materials";
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("list", service.listAll());
        return "material-list"; // JSP
    }
}
