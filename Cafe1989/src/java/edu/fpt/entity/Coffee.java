package edu.fpt.entity;

public class Coffee {
    int cId;
    String cName, cDescription;
    double cPrice;
    String cImage;

    public Coffee(int cId, String cName, String cDescription, double cPrice, String cImage) {
        this.cId = cId;
        this.cName = cName;
        this.cDescription = cDescription;
        this.cPrice = cPrice;
        this.cImage = cImage;
    }

    public Coffee(String cName, String cDescription, double cPrice, String cImage) {
        this.cName = cName;
        this.cDescription = cDescription;
        this.cPrice = cPrice;
        this.cImage = cImage;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcDescription() {
        return cDescription;
    }

    public void setcDescription(String cDescription) {
        this.cDescription = cDescription;
    }

    public double getcPrice() {
        return cPrice;
    }

    public void setcPrice(double cPrice) {
        this.cPrice = cPrice;
    }

    public String getcImage() {
        return cImage;
    }

    public void setcImage(String cImage) {
        this.cImage = cImage;
    }
}
