/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class Instructor {
    private String InstructorID;
    private String InstructorName;
    private String InstructorEmail;
    private ArrayList<Group> groups = new ArrayList<>();

    public ArrayList<Group> getGroups() {
        return groups;
    }

    public void setGroups(ArrayList<Group> groups) {
        this.groups = groups;
    }
    
    public String getInstructorID() {
        return InstructorID;
    }

    public void setInstructorID(String InstructorID) {
        this.InstructorID = InstructorID;
    }

    public String getInstructorName() {
        return InstructorName;
    }

    public void setInstructorName(String InstructorName) {
        this.InstructorName = InstructorName;
    }

    public String getInstructorEmail() {
        return InstructorEmail;
    }

    public void setInstructorEmail(String InstructorEmail) {
        this.InstructorEmail = InstructorEmail;
    }
    
    
}
