package edu.fpt.action;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.dao.AboutDAO;
import edu.fpt.dao.DAO;
import edu.fpt.dao.FoodDAO;
import edu.fpt.dao.TypeDAO;
import edu.fpt.entity.*;
import org.apache.struts2.ServletActionContext;
import java.util.List;

public class NavigationAction extends ActionSupport {

    public String home() throws Exception {
        DAO<Food> dao = new FoodDAO();
        List<Food> listFoods = dao.getAll();
        ServletActionContext.getRequest().setAttribute("listFoods",listFoods);
        return "success";
    }

    public String menu() throws Exception {
        List<Food> listFoods = new FoodDAO().getAll();
        ServletActionContext.getRequest().setAttribute("listFoods",listFoods);
        List<Type> listTypes = new TypeDAO().getAll();
        ServletActionContext.getRequest().setAttribute("listTypes",listTypes);
        return "success";
    }

    public String about() throws Exception {
        About about = new AboutDAO().getAbout();
        ServletActionContext.getRequest().setAttribute("about",about);
        return "success";
    }

    public String food() throws Exception {
        int fId = Integer.parseInt(ServletActionContext.getRequest().getParameter("fId"));
        System.out.println("Testt: "+fId);
        Food food = new FoodDAO().get(fId).get();
        System.out.println("Testtt: "+food);
        ServletActionContext.getRequest().setAttribute("food",food);
        return "success";
    }

}