// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katz.coursemanager.model;

import com.katz.coursemanager.model.Instructor;

privileged aspect Instructor_Roo_JavaBean {
    
    public String Instructor.getTaxNumber() {
        return this.taxNumber;
    }
    
    public void Instructor.setTaxNumber(String taxNumber) {
        this.taxNumber = taxNumber;
    }
    
    public boolean Instructor.isActive() {
        return this.active;
    }
    
    public void Instructor.setActive(boolean active) {
        this.active = active;
    }
    
}
