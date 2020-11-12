package edu.fpt.entity;

public class Type {
    String tName;
    int tQuantity;

    public Type(String tName, int tQuantity) {
        this.tName = tName;
        this.tQuantity = tQuantity;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public int gettQuantity() {
        return tQuantity;
    }

    public void settQuantity(int tQuantity) {
        this.tQuantity = tQuantity;
    }
}
