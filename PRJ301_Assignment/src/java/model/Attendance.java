/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;

/**
 *
 * @author ACER
 */
public class Attendance {
    private Student StudentID;
    private Session SessionID;
    private String status;
    private Time Recordtime;
    private String commment;

    public Student getStudentID() {
        return StudentID;
    }

    public void setStudentID(Student StudentID) {
        this.StudentID = StudentID;
    }

    public Session getSessionID() {
        return SessionID;
    }

    public void setSessionID(Session SessionID) {
        this.SessionID = SessionID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Time getRecordtime() {
        return Recordtime;
    }

    public void setRecordtime(Time Recordtime) {
        this.Recordtime = Recordtime;
    }

    public String getCommment() {
        return commment;
    }

    public void setCommment(String commment) {
        this.commment = commment;
    }
    
    
}
