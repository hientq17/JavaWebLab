package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.About;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

public class AboutDAO implements DAO<About>{

    static About about = null;


    @Override
    public List<About> getAll() {
        return null;
    }

    @Override
    public Optional<About> get() {
        if(about != null) return Optional.of(about);
        About ab = null;
        try{
            //Connect database
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            String sql = "Select * from About";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                ab= new About(
                        rs.getNString("aName"),
                        rs.getNString("aJob"),
                        rs.getNString("aContent"),
                        rs.getNString("aNewsletter"),
                        rs.getNString("aParagraph"),
                        rs.getNString("aImage")
                );
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(Exception ex){
            System.out.println(ex);
        }
        about = ab;
        return Optional.of(about);
    }

    @Override
    public Optional<About> get(int id) {
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
}
