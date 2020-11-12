package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.About;
import edu.fpt.entity.Account;
import edu.fpt.entity.LikePost;
import edu.fpt.entity.Post;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

public class AboutDAO implements DAO<About>{

    static About about = null;
    static String[] views;

    @Override
    public About getAbout(ConnectDB db) {
        if(about != null) return about;
        About ab = null;
        try{
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            String sql = "Select * from About";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                ab= new About(
                        rs.getNString("aName"),
                        rs.getInt("aAge"),
                        rs.getNString("aDescription"),
                        rs.getInt("aView"),
                        rs.getNString("aImage")
                );
            }
            rs.close();
            stmt.close();
        } catch(Exception ex){
            System.out.println(ex);
        }
        about = ab;
        return about;
    }


    @Override
    public Post updatePostView(ConnectDB db, Post post) {
        return null;
    }

    @Override
    public String[] getViews(ConnectDB db){
        if(views!=null) {
            //Check if session is invalidate
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            if(session==null || !request.isRequestedSessionIdValid() ) views = null;
            else return views;
        }
        try{
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            String sql = "Select aView from About";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            int aView = 0;
            if(rs.next()){
                aView = rs.getInt("aView");
            }
            aView = increaseView(db,aView);
            String[] ls = String.valueOf(aView).split("");
            rs.close();
            stmt.close();
            views = ls;
            return views;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }

    public int increaseView(ConnectDB db, int aView) {
        try {
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            aView++;
            String sql = "Update About set aView = " + aView;
            Statement stmt = con.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return aView;
    }

    @Override
    public List<About> getAll(ConnectDB db) {
        return null;
    }

    @Override
    public Optional<About> get(ConnectDB db, int id) {
        return Optional.empty();
    }

    @Override
    public void save(ConnectDB db, About about) {

    }

    @Override
    public void update(ConnectDB db, About about) {

    }

    @Override
    public void delete(ConnectDB db, About about) {

    }

    @Override
    public List<Post> getFamousPosts(ConnectDB db) {
        return null;
    }

    @Override
    public List<String> getListMonths(ConnectDB db) {
        return null;
    }

    @Override
    public List<Post> getListPostsByMonth(ConnectDB db, String month) {
        return null;
    }

    @Override
    public Account getAccount(ConnectDB db, String username) {
        return null;
    }

    @Override
    public boolean checkLike(ConnectDB db, LikePost likePost) {
        return false;
    }
}
