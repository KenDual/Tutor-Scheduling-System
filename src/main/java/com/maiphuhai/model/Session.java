
package com.maiphuhai.model;

import java.util.Date;

public class Session {
    private int session_id;
    private String session_code;
    private int tutor_id;
    private int subject_id;
    private String location;
    private int capacity;
    private String status;
    private Date created_at;
    private String day;
    private int slot;
    
    public Session(){}

    public Session(int session_id, String session_code, int tutor_id, int subject_id, String location, int capacity, String status, Date created_at, String day, int slot) {
        this.session_id = session_id;
        this.session_code = session_code;
        this.tutor_id = tutor_id;
        this.subject_id = subject_id;
        this.location = location;
        this.capacity = capacity;
        this.status = status;
        this.created_at = created_at;
        this.day = day;
        this.slot = slot;
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

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    
}
