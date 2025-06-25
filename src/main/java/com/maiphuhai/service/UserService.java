
package com.maiphuhai.service;

import com.maiphuhai.model.User;
import com.maiphuhai.repository.UserRepository;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class UserService {
    @Autowired
    private UserRepository repo;

    // Đăng ký (insert)
    public boolean register(User user) {
        return repo.save(user) > 0;
    }

    // Kiểm tra đăng nhập cho student/tutor
    public Optional<User> login(String email, String password, String role) {
        return repo.findByCredentials(email, password, role);
    }

    // Kiểm tra đăng nhập admin (role cố định)
    public Optional<User> adminLogin(String email, String password) {
        return repo.findByCredentials(email, password, "admin");
    }

    // CRUD khác nếu cần...
}
