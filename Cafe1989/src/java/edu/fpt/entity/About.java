package edu.fpt.entity;

public class About {
    String aName, aAddress, aPhone, aEmail, aOpening, aDescription, aImage, aComboName, aComboImage, aComboDescription;
    int aView;

    public About(String aName, String aAddress, String aPhone, String aEmail, String aOpening,
                 int aView, String aDescription, String aImage, String aComboName, String aComboImage, String aComboDescription) {
        this.aName = aName;
        this.aAddress = aAddress;
        this.aPhone = aPhone;
        this.aEmail = aEmail;
        this.aOpening = aOpening;
        this.aView = aView;
        this.aDescription = aDescription;
        this.aImage = aImage;
        this.aComboName = aComboName;
        this.aComboImage = aComboImage;
        this.aComboDescription = aComboDescription;
    }

    public String getaAddress() {
        return aAddress;
    }

    public void setaAddress(String aAddress) {
        this.aAddress = aAddress;
    }

    public String getaPhone() {
        return aPhone;
    }

    public void setaPhone(String aPhone) {
        this.aPhone = aPhone;
    }

    public String getaEmail() {
        return aEmail;
    }

    public void setaEmail(String aEmail) {
        this.aEmail = aEmail;
    }

    public String getaOpening() {
        return aOpening;
    }

    public void setaOpening(String aOpening) {
        this.aOpening = aOpening;
    }

    public int getaView() {
        return aView;
    }

    public void setaView(int aView) {
        this.aView = aView;
    }

    public String getaDescription() {
        return aDescription;
    }

    public void setaDescription(String aDescription) {
        this.aDescription = aDescription;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public String getaImage() {
        return aImage;
    }

    public void setaImage(String aImage) {
        this.aImage = aImage;
    }

    public String getaComboName() {
        return aComboName;
    }

    public void setaComboName(String aComboName) {
        this.aComboName = aComboName;
    }

    public String getaComboImage() {
        return aComboImage;
    }

    public void setaComboImage(String aComboImage) {
        this.aComboImage = aComboImage;
    }

    public String getaComboDescription() {
        return aComboDescription;
    }

    public void setaComboDescription(String aComboDescription) {
        this.aComboDescription = aComboDescription;
    }
}
