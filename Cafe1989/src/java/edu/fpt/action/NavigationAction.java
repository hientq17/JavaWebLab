package edu.fpt.action;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.dao.AboutDAO;
import edu.fpt.dao.CoffeeDAO;
import edu.fpt.dao.ComboDAO;
import edu.fpt.dao.DAO;
import edu.fpt.entity.About;
import edu.fpt.entity.Coffee;
import edu.fpt.entity.Combo;
import java.util.ArrayList;
import java.util.List;

public class NavigationAction extends ActionSupport {


    public List<Coffee> coffeeList;

    public About about;

    public List<Combo> comboList;

    public String[] views;

    DAO<Coffee> coffeeDAO = new CoffeeDAO();

    DAO<About> aboutDAO = new AboutDAO();

    DAO<Combo> comboDAO = new ComboDAO();

    public String home() throws Exception {
        //get all list of coffees
        List<Coffee> tmpList = coffeeDAO.getAll();
        int size = tmpList.size();
        //get two latest coffee
        coffeeList = new ArrayList<>();
        coffeeList.add(tmpList.get(size-1));
        coffeeList.add(tmpList.get(size-2));
        about = aboutDAO.getAbout().get();
        views = aboutDAO.getViews();
        return "success";
    }
    public String about() throws Exception {
        about = aboutDAO.getAbout().get();
        views = aboutDAO.getViews();
        comboList = comboDAO.getAll();
        return "success";
    }
    public String find() throws Exception {
        about = new AboutDAO().getAbout().get();
        views = aboutDAO.getViews();
        return "success";
    }
    public String overview() throws Exception {
        coffeeList = coffeeDAO.getAll();
        views = aboutDAO.getViews();
        return "success";
    }

    public List<Coffee> getCoffeeList() {
        return coffeeList;
    }

    public void setCoffeeList(List<Coffee> coffeeList) {
        this.coffeeList = coffeeList;
    }

    public List<Combo> getComboList() {
        return comboList;
    }

    public void setComboList(List<Combo> comboList) {
        this.comboList = comboList;
    }

    public About getAbout() {
        return about;
    }

    public void setAbout(About about) {
        this.about = about;
    }

    public String[] getViews() {return views; }

    public void setViews(String[] views) {this.views = views; }


}