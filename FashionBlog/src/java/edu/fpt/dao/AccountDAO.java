package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.About;
import edu.fpt.entity.Account;
import edu.fpt.entity.LikePost;
import edu.fpt.entity.Post;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

public class AccountDAO implements DAO<Account> {

    @Override
    public Account getAccount(ConnectDB db, String username) {
        try {
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            String sql = "Select * from Account where username ='"+username+"'";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            Account acc = null;
            if (rs.next()) {
                acc = new Account(
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getBoolean("admin")
                );
            }
            rs.close();
            stmt.close();
            return acc;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    @Override
    public List<Account> getAll(ConnectDB db) {
        return null;
    }

    @Override
    public Optional<Account> get(ConnectDB db, int id) {
        return Optional.empty();
    }

    @Override
    public void save(ConnectDB db, Account account) {

    }

    @Override
    public void update(ConnectDB db, Account account) {

    }

    @Override
    public void delete(ConnectDB db, Account account) {

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
    public boolean checkLike(ConnectDB db, LikePost likePost) {
        return false;
    }
}
