package edu.fpt.entity;

import java.sql.Date;

public class Post {
    private String pType, pTitle, pIntroduction, pContent, pImage;
    private Date pDate;
    private int pId, pView;

    public Post(int pId, String pType, String pTitle, String pIntroduction, String pContent, Date pDate, int pView, String pImage) {
        this.pId = pId;
        this.pType = pType;
        this.pTitle = pTitle;
        this.pIntroduction = pIntroduction;
        this.pContent = pContent;
        this.pImage = pImage;
        this.pDate = pDate;
        this.pView = pView;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpType() {
        return pType;
    }

    public void setpType(String pType) {
        this.pType = pType;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
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

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
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
}
