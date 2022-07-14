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
import model.Account;
import model.Feature;
import model.Role;

/**
 *
 * @author ACER
 */
public class AccountDBContext extends DBContext<Account> {

    public Account get(String username, String password) {
        try {
            String sql = "Select a.username,a.password,a.id,\n"
                    + "ISNULL(r.rid,-1) as rid,r.rname,\n"
                    + "ISNULL(f.fid,-1) as fid,f.fname,f.url From \n"
                    + "Account a left join RoleAccount ra on a.username = ra.username\n"
                    + "left join [Role] r on ra.rid = r.rid\n"
                    + "left join RoleFeature rf on r.rid = rf.rid\n"
                    + "left join Feature f on rf.fid = f.fid\n"
                    + "WHERE a.username = ? AND a.[password] = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();

            Account account = null;

            Role currRole = new Role();
            currRole.setRid(-1);

            Feature currFeature = new Feature();
            currFeature.setFid(-1);

            while (rs.next()) {
                if (account == null) {
                    account = new Account();
                    account.setUsername(username);
                    account.setId(rs.getString("id"));
                }

                int rid = rs.getInt("rid");
                if (rid != -1) {
                    if (rid != currRole.getRid()) {
                        currRole = new Role();
                        currRole.setRid(rid);
                        currRole.setRname(rs.getString("rname"));
                        account.getRoles().add(currRole);
                    }
                }

                int fid = rs.getInt("fid");
                if (fid != -1) {
                    if (fid != currFeature.getFid()) {
                        currFeature = new Feature();
                        currFeature.setFid(fid);
                        currFeature.setFname(rs.getString("fname"));
                        currFeature.setUrl(rs.getString("url"));
                        currRole.getFeatures().add(currFeature);
                    }
                }
            }
            return account;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
