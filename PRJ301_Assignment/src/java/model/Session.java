/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class Session {
    private int SessionID;
    private int SessionNumber;
    private Date SessionDate;
    private String Semester;
    private Room RoomID;
    private Timeslot TimeslotID;
    private Group GroupID;
    private Instructor InstructorID;
    private ArrayList<Attendance> attendances = new ArrayList<>();

    public Instructor getInstructorID() {
        return InstructorID;
    }

    public void setInstructorID(Instructor InstructorID) {
        this.InstructorID = InstructorID;
    }

    public ArrayList<Attendance> getAttendances() {
        return attendances;
    }

    public void setAttendances(ArrayList<Attendance> attendances) {
        this.attendances = attendances;
    }
    
    public int getSessionID() {
        return SessionID;
    }

    public void setSessionID(int SessionID) {
        this.SessionID = SessionID;
    }

    public int getSessionNumber() {
        return SessionNumber;
    }

    public void setSessionNumber(int SessionNumber) {
        this.SessionNumber = SessionNumber;
    }

    public Date getSessionDate() {
        return SessionDate;
    }

    public void setSessionDate(Date SessionDate) {
        this.SessionDate = SessionDate;
    }

    public String getSemester() {
        return Semester;
    }

    public void setSemester(String Semester) {
        this.Semester = Semester;
    }

    public Room getRoomID() {
        return RoomID;
    }

    public void setRoomID(Room RoomID) {
        this.RoomID = RoomID;
    }

    public Timeslot getTimeslotID() {
        return TimeslotID;
    }

    public void setTimeslotID(Timeslot TimeslotID) {
        this.TimeslotID = TimeslotID;
    }

    public Group getGroupID() {
        return GroupID;
    }

    public void setGroupID(Group GroupID) {
        this.GroupID = GroupID;
    }
    
    
}
