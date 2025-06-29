
package com.maiphuhai.model;

import java.util.Date;

public class StudentBooking {
    private int bookingId;
    private int sessionId;
    private int studentId;
    private Date bookingTime;
    private String status;

    // Constructor mặc định
    public StudentBooking() {}

    public StudentBooking(int bookingId, int sessionId, int studentId, Date bookingTime, String status) {
        this.bookingId = bookingId;
        this.sessionId = sessionId;
        this.studentId = studentId;
        this.bookingTime = bookingTime;
        this.status = status;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public Date getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(Date bookingTime) {
        this.bookingTime = bookingTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
