package edu.fpt.entity;

public class Contact {
    String cEmail, cName, cDescription;

    public String getcEmail() {
        return cEmail;
    }

    public void setcEmail(String cEmail) {
        this.cEmail = cEmail;
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

    public Contact(String cName, String cEmail, String cDescription) {
        this.cEmail = cEmail;
        this.cName = cName;
        this.cDescription = cDescription;
    }
}
