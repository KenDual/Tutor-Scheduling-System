package com.maiphuhai.controller;

import com.maiphuhai.model.StudyMaterial;
import com.maiphuhai.service.StudyMaterialService;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.*;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/material-tutor")
public class MaterialTutorController {

    private final StudyMaterialService service;
    private final ServletContext servletContext;

    @Autowired
    public MaterialTutorController(StudyMaterialService service, ServletContext servletContext) {
        this.service = service;
        this.servletContext = servletContext;
    }

    // 1) Hiển thị form upload (tutor)
    @GetMapping("/upload")
    public String showUploadForm(Model model) {
        model.addAttribute("material", new StudyMaterial());
        return "material-form";
    }

    // 2) Xử lý POST upload
    @PostMapping("/upload")
    public String upload(@ModelAttribute("material") StudyMaterial material,
            @RequestParam("file") MultipartFile file) throws IOException {
        String realPath = servletContext.getRealPath("/files");
        Path uploadDir = Paths.get(realPath);
        if (!Files.exists(uploadDir)) {
            Files.createDirectories(uploadDir);
        }

        // sinh tên file mới
        String filename = UUID.randomUUID() + "_" + file.getOriginalFilename();

        // lưu file
        Path dest = uploadDir.resolve(filename);
        file.transferTo(dest.toFile());

        // lưu metadata
        material.setFileUrl("/files/" + filename);
        service.upload(material);

        return "redirect:/material-tutor";
    }

    // 3) List tất cả tài liệu
//    @GetMapping
//    public String list(Model model) {
//        model.addAttribute("list", service.listAll());
//        return "main/material-tutor";
//    }
    @GetMapping
    public String list(Model model) {
        List<StudyMaterial> materials = service.listAll();
        model.addAttribute("list", materials);
        return "main/material-tutor";
    }

    // 4) Download: GET /materials/download/{id}
    @GetMapping("/download/{id}")
    public ResponseEntity<Resource> download(@PathVariable("id") int id) throws IOException {
        StudyMaterial m = service.getById(id);

        // tìm file vật lý
        String fullPath = servletContext.getRealPath(m.getFileUrl());
        Path file = Paths.get(fullPath);
        Resource resource = new UrlResource(file.toUri());

        if (!resource.exists() || !resource.isReadable()) {
            throw new RuntimeException("Không tìm thấy file: " + m.getFileUrl());
        }

        // xác định mime-type
        String mimeType = servletContext.getMimeType(fullPath);
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }

        // trả về
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(mimeType))
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }
}
