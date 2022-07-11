/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;
import model.Course;
import model.Group;
import model.Instructor;
import model.Room;
import model.Session;
import model.Student;
import model.Timeslot;

/**
 *
 * @author ACER
 */
public class AttendanceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> listAttendanceInAGroup(int groupID) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "SELECT a.StudentID, LOWER(a.Status) as Status,a.Recordtime,a.Comment,se.SessionID,se.SessionNumber,se.SessionDate,se.Semester,se.RoomID,se.TimeslotID,se.GroupID\n"
                    + "FROM Attendance a join [Session] se on a.SessionID = se.SessionID\n"
                    + "Where GroupID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, groupID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                Student s = new Student();
                s.setStudentID(rs.getString("StudentID"));
                a.setStudentID(s);
                Session se = new Session();
                se.setSessionID(rs.getInt("SessionID"));
                se.setSessionNumber(rs.getInt("SessionNumber"));
                se.setSessionDate(rs.getDate("SessionDate"));
                se.setSemester(rs.getString("Semester"));
                Room r = new Room();
                r.setRoomID(rs.getString("RoomID"));
                se.setRoomID(r);
                Timeslot t = new Timeslot();
                t.setTimeslotID(rs.getString("TimeslotID"));
                se.setTimeslotID(t);
                Group g = new Group();
                g.setGroupID(groupID);
                se.setGroupID(g);
                a.setSessionID(se);
                a.setStatus(rs.getString("Status"));
                a.setRecordtime(rs.getTime("Recordtime"));
                a.setCommment(rs.getString("Comment"));
                attendances.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return attendances;
    }

    @Override
    public Attendance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void takeAttendances(ArrayList<Attendance> attendances) {
        try {
            connection.setAutoCommit(false);
            for (Attendance attendance : attendances) {
                String sql = "INSERT INTO [dbo].[Attendance]\n"
                        + "           ([StudentID]\n"
                        + "           ,[SessionID]\n"
                        + "           ,[Status]\n"
                        + "           ,[Recordtime]\n"
                        + "           ,[Comment])\n"
                        + "     VALUES\n"
                        + "           (?,?,?,?,?)";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, attendance.getStudentID().getStudentID());
                stm.setInt(2, attendance.getSessionID().getSessionID());
                stm.setString(3, attendance.getStatus());
                stm.setTime(4, attendance.getRecordtime());
                stm.setString(5, attendance.getCommment());
                stm.executeUpdate();
            }
            connection.commit();

        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Attendance> listAttendanceInASession(int sessionID) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "Select a.Status,a.Recordtime,a.Comment,s.StudentID,s.StudentCode,s.StudentSurname,s.StudentMiddlename,s.StudentGivenname,s.StudentEmail,se.SessionID,se.SessionNumber\n"
                    + ",se.SessionDate,se.Semester,se.RoomID,se.TimeslotID,se.InstructorID,g.GroupID,g.GroupName,g.InstructorID,c.CourseID,c.CourseName\n"
                    + "from Attendance a\n"
                    + "join Student s on a.StudentID = s.StudentID\n"
                    + "join [Session] se on a.SessionID = se.SessionID\n"
                    + "join [Group] g on g.GroupID = se.GroupID\n"
                    + "join Course c on g.CourseID = c.CourseID\n"
                    + "where a.SessionID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sessionID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                Student s = new Student();
                s.setStudentID(rs.getString("StudentID"));
                s.setStudentCode(rs.getString("StudentCode"));
                s.setStudentSurname(rs.getString("StudentSurname"));
                s.setStudentMiddlename(rs.getString("StudentMiddlename"));
                s.setStudentGivenname(rs.getString("StudentGivenname"));
                s.setStudentEmail(rs.getString("StudentEmail"));
                a.setStudentID(s);
                Session se = new Session();
                se.setSessionID(rs.getInt("SessionID"));
                se.setSessionNumber(rs.getInt("SessionNumber"));
                se.setSessionDate(rs.getDate("SessionDate"));
                se.setSemester(rs.getString("Semester"));
                Instructor ise = new Instructor();
                ise.setInstructorID(rs.getString(16));
                se.setInstructorID(ise);
                Room r = new Room();
                r.setRoomID(rs.getString("RoomID"));
                se.setRoomID(r);
                Timeslot t = new Timeslot();
                t.setTimeslotID(rs.getString("TimeslotID"));
                se.setTimeslotID(t);
                Group g = new Group();
                g.setGroupID(rs.getInt("GroupID"));
                g.setGroupName(rs.getString("GroupName"));
                Instructor ig = new Instructor();
                ig.setInstructorID(rs.getString(19));
                Course c = new Course();
                c.setCourseID(rs.getString("CourseID"));
                c.setCourseName(rs.getString("CourseName"));
                g.setCourseID(c);
                g.setInstructorID(ig);
                se.setGroupID(g);
                a.setSessionID(se);
                a.setStatus(rs.getString("Status"));
                a.setRecordtime(rs.getTime("Recordtime"));
                a.setCommment(rs.getString("Comment"));
                attendances.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return attendances;
    }

    public boolean isTakeAttendance(int sessionID) {
        try {
            String sql = "Select * from Attendance where SessionID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sessionID);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public void update(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
