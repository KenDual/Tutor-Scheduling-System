package com.maiphuhai.model;

import java.util.Date;

public class Timetable {

    private int timetable_id;
    private int session_id;
    private String day_of_week;
    private int slot;
    private String location;
    private String status;
    private Date create_at;
    
    public Timetable(){}

    public Timetable(int timetable_id, int session_id, String day_of_week, int slot, String location, String status, Date create_at) {
        this.timetable_id = timetable_id;
        this.session_id = session_id;
        this.day_of_week = day_of_week;
        this.slot = slot;
        this.location = location;
        this.status = status;
        this.create_at = create_at;
    }

    public int getTimetable_id() {
        return timetable_id;
    }

    public void setTimetable_id(int timetable_id) {
        this.timetable_id = timetable_id;
    }

    public int getSession_id() {
        return session_id;
    }

    public void setSession_id(int session_id) {
        this.session_id = session_id;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }
}
