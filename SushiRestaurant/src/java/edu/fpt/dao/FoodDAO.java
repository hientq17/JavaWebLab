package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class FoodDAO implements DAO<Food>{
    
    static List<Food> listFoods;

    @Override
    public List<Food> getAll() {
        if(listFoods!=null) return listFoods;
        List<Food> list = new ArrayList<>();
        try {
            //Connect database
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            String sql = "Select * from Food";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new Food(
                        rs.getInt("fId"),
                        rs.getNString("fName"),
                        rs.getNString("fDescription"),
                        rs.getInt("fType"),
                        rs.getDouble("fPrice"),
                        rs.getNString("fImage")
                ));
            }          
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        listFoods = list;
        return listFoods;
    }

    @Override
    public Optional<Food> get(int id) {
        if(listFoods==null){
            listFoods = getAll();
        }
        for (Food food : listFoods) {
            if(food.getfId()==id){
                return Optional.of(food);
            }
        }
        return Optional.empty();
    }
    
    public List<Food> getByCategory(int id) {
        List<Food> listByCategory = new ArrayList<>();
        if(listFoods == null){
            listFoods = getAll();
        }
        for(Food food : listFoods) {
            if(food.getfType()==id){
                listByCategory.add(food);
            }
        }
        return listByCategory;
    }

}
