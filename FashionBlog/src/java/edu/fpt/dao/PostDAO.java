package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.About;
import edu.fpt.entity.Account;
import edu.fpt.entity.LikePost;
import edu.fpt.entity.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

public class PostDAO implements DAO<Post>{

    static List<Post> listPosts;
    static List<String> listMonths;

    @Override
    public List<Post> getAll(ConnectDB db) {
        if(listPosts!=null) return listPosts;
        List<Post> list = new ArrayList<>();
        try{
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            String sql = "Select * from Post order by pDate DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            listMonths = new ArrayList<>();
            while(rs.next()){
                Date date = rs.getDate("pDate");
                list.add(new Post(
                        rs.getInt("pId"),
                        rs.getNString("pName"),
                        rs.getNString("pIntroduction"),
                        rs.getNString("pContent"),
                        date,
                        rs.getInt("pView"),
                        rs.getInt("pLike"),
                        rs.getNString("pImage")
                ));
                String month = date.toString().split("-")[0]+"-"+
                        date.toString().split("-")[1];
                if(!isMonthExisted(month)){
                    listMonths.add(month);
                }
            }
            listPosts = list;
            rs.close();
            stmt.close();
        } catch(Exception ex){
            System.out.println(ex);
        }
        return listPosts;
    }

    private boolean isMonthExisted(String month){
        for(int i=0; i<listMonths.size(); i++){
            if(listMonths.get(i).toString().contains(month)){
                return true;
            }
        }
        return false;
    }

    @Override
    public Optional<Post> get(ConnectDB db, int id) {
        if(listPosts==null) {
            listPosts = getAll(db);
        }
        for (Post post : listPosts){
            if(post.getpId()==id){
                return Optional.of(post);
            }
        }
        return Optional.empty();
    }


    @Override
    public List<Post> getFamousPosts(ConnectDB db){
        if(listPosts==null) {
            listPosts = getAll(db);
        }
        List<Post> sortedList = listPosts;
        sortedList.sort(new Comparator<Post>() {
            @Override
            public int compare(Post p1, Post p2) {
                return p2.getpView()-p1.getpView();
            }
        });
        List<Post> list = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            list.add(sortedList.get(i));
        }
        return list;
    }

    @Override
    public Post updatePostView(ConnectDB db, Post post){
        try{
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            String sql = "Update Post set pView = " + (post.getpView()+1) + " where pId = "+post.getpId();
            Statement stmt = con.createStatement();
            stmt.executeUpdate(sql);
            post.setpView(post.getpView()+1);
            listPosts = null;
            stmt.close();
        } catch(Exception ex){
            System.out.println(ex);
        }
        return post;
    }

    @Override
    public List<String> getListMonths(ConnectDB db){
        if(listMonths==null) {
            getAll(db);
        }
        return listMonths;
    }

    @Override
    public List<Post> getListPostsByMonth(ConnectDB db, String month) {
        if(listPosts==null) {
            listPosts = getAll(db);
        }
        List<Post> list = new ArrayList<>();
        for (Post post : listPosts){
            if(post.getpDate().toString().contains(
                    month)){
                list.add(post);
            }
        }
        return list;
    }

    @Override
    public void save(ConnectDB db, Post post) {
        try{
            Connection con = db.getConnection();
            if(con==null) {
                con = db.openConnection();
            }
            String sql = "Insert into Post values (?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setNString(1,post.getpName());
            pstmt.setNString(2,post.getpIntroduction());
            pstmt.setNString(3,post.getpContent());
            pstmt.setDate(4,post.getpDate());
            pstmt.setInt(5,post.getpView());
            pstmt.setInt(6,post.getpLike());
            pstmt.setNString(7,post.getpImage());
            if(pstmt.executeUpdate()>0){
                listPosts = null;
                listMonths = null;
            }
            pstmt.close();
        } catch (Exception ex){
            System.out.println(ex);
        }
    }

    @Override
    public void update(ConnectDB db, Post post) {

    }

    @Override
    public void delete(ConnectDB db, Post post) {

    }

    @Override
    public About getAbout(ConnectDB db) {
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

    @Override
    public boolean checkLike(ConnectDB db, LikePost likePost) {
        return false;
    }
}
