package edu.fpt.action;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.dao.AboutDAO;
import edu.fpt.dao.ContactDAO;
import edu.fpt.dao.PostDAO;
import edu.fpt.dao.TypeDAO;
import edu.fpt.entity.About;
import edu.fpt.entity.Contact;
import edu.fpt.entity.Post;
import edu.fpt.entity.Type;
import org.apache.struts2.ServletActionContext;

import java.util.List;

public class NavigationAction extends ActionSupport {

    public String home() throws Exception {
        List<Post> listPosts = new PostDAO().getAll();
        ServletActionContext.getRequest().setAttribute("listPosts",listPosts);
        List<Type> listTypes = new TypeDAO().getAll();
        ServletActionContext.getRequest().setAttribute("listTypes",listTypes);
        List<Post> listFamousPosts = new PostDAO().getFamousPosts();
        ServletActionContext.getRequest().setAttribute("listFamous",listFamousPosts);
        About about = new AboutDAO().get().get();
        ServletActionContext.getRequest().setAttribute("about",about);
        return "success";
    }

    public String about() throws Exception {
        About about = new AboutDAO().get().get();
        ServletActionContext.getRequest().setAttribute("about",about);
        return "success";
    }

    public String contact() throws Exception {
        Contact contact = new ContactDAO().get().get();
        ServletActionContext.getRequest().setAttribute("contact",contact);
        return "success";
    }

}