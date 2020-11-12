package edu.fpt.entity;

import java.sql.Date;

public class Post {
    private int pId;
    private String pName, pIntroduction, pContent;
    private Date pDate;
    private int pView, pLike;
    private String pImage;

    public Post(String pName, String pIntroduction, String pContent, Date pDate, int pView, int pLike, String pImage) {
        this.pName = pName;
        this.pIntroduction = pIntroduction;
        this.pContent = pContent;
        this.pDate = pDate;
        this.pView = pView;
        this.pLike = pLike;
        this.pImage = pImage;
    }

    public Post(int pId, String pName, String pIntroduction, String pContent, Date pDate, int pView, int pLike, String pImage) {
        this.pId = pId;
        this.pName = pName;
        this.pIntroduction = pIntroduction;
        this.pContent = pContent;
        this.pDate = pDate;
        this.pView = pView;
        this.pLike = pLike;
        this.pImage = pImage;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpIntroduction() {
        return pIntroduction;
    }

    public void setpIntroduction(String pIntroduction) {
        this.pIntroduction = pIntroduction;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public Date getpDate() {
        return pDate;
    }

    public void setpDate(Date pDate) {
        this.pDate = pDate;
    }

    public int getpView() {
        return pView;
    }

    public void setpView(int pView) {
        this.pView = pView;
    }

    public int getpLike() {
        return pLike;
    }

    public void setpLike(int pLike) {
        this.pLike = pLike;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }
}
