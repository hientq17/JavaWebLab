package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Type;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class TypeDAO implements DAO<Type>{

    static List<Type> listTypes;

    @Override
    public List<Type> getAll() {
        if(listTypes!=null) return listTypes;
        List<Type> list = new ArrayList<>();
        List<String> typeName = new ArrayList<>();
        try{
            //Connect database
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            String sql = "Select * from Post";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                typeName.add(rs.getNString("pType"));
            }
            for(int i=0; i<typeName.size(); i++){
                boolean isExisted = false;
                for(int j=0; j<list.size(); j++){
                    if(typeName.get(i).equals(list.get(j).gettName())){
                        list.set(j, new Type(
                                typeName.get(i),
                                list.get(j).gettQuantity()+1
                        ));
                        isExisted = true;
                        break;
                    }
                }
                if(!isExisted) {
                    list.add(new Type(typeName.get(i),1));
                }
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(Exception ex){
            System.out.println(ex);
        }
        listTypes = list;
        return listTypes;
    }

    @Override
    public Optional<Type> get(int id) {
        return Optional.empty();
    }

    @Override
    public Optional<Type> get() {
        return Optional.empty();
    }

    @Override
    public void save(Type type) {

    }

    @Override
    public void update(Type type) {

    }

    @Override
    public void delete(Type type) {

    }
}
