/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.entity;

/**
 *
 * @author MrEnd
 */
public class LikePost {
    String username;
    int pId;

    public LikePost(String username, int pId) {
        this.username = username;
        this.pId = pId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }
    
}
