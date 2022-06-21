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
import model.Course;
import model.Group;
import model.Instructor;

/**
 *
 * @author ACER
 */
public class GroupDBContext extends DBContext<Group> {

    @Override
    public ArrayList<Group> list() {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "SELECT [GroupID]\n"
                    + "      ,[GroupName]\n"
                    + "      ,[InstructorID]\n"
                    + "      ,[CourseID]\n"
                    + "  FROM [dbo].[Group]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setGroupID(rs.getInt("GroupID"));
                g.setGroupName(rs.getString("GroupName"));
                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    public ArrayList<Group> listGroupByCourse(String CourseID) {
        ArrayList<Group> groups = new ArrayList<>();
        try {
            String sql = "Select g.GroupID,g.GroupName,g.InstructorID,c.CourseID,c.CourseName from [Group] g join Course c On g.CourseID = c.CourseID\n"
                    + "Where c.CourseID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, CourseID);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Group g = new Group();
                g.setGroupID(rs.getInt("GroupID"));
                g.setGroupName(rs.getString("GroupName"));
                Instructor i = new Instructor();
                i.setInstructorID(rs.getString("InstructorID"));
                g.setInstructorID(i);
                Course c = new Course();
                c.setCourseID(rs.getString("CourseId"));
                c.setCourseName(rs.getString("CourseName"));
                g.setCourseID(c);
                groups.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return groups;
    }

    @Override
    public Group get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
