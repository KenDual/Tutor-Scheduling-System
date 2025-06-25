
package com.maiphuhai.model;

import java.time.LocalDateTime;


public class User {
    private int user_id;
    private String email;
    private String password;
    private String role;
    private String full_name;
    private String phone;
    private LocalDateTime create_at;
    
    public User(){}

    public User(int user_id, String email, String password, String role, String full_name, String phone, LocalDateTime create_at) {
        this.user_id = user_id;
        this.email = email;
        this.password = password;
        this.role = role;
        this.full_name = full_name;
        this.phone = phone;
        this.create_at = create_at;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDateTime getCreate_at() {
        return create_at;
    }

    public void setCreate_at(LocalDateTime create_at) {
        this.create_at = create_at;
    }

    
    
}
