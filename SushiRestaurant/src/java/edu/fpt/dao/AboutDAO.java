package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

public class AboutDAO implements DAO<About>{

    static About about = null;
    
    @Override
    public List<About> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public About getAbout() {
        if(about!=null) return about; 
        About ab = null;
        try{
            //Connect database
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            String sql = "Select * from About";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                ab = new About(
                        rs.getNString("aAddress"),
                        rs.getNString("aPhone"),
                        rs.getNString("aEmail"),
                        rs.getNString("aOpening"),
                        rs.getInt("aView")
                );
            }
            rs.close();
            stmt.close();
            con.close();
            about = ab;
            return about;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }

    @Override
    public Optional<About> get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String[] getViews(){
        try{
            //Connect database
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            String sql = "Select aView from About";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int aView = 0;
            if(rs.next()){
               aView = rs.getInt("aView");
            }
            aView++;
            sql = "Update About set aView = "+aView;
            stmt.executeUpdate(sql);
            String[] ls = String.valueOf(aView).split("");
            rs.close();
            stmt.close();
            con.close();
            return ls;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }
}
