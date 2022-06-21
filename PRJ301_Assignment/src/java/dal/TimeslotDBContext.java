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
import model.Timeslot;

/**
 *
 * @author ACER
 */
public class TimeslotDBContext extends DBContext<Timeslot> {

    @Override
    public ArrayList<Timeslot> list() {
        ArrayList<Timeslot> ts = new ArrayList<>();
        try {
            String sql = "Select TimeslotID,[start],[end] from Timeslot";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Timeslot t = new Timeslot();
                t.setTimeslotID(rs.getString("TimeslotID"));
                t.setStart(rs.getTime("start"));
                t.setEnd(rs.getTime("end"));
                ts.add(t);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeslotDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ts;
    }

    @Override
    public Timeslot get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Timeslot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Timeslot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Timeslot model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
