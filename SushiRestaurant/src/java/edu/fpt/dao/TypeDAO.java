/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.dao;
import edu.fpt.context.ConnectDB;
import edu.fpt.entity.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
/**
 *
 * @author MrEnd
 */
public class TypeDAO implements DAO<Type> {

    static List<Type> listTypes;
    
    @Override
    public List<Type> getAll() {
        if(listTypes!=null) return listTypes;
        List<Type> list = new ArrayList<>();
        try {
            //Connect database
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            String sql = "Select * from Type";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                list.add(new Type(
                        rs.getInt("tId"),
                        rs.getNString("tName"),
                        rs.getNString("tDescription")
                ));
            }          
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        listTypes = list;
        return listTypes;
    }

    @Override
    public Optional<Type> get(int id) {
        if(listTypes==null){
            listTypes = getAll();
        }
        for (Type type : listTypes) {
            if(type.gettId()==id){
                return Optional.of(type);
            }
        }
        return Optional.empty();
    }
    
}
