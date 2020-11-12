package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Admin;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

public class AdminDAO implements DAO<Admin> {

    @Override
    public List<Admin> getAll() {
        return null;
    }

    @Override
    public Optional<Admin> get(int id) {
        return Optional.empty();
    }

    @Override
    public Optional<Admin> get(String username) {
        try {
            //Connect database
            ConnectDB db = new ConnectDB();
            Connection con = db.openConnection();
            String sql = "Select * from Admin where username ='"+username+"'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            Admin admin = null;
            if (rs.next()) {
                admin = new Admin(
                        rs.getString("username"),
                        rs.getString("password")
                );
            }
            rs.close();
            stmt.close();
            con.close();
            return Optional.ofNullable(admin);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return Optional.empty();
    }


    @Override
    public Optional<Admin> getAbout() {
        return Optional.empty();
    }

    @Override
    public String[] getViews() {
        return new String[0];
    }

    @Override
    public void save(Admin admin) {

    }

    @Override
    public void update(Admin admin) {

    }

    @Override
    public void delete(Admin admin) {

    }
}
