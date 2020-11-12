package edu.fpt.entity;

public class Combo_Coffee {
    String ccName;
    int ccQuantity;

    public Combo_Coffee(String ccName, int ccQuantity) {
        this.ccName = ccName;
        this.ccQuantity = ccQuantity;
    }

    public String getCcName() {
        return ccName;
    }

    public void setCcName(String ccName) {
        this.ccName = ccName;
    }

    public int getCcQuantity() {
        return ccQuantity;
    }

    public void setCcQuantity(int ccQuantity) {
        this.ccQuantity = ccQuantity;
    }
}
