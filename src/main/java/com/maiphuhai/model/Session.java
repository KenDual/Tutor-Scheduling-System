
package com.maiphuhai.model;

import java.util.Date;

public class Session {
    private int    session_id;
    private String session_code;
    private int    tutor_id;
    private int    subject_id;
    private String day_of_week; 
    private int    slot;        
    private String location;
    private int    capacity;
    private String status;      
    private Date   created_at;
    
    private String subjectName;
    private String tutorName;
    
    public Session(){}

    public Session(int session_id, String session_code, int tutor_id, int subject_id, String day_of_week, int slot, String location, int capacity, String status, Date created_at, String subjectName, String tutorName) {
        this.session_id = session_id;
        this.session_code = session_code;
        this.tutor_id = tutor_id;
        this.subject_id = subject_id;
        this.day_of_week = day_of_week;
        this.slot = slot;
        this.location = location;
        this.capacity = capacity;
        this.status = status;
        this.created_at = created_at;
        this.subjectName = subjectName;
        this.tutorName = tutorName;
    }

    public int getSession_id() {
        return session_id;
    }

    public void setSession_id(int session_id) {
        this.session_id = session_id;
    }

    public String getSession_code() {
        return session_code;
    }

    public void setSession_code(String session_code) {
        this.session_code = session_code;
    }

    public int getTutor_id() {
        return tutor_id;
    }

    public void setTutor_id(int tutor_id) {
        this.tutor_id = tutor_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getDay_of_week() {
        return day_of_week;
    }

    public void setDay_of_week(String day_of_week) {
        this.day_of_week = day_of_week;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getTutorName() {
        return tutorName;
    }

    public void setTutorName(String tutorName) {
        this.tutorName = tutorName;
    }

    
}
