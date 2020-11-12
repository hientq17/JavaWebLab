package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.About;
import edu.fpt.entity.Account;
import edu.fpt.entity.LikePost;
import edu.fpt.entity.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Optional;

public class LikeDAO implements DAO<LikePost> {

    @Override
    public void save(ConnectDB db, LikePost likePost) {
        try{
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            String sql = "Insert into LikePost values (?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, likePost.getUsername());
            pstmt.setInt(2, likePost.getpId());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex){
            System.out.println(ex);
        }
    }

    @Override
    public void delete(ConnectDB db, LikePost likePost) {
        try{
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            String sql = "Delete LikePost where username = ? and pId = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, likePost.getUsername());
            pstmt.setInt(2, likePost.getpId());
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception ex){
            System.out.println(ex);
        }
    }

    @Override
    public boolean checkLike(ConnectDB db, LikePost likePost) {
        try{
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            String sql = "Select * from LikePost where username = ? and pId = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, likePost.getUsername());
            pstmt.setInt(2, likePost.getpId());
            ResultSet rs = pstmt.executeQuery();
            boolean check = false;
            if(rs.next()) check = true;
            pstmt.close();
            rs.close();
            return check;
        } catch (Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    @Override
    public List<LikePost> getAll(ConnectDB db) {
        return null;
    }


    @Override
    public Optional<LikePost> get(ConnectDB db, int id) {
        return Optional.empty();
    }

    @Override
    public void update(ConnectDB db, LikePost likePost) {

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
    public List<String> getListMonths(ConnectDB db) {
        return null;
    }

    @Override
    public List<Post> getListPostsByMonth(ConnectDB db, String month) {
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
    public Account getAccount(ConnectDB db, String username) {
        return null;
    }
}
