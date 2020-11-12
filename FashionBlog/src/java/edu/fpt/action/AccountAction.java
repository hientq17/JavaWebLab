package edu.fpt.action;

import edu.fpt.context.ConnectDB;
import edu.fpt.dao.*;
import edu.fpt.entity.Account;
import edu.fpt.entity.Contact;
import edu.fpt.entity.LikePost;
import edu.fpt.entity.Post;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Date;

public class AccountAction {

    private InputStream inputStream;

    ConnectDB db = new ConnectDB();

    public String newPost(){
        HttpServletRequest request = ServletActionContext.getRequest();
        DAO<Post> postDAO = new PostDAO();
        String pTitle = request.getParameter("pTitle");
        String pIntroduction = request.getParameter("pIntroduction");
        String pContent = request.getParameter("pContent");
        String pImage = request.getParameter("pImage");
        Date pDate = new Date(new java.util.Date().getTime());
        postDAO.save(db,new Post(pTitle,pIntroduction,pContent,pDate,0,0,pImage));
        db.closeConnection();
        return "success";
    }

    public String sendFeedback(){
        HttpServletRequest request = ServletActionContext.getRequest();
        DAO<Contact> contactDAO = new ContactDAO();
        String content = request.getParameter("content");
        String contentArr[] = content.split("##");
        contactDAO.save(db, new Contact(contentArr[0],contentArr[1],contentArr[2]));
        db.closeConnection();
        return "success";
    }

    public String likePost(){
        HttpServletRequest request = ServletActionContext.getRequest();
        DAO<LikePost> likeDAO = new LikeDAO();
        String like = request.getParameter("likePost");
        System.out.println("Test: "+like);
        String likeArr[] = like.split("##");
        likeDAO.save(db, new LikePost(likeArr[0],Integer.parseInt(likeArr[1])));
        db.closeConnection();
        return "success";
    }

    public String unlikePost(){
        HttpServletRequest request = ServletActionContext.getRequest();
        DAO<LikePost> likeDAO = new LikeDAO();
        String like = request.getParameter("likePost");
        String likeArr[] = like.split("##");
        likeDAO.delete(db, new LikePost(likeArr[0],Integer.parseInt(likeArr[1])));
        db.closeConnection();
        return "success";
    }

    public String login() {
        HttpServletRequest request =  ServletActionContext.getRequest();
        DAO<Account> accountDAO = new AccountDAO();
        String account = request.getParameter("account");
        String accArr[] = account.split("##");
        Account acc = accountDAO.getAccount(db, accArr[0]);
        db.closeConnection();
        if(acc==null) {
            inputStream = new ByteArrayInputStream("wrong-account".getBytes(StandardCharsets.UTF_8));
            return "success";
        } else if(!accArr[1].equals(acc.getPassword())){
            inputStream = new ByteArrayInputStream("wrong-password".getBytes(StandardCharsets.UTF_8));
            return "success";
        }
        request.getSession().setAttribute("account",acc);
        inputStream = new ByteArrayInputStream("success".getBytes(StandardCharsets.UTF_8));
        return "success";
    }

    public String logout(){
        HttpServletRequest request =  ServletActionContext.getRequest();
        request.getSession().invalidate();
        return "success";
    }


    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
