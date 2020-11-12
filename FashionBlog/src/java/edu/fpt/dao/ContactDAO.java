package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Optional;

public class ContactDAO implements DAO<Contact>{

    @Override
    public void save(ConnectDB db, Contact contact) {
        try{
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            String sql = "Insert into Contact values(?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setNString(1,contact.getcEmail());
            pstmt.setNString(2,contact.getcName());
            pstmt.setNString(3,contact.getcDescription());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex){
            System.out.println(ex);
        }
    }

    @Override
    public List<Contact> getAll(ConnectDB db) {
        return null;
    }

    @Override
    public Optional<Contact> get(ConnectDB db, int id) {
        return Optional.empty();
    }

    @Override
    public void update(ConnectDB db, Contact contact) {

    }

    @Override
    public void delete(ConnectDB db, Contact contact) {

    }

    @Override
    public About getAbout(ConnectDB db) {
        return null;
    }

    @Override
    public List<Post> getFamousPosts(ConnectDB db) {
        return null;
    }

    @Override
    public Post updatePostView(ConnectDB db, Post post) {
        return null;
    }

    @Override
    public String[] getViews(ConnectDB db) {
        return new String[0];
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
