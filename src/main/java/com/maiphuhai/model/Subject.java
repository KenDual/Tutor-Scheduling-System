
package com.maiphuhai.model;

import java.util.Date;

public class Subject {
    private int subject_id;
    private String name;
    private String description;
    private Date create_at;
    
    public Subject(){}

    public Subject(int subject_id, String name, String description, Date create_at) {
        this.subject_id = subject_id;
        this.name = name;
        this.description = description;
        this.create_at = create_at;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }
    
     
}
