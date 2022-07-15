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
import model.Student;

/**
 *
 * @author ACER
 */
public class StudentDBContext extends DBContext<Student> {

    public ArrayList<Student> listStudentInAGroup(Integer GroupID) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "Select s.StudentID,s.StudentCode,s.StudentSurname,s.StudentMiddlename,s.StudentGivenname,s.StudentEmail,g.GroupID,g.GroupName,g.InstructorID,g.CourseID \n"
                    + "from Student s join StudentGroup sg on s.StudentID = sg.StudentID\n"
                    + "join [Group] g on sg.GroupID = g.GroupID\n"
                    + "Where g.GroupID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, GroupID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getString("StudentID"));
                s.setStudentCode(rs.getString("StudentCode"));
                s.setStudentSurname(rs.getString("StudentSurname"));
                s.setStudentMiddlename(rs.getString("StudentMiddlename"));
                s.setStudentGivenname(rs.getString("StudentGivenname"));
                s.setStudentEmail(rs.getString("StudentEmail"));
                Group g = new Group();
                g.setGroupID(rs.getInt("GroupID"));
                g.setGroupName(rs.getString("GroupName"));
                Instructor i = new Instructor();
                i.setInstructorID(rs.getString("InstructorID"));
                g.setInstructorID(i);
                Course c = new Course();
                c.setCourseID(rs.getString("CourseID"));
                g.setCourseID(c);
                s.setGroupID(g);
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public Student getStudentInformation(String StudentID) {
        try {
            String sql = "SELECT StudentID,StudentCode,StudentSurname,StudentMiddlename,StudentGivenname,StudentEmail FROM Student\n"
                    + "Where StudentID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, StudentID);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                Student s = new Student();
                s.setStudentID(rs.getString("StudentID"));
                s.setStudentCode(rs.getString("StudentCode"));
                s.setStudentSurname(rs.getString("StudentSurname"));
                s.setStudentMiddlename(rs.getString("StudentMiddlename"));
                s.setStudentGivenname(rs.getString("StudentGivenname"));
                s.setStudentEmail(rs.getString("StudentEmail"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
