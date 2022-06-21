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
public class Student {
    String StudentID;
    String StudentCode;
    String StudentSurname;
    String StudentMiddlename;
    String StudentGivenname;
    String StudentEmail;
    ArrayList<Attendance> attendances = new ArrayList<>();
    ArrayList<StudentGroup> studentgroups = new ArrayList<>();

    public ArrayList<Attendance> getAttendances() {
        return attendances;
    }

    public void setAttendances(ArrayList<Attendance> attendances) {
        this.attendances = attendances;
    }

    public ArrayList<StudentGroup> getStudentgroups() {
        return studentgroups;
    }

    public void setStudentgroups(ArrayList<StudentGroup> studentgroups) {
        this.studentgroups = studentgroups;
    }
    
    public String getStudentID() {
        return StudentID;
    }

    public void setStudentID(String StudentID) {
        this.StudentID = StudentID;
    }

    public String getStudentCode() {
        return StudentCode;
    }

    public void setStudentCode(String StudentCode) {
        this.StudentCode = StudentCode;
    }

    public String getStudentSurname() {
        return StudentSurname;
    }

    public void setStudentSurname(String StudentSurname) {
        this.StudentSurname = StudentSurname;
    }

    public String getStudentMiddlename() {
        return StudentMiddlename;
    }

    public void setStudentMiddlename(String StudentMiddlename) {
        this.StudentMiddlename = StudentMiddlename;
    }

    public String getStudentGivenname() {
        return StudentGivenname;
    }

    public void setStudentGivenname(String StudentGivenname) {
        this.StudentGivenname = StudentGivenname;
    }

    public String getStudentEmail() {
        return StudentEmail;
    }

    public void setStudentEmail(String StudentEmail) {
        this.StudentEmail = StudentEmail;
    }
    
    
}
