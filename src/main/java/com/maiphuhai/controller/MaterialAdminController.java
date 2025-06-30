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
import java.util.stream.Collectors;

@Controller
@RequestMapping("/material-admin")
public class MaterialAdminController {

    @Autowired private StudyMaterialService service;
    @Autowired private ServletContext servletContext;

    /**
     * 1. Danh sách & tìm kiếm
     *    mode = "list" → hiển thị bảng tài liệu
     */
    @GetMapping
    public String list(
        @RequestParam(value="keyword", required=false) String kw,
        Model m
    ) {
        List<StudyMaterial> list = service.listAll();
        if (kw != null && !kw.isBlank()) {
            list = list.stream()
                       .filter(x -> x.getTitle().contains(kw)
                                  || x.getDescription().contains(kw))
                       .collect(Collectors.toList());
        }
        m.addAttribute("materials", list);
        m.addAttribute("keyword", kw);
        m.addAttribute("mode", "list");
        return "main/admin/material-admin";   // chỉ 1 JSP
    }

    /**
     * 2. Form thêm mới
     *    mode = "form" → hiển thị form với material rỗng
     */
    @GetMapping("/new")
    public String showCreate(Model m) {
        m.addAttribute("material", new StudyMaterial());
        m.addAttribute("mode", "form");
        return "main/admin/material-admin";
    }

    /**
     * 3. Form sửa
     *    mode = "form" → hiển thị form với material đã load
     */
    @GetMapping("/edit/{id}")
    public String showEdit(@PathVariable int id, Model m) {
        m.addAttribute("material", service.getById(id));
        m.addAttribute("mode", "form");
        return "main/admin/material-admin";
    }

    /**
     * 4. Lưu cả create và update → sau đó redirect về bảng
     */
    @PostMapping("/save")
    public String save(
        @ModelAttribute StudyMaterial material,
        @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (!file.isEmpty()) {
            String real = servletContext.getRealPath("/files");
            Path dir = Paths.get(real);
            if (!Files.exists(dir)) Files.createDirectories(dir);

            String fn = UUID.randomUUID() + "_" + file.getOriginalFilename();
            file.transferTo(dir.resolve(fn).toFile());
            material.setFileUrl("/files/" + fn);
        }

        if (material.getMaterialId() == 0) {
            service.upload(material);
        } else {
            service.update(material);
        }
        return "redirect:/material-admin";
    }

    /**
     * 5. Xóa → redirect về bảng
     */
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        service.delete(id);
        return "redirect:/material-admin";
    }

    /**
     * 6. Download file
     */
    @GetMapping("/download/{id}")
    public ResponseEntity<Resource> download(@PathVariable int id) throws IOException {
        StudyMaterial mat = service.getById(id);
        String full = servletContext.getRealPath(mat.getFileUrl());
        Resource res = new UrlResource(Paths.get(full).toUri());
        if (!res.exists() || !res.isReadable()) {
            throw new RuntimeException("Không đọc được file");
        }
        String mime = servletContext.getMimeType(full);
        if (mime == null) mime = "application/octet-stream";
        return ResponseEntity.ok()
            .contentType(MediaType.parseMediaType(mime))
            .header(HttpHeaders.CONTENT_DISPOSITION,
                    "attachment; filename=\"" + res.getFilename() + "\"")
            .body(res);
    }
}
