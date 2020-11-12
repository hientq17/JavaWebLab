package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Contact;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Optional;

public class ContactDAO implements DAO<Contact>{
    static Contact contact = null;
    @Override
    public List<Contact> getAll() {
        return null;
    }

    @Override
    public Optional<Contact> get() {
        if(contact != null) return Optional.of(contact);
        Contact cont = null;
        try{
            //Connect database
            ConnectDB db = ConnectDB.getInstance();
            Connection con = db.openConnection();
            String sql = "Select * from Contact";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                cont = new Contact(
                        rs.getNString("cAddress"),
                        rs.getNString("cPhone"),
                        rs.getNString("cEmail")
                );
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(Exception ex){
            System.out.println(ex);
        }
        contact = cont;
        return Optional.of(contact);
    }

    @Override
    public Optional<Contact> get(int id) {
        return Optional.empty();
    }

    @Override
    public void save(Contact contact) {

    }

    @Override
    public void update(Contact contact) {

    }

    @Override
    public void delete(Contact contact) {

    }
}
