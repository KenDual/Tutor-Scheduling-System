package com.maiphuhai.service;

import com.maiphuhai.model.User;
import com.maiphuhai.repository.UserRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class UserService {

    @Autowired
    private UserRepository repo;

    public List<User> findAll() {
        return repo.findAll();
    }
    public boolean register(User user) {
        return repo.save(user) > 0;
    }
    public void update(User user) {
        repo.update(user);
    }
    public void delete(int userId) {
        repo.delete(userId);
    }
    public Optional<User> login(String email, String password, String role) {
        return repo.findByCredentials(email, password, role);
    }
    public boolean resetPasswordByEmail(String email, String newPwd) {
        return repo.updatePasswordByEmail(email, newPwd) > 0;
    }
    public Optional<User> findByEmail(String email) {
        return repo.findByEmail(email);
    }
    public Optional<User> findById(int userId) {
        return repo.findById(userId);
    }
}
