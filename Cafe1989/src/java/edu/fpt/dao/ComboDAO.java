package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Combo;
import edu.fpt.entity.Combo_Coffee;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ComboDAO implements DAO<Combo> {

    static List<Combo> listCombo;

    @Override
    public List<Combo> getAll() {
        if(listCombo!=null) return listCombo;
        List<Combo> list = new ArrayList<>();
        try {
            //Connect database
            ConnectDB db = new ConnectDB();
            Connection con = db.openConnection();
            String sql = "Select * from Combo";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int cbId = rs.getInt("cbId");
                sql = "Select Coffee.cName,Combo_Coffee.ccQuantity from Combo_Coffee inner join Coffee on Combo_Coffee.cId = Coffee.cId where cbId = "+cbId;
                stmt = con.createStatement();
                ResultSet rs1 = stmt.executeQuery(sql);
                List<Combo_Coffee> listCoffee = new ArrayList<>();
                while(rs1.next()) {
                    listCoffee.add(new Combo_Coffee(
                            rs1.getString("cName"),
                            rs1.getInt("ccQuantity"))
                    );
                }
                rs1.close();
                list.add(new Combo(
                        cbId,
                        rs.getString("cbName"),
                        rs.getDouble("cbPrice"),
                        rs.getString("cbImage"),
                        listCoffee
                ));
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        listCombo = list;
        return listCombo;
    }


    @Override
    public Optional<Combo> get(int id) {
        return Optional.empty();
    }

    @Override
    public Optional<Combo> get(String s) {
        return Optional.empty();
    }

    @Override
    public Optional<Combo> getAbout() {
        return Optional.empty();
    }

    @Override
    public String[] getViews() {
        return new String[0];
    }

    @Override
    public void save(Combo combo) {

    }

    @Override
    public void update(Combo combo) {

    }

    @Override
    public void delete(Combo combo) {

    }
}
