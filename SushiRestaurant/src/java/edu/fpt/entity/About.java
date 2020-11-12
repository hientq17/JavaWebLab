package edu.fpt.entity;

public class About {
    String aAddress, aPhone, aEmail, aOpening;
    int aView;

    public About(String aAddress, String aPhone, String aEmail, String aOpening, int aView) {
        this.aAddress = aAddress;
        this.aPhone = aPhone;
        this.aEmail = aEmail;
        this.aOpening = aOpening;
        this.aView = aView;
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

    
}
