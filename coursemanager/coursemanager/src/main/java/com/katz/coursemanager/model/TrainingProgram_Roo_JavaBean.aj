// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.katz.coursemanager.model;

import com.katz.coursemanager.model.Course;
import com.katz.coursemanager.model.TrainingProgram;
import java.util.Set;

privileged aspect TrainingProgram_Roo_JavaBean {
    
    public String TrainingProgram.getName() {
        return this.name;
    }
    
    public void TrainingProgram.setName(String name) {
        this.name = name;
    }
    
    public Set<Course> TrainingProgram.getCourses() {
        return this.courses;
    }
    
    public void TrainingProgram.setCourses(Set<Course> courses) {
        this.courses = courses;
    }
    
}
