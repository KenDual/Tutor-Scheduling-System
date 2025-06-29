
package com.maiphuhai.model;

public class Tutor {
    private int tutor_id;
    private String education;
    private String profile;
    private double fee_default;
    
    public Tutor(){}

    public Tutor(int tutor_id, String education, String profile, double fee_default) {
        this.tutor_id = tutor_id;
        this.education = education;
        this.profile = profile;
        this.fee_default = fee_default;
    }

    public int getTutor_id() {
        return tutor_id;
    }

    public void setTutor_id(int tutor_id) {
        this.tutor_id = tutor_id;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public double getFee_default() {
        return fee_default;
    }

    public void setFee_default(double fee_default) {
        this.fee_default = fee_default;
    }
    
    
}
