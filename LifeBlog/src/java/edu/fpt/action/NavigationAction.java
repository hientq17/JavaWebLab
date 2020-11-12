package edu.fpt.action;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.dao.AboutDAO;
import edu.fpt.dao.PostDAO;
import edu.fpt.dao.TypeDAO;
import edu.fpt.entity.About;
import edu.fpt.entity.Post;
import edu.fpt.entity.Type;
import org.apache.struts2.ServletActionContext;

import java.util.List;

public class NavigationAction extends ActionSupport {

    public String home() throws Exception {
        List<Post> listFamousPosts = new PostDAO().getFamousPosts();
        ServletActionContext.getRequest().setAttribute("listFamousPosts",listFamousPosts);
        return "success";
    }

    public String overview() throws Exception {
        List<Type> listTypes = new TypeDAO().getAll();
        ServletActionContext.getRequest().setAttribute("listTypes",listTypes);
        return "success";
    }

    public String about() throws Exception {
        About about = new AboutDAO().get().get();
        ServletActionContext.getRequest().setAttribute("about",about);
        return "success";
    }

    public String post() throws Exception {
        int pId = Integer.parseInt(ServletActionContext.getRequest().getParameter("pId"));
        Post post = new PostDAO().get(pId).get();
        new PostDAO().updateView(post);
        ServletActionContext.getRequest().setAttribute("post",post);
        return "success";
    }

}