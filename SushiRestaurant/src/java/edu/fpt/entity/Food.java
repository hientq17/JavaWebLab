package edu.fpt.entity;

public class Food {
    private String fName, fDescription, fImage;
    private int fId, fType;
    private double fPrice;

    public Food() {
    }

    public Food(int fId, String fName, String fDescription, int fType, double fPrice, String fImage) {
        this.fName = fName;
        this.fDescription = fDescription;
        this.fImage = fImage;
        this.fId = fId;
        this.fType = fType;
        this.fPrice = fPrice;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getfDescription() {
        return fDescription;
    }

    public void setfDescription(String fDescription) {
        this.fDescription = fDescription;
    }

    public String getfImage() {
        return fImage;
    }

    public void setfImage(String fImage) {
        this.fImage = fImage;
    }

    public int getfId() {
        return fId;
    }

    public void setfId(int fId) {
        this.fId = fId;
    }

    public int getfType() {
        return fType;
    }

    public void setfType(int fType) {
        this.fType = fType;
    }

    public double getfPrice() {
        return fPrice;
    }

    public void setfPrice(double fPrice) {
        this.fPrice = fPrice;
    }
    
}
