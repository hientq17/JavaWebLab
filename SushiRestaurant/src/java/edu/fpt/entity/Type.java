package edu.fpt.entity;

public class Type {
    private int tId;
    private String tName;
    private String tDescription;

    public Type(int tId, String tName, String tDescription) {
        this.tId = tId;
        this.tName = tName;
        this.tDescription = tDescription;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public String gettDescription() {
        return tDescription;
    }

    public void settDescription(String tDescription) {
        this.tDescription = tDescription;
    }

    
    
}
