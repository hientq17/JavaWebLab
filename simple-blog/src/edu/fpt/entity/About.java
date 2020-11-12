package edu.fpt.entity;

public class About {
    String aName, aJob, aContent, aNewsletter, aParagraph, aImage;

    public About(String aName, String aJob, String aContent, String aNewsletter, String aParagraph, String aImage) {
        this.aName = aName;
        this.aJob = aJob;
        this.aContent = aContent;
        this.aNewsletter = aNewsletter;
        this.aParagraph = aParagraph;
        this.aImage = aImage;
    }


    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public String getaJob() {
        return aJob;
    }

    public void setaJob(String aJob) {
        this.aJob = aJob;
    }

    public String getaContent() {
        return aContent;
    }

    public void setaContent(String aContent) {
        this.aContent = aContent;
    }

    public String getaNewsletter() {
        return aNewsletter;
    }

    public void setaNewsletter(String aNewsletter) {
        this.aNewsletter = aNewsletter;
    }

    public String getaParagraph() {
        return aParagraph;
    }

    public void setaParagraph(String aParagraph) {
        this.aParagraph = aParagraph;
    }

    public String getaImage() {
        return aImage;
    }

    public void setaImage(String aImage) {
        this.aImage = aImage;
    }
}
