
package com.maiphuhai.model;

public class Student {
    private int student_id;
    private String grade_level;
    private String learning_goal;
    
    public Student(){}

    public Student(int student_id, String grade_level, String learning_goal) {
        this.student_id = student_id;
        this.grade_level = grade_level;
        this.learning_goal = learning_goal;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public String getGrade_level() {
        return grade_level;
    }

    public void setGrade_level(String grade_level) {
        this.grade_level = grade_level;
    }

    public String getLearning_goal() {
        return learning_goal;
    }

    public void setLearning_goal(String learning_goal) {
        this.learning_goal = learning_goal;
    }
    
    
}
