package edu.fpt.action;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.dao.AdminDAO;
import edu.fpt.dao.CoffeeDAO;
import edu.fpt.dao.DAO;
import edu.fpt.entity.Admin;
import edu.fpt.entity.Coffee;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Optional;

public class AdminAction extends ActionSupport {

    private String account;

    private InputStream inputStream;

    DAO<Admin> adminDAO = new AdminDAO();

    DAO<Coffee> coffeeDAO = new CoffeeDAO();

    public String newCoffee(){
        HttpServletRequest request = (HttpServletRequest) ServletActionContext.getRequest();
        String cName = request.getParameter("cName");
        String cDescription = request.getParameter("cDescription");
        double cPrice = Double.parseDouble(request.getParameter("cPrice"));
        String cImage = request.getParameter("cImage");
        coffeeDAO.save(new Coffee(cName,cDescription,cPrice,cImage));
        return "success";
    }

    public String login() throws Exception {
        String acc[] = account.split("##");
        Optional<Admin> opAdmin = adminDAO.get(acc[0]);
        Admin admin = null;
        if(opAdmin.isPresent()){
            admin = adminDAO.get(acc[0]).get();
        }
        if(admin==null) {
            inputStream = new ByteArrayInputStream("wrong-account".getBytes(StandardCharsets.UTF_8));
            return "success";
        } else if(!acc[1].equals(admin.getPassword())){
            inputStream = new ByteArrayInputStream("wrong-password".getBytes(StandardCharsets.UTF_8));
            return "success";
        }
        HttpServletRequest request =  ServletActionContext.getRequest();
        request.getSession().setAttribute("admin",admin.getUsername());
        inputStream = new ByteArrayInputStream("success".getBytes(StandardCharsets.UTF_8));
        return "success";
    }

    public String logout() throws Exception {
        HttpServletRequest request =  ServletActionContext.getRequest();
        request.getSession().invalidate();
        return "success";
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
