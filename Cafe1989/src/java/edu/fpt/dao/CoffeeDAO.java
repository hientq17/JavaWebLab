package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class CoffeeDAO implements DAO<Coffee>{

    static List<Coffee> listCoffee;

    @Override
    public List<Coffee> getAll() {
        if(listCoffee!=null) return listCoffee;
        List<Coffee> list = new ArrayList<>();
        try {
            //Connect database
            ConnectDB db = new ConnectDB();
            Connection con = db.openConnection();
            String sql = "Select * from Coffee";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new Coffee(
                        rs.getInt("cId"),
                        rs.getNString("cName"),
                        rs.getNString("cDescription"),
                        rs.getDouble("cPrice"),
                        rs.getString("cImage")
                ));
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        listCoffee = list;
        return listCoffee;
    }

    @Override
    public Optional<Coffee> get(int id) {
        if(listCoffee==null){
            listCoffee = getAll();
        }
        for (Coffee Coffee : listCoffee) {
            if(Coffee.getcId()==id){
                return Optional.of(Coffee);
            }
        }
        return Optional.empty();
    }

    @Override
    public Optional<Coffee> get(String s) {
        return Optional.empty();
    }

    @Override
    public Optional<Coffee> getAbout() {
        return Optional.empty();
    }

    @Override
    public String[] getViews() {
        return new String[0];
    }

    @Override
    public void save(Coffee coffee) {
        try {
            //Connect database
            ConnectDB db = new ConnectDB();
            Connection con = db.openConnection();
            String sql = "Insert into Coffee values(?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setNString(1, coffee.getcName());
            pstmt.setNString(2, coffee.getcDescription());
            pstmt.setDouble(3, coffee.getcPrice());
            pstmt.setNString(4, coffee.getcImage());
            if(pstmt.executeUpdate()>0){
                listCoffee = null;
            }
            pstmt.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    @Override
    public void update(Coffee coffee) {

    }

    @Override
    public void delete(Coffee coffee) {

    }

}
