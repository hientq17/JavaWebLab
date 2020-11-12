package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Post;
import edu.fpt.entity.Type;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

public class PostDAO implements DAO<Post>{

    static List<Post> listPosts;


    @Override
    public List<Post> getAll() {
        if(listPosts!=null) return listPosts;
        List<Post> list = new ArrayList<>();
        try{
            //Connect database
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            String sql = "Select * from Post order by pDate DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                list.add(new Post(
                        rs.getInt("pId"),
                        rs.getNString("pType"),
                        rs.getNString("pTitle"),
                        rs.getNString("pIntroduction"),
                        rs.getNString("pContent"),
                        rs.getDate("pDate"),
                        rs.getInt("pView"),
                        rs.getNString("pImage")
                ));
            }
            listPosts = list;
            rs.close();
            stmt.close();
            con.close();
        } catch(Exception ex){
            System.out.println(ex);
        }
        return listPosts;
    }

    @Override
    public Optional<Post> get(int id) {
        if(listPosts==null) {
            listPosts = getAll();
        }
        for (Post post : listPosts){
            if(post.getpId()==id){
                return Optional.of(post);
            }
        }
        return Optional.empty();
    }

    @Override
    public Optional<Post> get() {
        return Optional.empty();
    }

    public List<Post> getFamousPosts(){
        if(listPosts==null) {
            listPosts = getAll();
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
    public void save(Post post) {

    }

    @Override
    public void update(Post post) {

    }

    @Override
    public void delete(Post post) {

    }
}
