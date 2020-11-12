package edu.fpt.entity;

public class About {
    String aName;
    int aAge;
    String aDescription;
    int aView;
    String aImage;

    public About(String aName, int aAge, String aDescription, int aView, String aImage) {
        this.aName = aName;
        this.aAge = aAge;
        this.aDescription = aDescription;
        this.aView = aView;
        this.aImage = aImage;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public int getaAge() {
        return aAge;
    }

    public void setaAge(int aAge) {
        this.aAge = aAge;
    }

    public String getaDescription() {
        return aDescription;
    }

    public void setaDescription(String aDescription) {
        this.aDescription = aDescription;
    }

    public int getaView() {
        return aView;
    }

    public void setaView(int aView) {
        this.aView = aView;
    }

    public String getaImage() {
        return aImage;
    }

    public void setaImage(String aImage) {
        this.aImage = aImage;
    }
}
