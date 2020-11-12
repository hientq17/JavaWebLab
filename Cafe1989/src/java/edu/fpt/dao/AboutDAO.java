package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.About;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

public class AboutDAO implements DAO<About> {

    static About about = null;
    static String[] views;
    
    @Override
    public List<About> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Optional<About> getAbout() {
        if(about!=null) return Optional.of(about);
        About ab = null;
        try{
            //Connect database
            ConnectDB db = new ConnectDB();
            Connection con = db.openConnection();
            String sql = "Select * from About";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                ab = new About(
                        rs.getNString("aName"),
                        rs.getNString("aAddress"),
                        rs.getNString("aPhone"),
                        rs.getNString("aEmail"),
                        rs.getNString("aOpening"),
                        rs.getInt("aView"),
                        rs.getNString("aDescription"),
                        rs.getString("aImage"),
                        rs.getNString("aComboName"),
                        rs.getString("aComboImage"),
                        rs.getNString("aComboDescription")
                );
                System.out.println("cbimg: "+rs.getString("aComboImage"));
            }
            rs.close();
            stmt.close();
            con.close();
            about = ab;
            return Optional.of(about);
        } catch(Exception ex){
            System.out.println(ex);
        }
        return Optional.empty();
    }

    @Override
    public Optional<About> get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Optional<About> get(String s) {
        return Optional.empty();
    }

    @Override
    public void save(About about) {

    }

    @Override
    public void update(About about) {

    }

    @Override
    public void delete(About about) {

    }

    @Override
    public String[] getViews(){
        if(views!=null) {
            //Check if session is invalidate
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            if(session==null || !request.isRequestedSessionIdValid() ) views = null;
            else return views;
        }
        try{
            //Connect database
            ConnectDB db = new ConnectDB();
            Connection con = db.openConnection();
            String sql = "Select aView from About";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int aView = 0;
            if(rs.next()){
               aView = rs.getInt("aView");
            }
            aView = increaseView(con,aView);
            String[] ls = String.valueOf(aView).split("");
            rs.close();
            stmt.close();
            con.close();
            views = ls;
            return views;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }

    public int increaseView(Connection con, int aView) {
        try {
            aView++;
            String sql = "Update About set aView = " + aView;
            Statement stmt = con.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return aView;
    }

}
