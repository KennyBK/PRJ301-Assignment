/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Group;
import model.Instructor;
import model.Room;
import model.Session;
import model.Timeslot;

/**
 *
 * @author ACER
 */
public class SessionDBContext extends DBContext<Session> {

    public ArrayList<Session> getListSessionInSpecificWeek(Date startWeek, Date endWeek) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "Select ts.TimeslotID,ts.[start],ts.[end],se.SessionID,se.SessionNumber,se.SessionDate,se.Semester,se.RoomID,g.GroupID,g.GroupName,g.InstructorID,c.CourseID,c.CourseName from Timeslot ts \n"
                    + "join [Session] se On ts.TimeslotID = se.TimeslotID \n"
                    + "join [Group] g On se.GroupID = g.GroupID\n"
                    + "join Course c On g.CourseID = c.CourseID\n"
                    + "Where SessionDate Between ? And ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, startWeek);
            stm.setDate(2, endWeek);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session se = new Session();
                se.setSessionID(rs.getInt("SessionID"));
                se.setSessionNumber(rs.getInt("SessionNumber"));
                se.setSessionDate(rs.getDate("SessionDate"));
                se.setSemester(rs.getString("Semester"));
                Room r = new Room();
                r.setRoomID(rs.getString("RoomID"));
                se.setRoomID(r);
                Group g = new Group();
                g.setGroupID(rs.getInt("GroupID"));
                g.setGroupName(rs.getString("GroupName"));
                Instructor i = new Instructor();
                i.setInstructorID(rs.getString("InstructorID"));
                g.setInstructorID(i);
                Course c = new Course();
                c.setCourseID(rs.getString("CourseID"));
                c.setCourseName(rs.getString("CourseName"));
                g.setCourseID(c);
                se.setGroupID(g);
                Timeslot ts = new Timeslot();
                ts.setTimeslotID(rs.getString("TimeslotID"));
                ts.setStart(rs.getTime("start"));
                ts.setEnd(rs.getTime("end"));
                se.setTimeslotID(ts);
                sessions.add(se);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeslotDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public ArrayList<Session> getSessionInADay(String instructorID, Date date) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "Select se.SessionID,se.SessionNumber,se.SessionDate,se.Semester,r.RoomID,t.TimeslotID,g.GroupID,t.[start],t.[end],g.GroupName,i.InstructorID,c.CourseID,c.CourseName,i.InstructorName\n"
                    + "From \n"
                    + "[Session] se join Timeslot t on se.TimeslotID = t.TimeslotID\n"
                    + "join Room r on se.RoomID = r.RoomID \n"
                    + "join [Group] g on se.GroupID = g.GroupID\n"
                    + "join Course c on g.CourseID =  c.CourseID\n"
                    + "join Instructor i on g.InstructorID = i.InstructorID\n"
                    + "Where i.InstructorID = ? AND se.SessionDate = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, instructorID);
            stm.setDate(2, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session se = new Session();
                se.setSessionID(rs.getInt("SessionID"));
                se.setSessionNumber(rs.getInt("SessionNumber"));
                se.setSessionDate(rs.getDate("SessionDate"));
                se.setSemester(rs.getString("Semester"));
                Room r = new Room();
                r.setRoomID(rs.getString("RoomID"));
                se.setRoomID(r);
                Group g = new Group();
                g.setGroupID(rs.getInt("GroupID"));
                g.setGroupName(rs.getString("GroupName"));
                Instructor i = new Instructor();
                i.setInstructorID(rs.getString("InstructorID"));
                g.setInstructorID(i);
                Course c = new Course();
                c.setCourseID(rs.getString("CourseID"));
                c.setCourseName(rs.getString("CourseName"));
                g.setCourseID(c);
                se.setGroupID(g);
                Timeslot ts = new Timeslot();
                ts.setTimeslotID(rs.getString("TimeslotID"));
                ts.setStart(rs.getTime("start"));
                ts.setEnd(rs.getTime("end"));
                se.setTimeslotID(ts);
                sessions.add(se);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Session get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
