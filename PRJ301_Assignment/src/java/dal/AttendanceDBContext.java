/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;

/**
 *
 * @author ACER
 */
public class AttendanceDBContext extends DBContext<Attendance> {

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void update(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
