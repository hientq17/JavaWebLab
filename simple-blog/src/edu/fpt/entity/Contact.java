package edu.fpt.entity;

public class Contact {
    String cAddress, cPhone, cEmail;

    public Contact(String cAddress, String cPhone, String cEmail) {
        this.cAddress = cAddress;
        this.cPhone = cPhone;
        this.cEmail = cEmail;
    }

    public String getcAddress() {
        return cAddress;
    }

    public void setcAddress(String cAddress) {
        this.cAddress = cAddress;
    }

    public String getcPhone() {
        return cPhone;
    }

    public void setcPhone(String cPhone) {
        this.cPhone = cPhone;
    }

    public String getcEmail() {
        return cEmail;
    }

    public void setcEmail(String cEmail) {
        this.cEmail = cEmail;
    }
}
