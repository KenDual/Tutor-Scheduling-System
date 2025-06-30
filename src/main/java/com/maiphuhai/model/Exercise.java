package com.maiphuhai.model;

import java.time.LocalDateTime;

public class Exercise {
    private int exerciseId;
    private int sessionId;
    private String title;
    private String description;
    private String dueDate;

    public Exercise() {}

    public Exercise(int exerciseId, int sessionId, String title, String description, String dueDate) {
        this.exerciseId = exerciseId;
        this.sessionId = sessionId;
        this.title = title;
        this.description = description;
        this.dueDate = dueDate;
    }

    public int getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(int exerciseId) {
        this.exerciseId = exerciseId;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }
}
