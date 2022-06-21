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
public class Group {
    int GroupID;
    String GroupName;
    Instructor InstructorID;
    Course CourseID;
    Student StudentID;
    ArrayList<Session> sessions = new ArrayList<>();
    ArrayList<StudentGroup> studentgroups = new ArrayList<>();

    public Student getStudentID() {
        return StudentID;
    }

    public void setStudentID(Student StudentID) {
        this.StudentID = StudentID;
    }

    public ArrayList<Session> getSessions() {
        return sessions;
    }

    public void setSessions(ArrayList<Session> sessions) {
        this.sessions = sessions;
    }

    public ArrayList<StudentGroup> getStudentgroups() {
        return studentgroups;
    }

    public void setStudentgroups(ArrayList<StudentGroup> studentgroups) {
        this.studentgroups = studentgroups;
    }
    
    
    
    public int getGroupID() {
        return GroupID;
    }

    public void setGroupID(int GroupID) {
        this.GroupID = GroupID;
    }

    public String getGroupName() {
        return GroupName;
    }

    public void setGroupName(String GroupName) {
        this.GroupName = GroupName;
    }

    public Instructor getInstructorID() {
        return InstructorID;
    }

    public void setInstructorID(Instructor InstructorID) {
        this.InstructorID = InstructorID;
    }

    public Course getCourseID() {
        return CourseID;
    }

    public void setCourseID(Course CourseID) {
        this.CourseID = CourseID;
    }
    
    
}
