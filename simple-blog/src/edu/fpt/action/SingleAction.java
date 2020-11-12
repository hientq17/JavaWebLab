package edu.fpt.action;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.dao.PostDAO;
import edu.fpt.entity.Post;

public class SingleAction extends ActionSupport {
    int pId;
    Post pos;

    public String single() throws Exception{
        pos = new PostDAO().get(pId).get();
        return "success";
    }

    public Post getPos() {
        return pos;
    }

    public void setPos(Post pos) {
        this.pos = pos;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }
}
