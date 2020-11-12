package edu.fpt.entity;

import java.util.List;

public class Combo {
    int cbId;
    String cbName;
    double cbPrice;
    String cbImage;
    List<Combo_Coffee> listCoffee;

    public Combo(int cbId, String cbName, double cbPrice, String cbImage, List<Combo_Coffee> listCoffee) {
        this.cbId = cbId;
        this.cbName = cbName;
        this.cbPrice = cbPrice;
        this.cbImage = cbImage;
        this.listCoffee = listCoffee;
    }

    public int getCbId() {
        return cbId;
    }

    public void setCbId(int cbId) {
        this.cbId = cbId;
    }

    public String getCbName() {
        return cbName;
    }

    public void setCbName(String cbName) {
        this.cbName = cbName;
    }

    public double getCbPrice() {
        return cbPrice;
    }

    public void setCbPrice(double cbPrice) {
        this.cbPrice = cbPrice;
    }

    public String getCbImage() {
        return cbImage;
    }

    public void setCbImage(String cbImage) {
        this.cbImage = cbImage;
    }

    public List<Combo_Coffee> getListCoffee() {
        return listCoffee;
    }

    public void setListCoffee(List<Combo_Coffee> listCoffee) {
        this.listCoffee = listCoffee;
    }
}
