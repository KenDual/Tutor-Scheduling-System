package com.maiphuhai.model;

import java.time.LocalDateTime;

public class Session {
    private Integer sessionId;
    private Integer tutorId;
    private Integer subjectId;
    private String day;
    private String slot;
    private String location;
    private Double fee;
    private Integer capacity;
    private String status;
    
    private String tutorName;     // email GV
    private String subjectName;   // tên môn
    private Integer booked;       // số HS đã đặt
    private LocalDateTime createdAt;
   
    public Session(){}

    public Session(Integer sessionId, Integer tutorId, Integer subjectId, String day, String slot, String location, Double fee, Integer capacity, String status, String tutorName, String subjectName, Integer booked, LocalDateTime createdAt) {
        this.sessionId = sessionId;
        this.tutorId = tutorId;
        this.subjectId = subjectId;
        this.day = day;
        this.slot = slot;
        this.location = location;
        this.fee = 0.0;
        this.capacity = 10;
        this.status = "scheduled";
        this.tutorName = tutorName;
        this.subjectName = subjectName;
        this.booked = booked;
        this.createdAt = createdAt;
    }

    public Integer getSessionId() {
        return sessionId;
    }

    public void setSessionId(Integer sessionId) {
        this.sessionId = sessionId;
    }

    public Integer getTutorId() {
        return tutorId;
    }

    public void setTutorId(Integer tutorId) {
        this.tutorId = tutorId;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getSlot() {
        return slot;
    }

    public void setSlot(String slot) {
        this.slot = slot;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Double getFee() {
        return fee;
    }

    public void setFee(Double fee) {
        this.fee = fee;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTutorName() {
        return tutorName;
    }

    public void setTutorName(String tutorName) {
        this.tutorName = tutorName;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public Integer getBooked() {
        return booked;
    }

    public void setBooked(Integer booked) {
        this.booked = booked;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    

    

}
