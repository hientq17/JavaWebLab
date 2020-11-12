package edu.fpt.action;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.dao.AboutDAO;
import edu.fpt.dao.DAO;
import edu.fpt.dao.LikeDAO;
import edu.fpt.dao.PostDAO;
import edu.fpt.entity.About;
import edu.fpt.entity.Account;
import edu.fpt.entity.LikePost;
import edu.fpt.entity.Post;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class NavigationAction extends ActionSupport {

    ConnectDB db = new ConnectDB();
    
    public String home(){
        HttpServletRequest request = ServletActionContext.getRequest();
        DAO<Post> postDAO = new PostDAO();
        DAO<About> aboutDAO = new AboutDAO();
        List<Post> listFamousPosts = postDAO.getFamousPosts(db);
        String[] views = aboutDAO.getViews(db);
        request.setAttribute("views",views);
        request.setAttribute("listFamousPosts",listFamousPosts);
        db.closeConnection();
        return "success";
    }

    public String overview(){
        HttpServletRequest request = ServletActionContext.getRequest();
        DAO<Post> postDAO = new PostDAO();
        DAO<About> aboutDAO = new AboutDAO();
        List<String> listMonths  = postDAO.getListMonths(db);
        request.setAttribute("listMonths",listMonths);
        request.setAttribute("connectDB",db);
        String[] views = aboutDAO.getViews(db);
        request.setAttribute("views",views);
        db.closeConnection();
        return "success";
    }

    public String about(){
        HttpServletRequest request = ServletActionContext.getRequest();
        DAO<About> aboutDAO = new AboutDAO();
        About about = aboutDAO.getAbout(db);
        String[] views = aboutDAO.getViews(db);
        request.setAttribute("views",views);
        request.setAttribute("about",about);
        db.closeConnection();
        return "success";
    }

    public String contact(){
        HttpServletRequest request = ServletActionContext.getRequest();
        DAO<About> aboutDAO = new AboutDAO();
        String[] views = aboutDAO.getViews(db);
        request.setAttribute("views",views);
        db.closeConnection();
        return "success";
    }

    public String singlePost(){
        HttpServletRequest request = ServletActionContext.getRequest();
        int pId = Integer.parseInt(request.getParameter("pId"));
        DAO<Post> postDAO = new PostDAO();
        DAO<About> aboutDAO = new AboutDAO();
        DAO<LikePost> likeDAO = new LikeDAO();
        Post singlePost = postDAO.get(db,pId).get();
        singlePost = postDAO.updatePostView(db,singlePost);
        request.setAttribute("singlePost",singlePost);
        String[] views = aboutDAO.getViews(db);
        request.setAttribute("views",views);
        //check post is liked?
        Account account = (Account)request.getSession().getAttribute("account");
        if(account!=null) {
            boolean isLiked = likeDAO.checkLike(db,new LikePost(account.getUsername(),pId));
            request.setAttribute("isLiked",isLiked);
        }
        db.closeConnection();
        return "success";
    }

    public String getListPostsByMonth(){
        HttpServletRequest request = ServletActionContext.getRequest();
        DAO<Post> postDAO = new PostDAO();
        String month = request.getParameter("month");
        List<Post> listPostsByMonth = postDAO.getListPostsByMonth(db,month);
        request.setAttribute("month",month);
        request.setAttribute("listPostsByMonth",listPostsByMonth);
        db.closeConnection();
        return "success";
    }


}