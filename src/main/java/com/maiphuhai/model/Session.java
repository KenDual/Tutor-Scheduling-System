package com.maiphuhai.model;

public class Session {

    private Integer sessionId;
    private Integer tutorId;
    private Integer subjectId;
    private String day;    
    private String slot;    
    private String status;
    
    private String tutorName;
    private String subjectName;
    private Integer booked;   

    public static final String ST_PENDING = "pending";
    public static final String ST_SCHEDULED = "scheduled";
    public static final String ST_CANCELLED = "cancelled";
    public static final String ST_COMPLETED = "completed";
    
    public Session(){}

    public Session(Integer sessionId, Integer tutorId, Integer subjectId, String day, String slot, String status, String tutorName, String subjectName, Integer booked) {
        this.sessionId = sessionId;
        this.tutorId = tutorId;
        this.subjectId = subjectId;
        this.day = day;
        this.slot = slot;
        this.status = status;
        this.tutorName = tutorName;
        this.subjectName = subjectName;
        this.booked = booked;
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

    
    
}
