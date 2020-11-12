/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.About;
import edu.fpt.entity.Account;
import edu.fpt.entity.LikePost;
import edu.fpt.entity.Post;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

/**
 *
 * @author MrEnd
 */
public interface DAO<T> {
    List<T> getAll(ConnectDB db);
    Optional<T> get(ConnectDB db, int id);
    void save(ConnectDB db, T t);
    void update(ConnectDB db, T t);
    void delete(ConnectDB db, T t);
    About getAbout(ConnectDB db);
    List<Post> getFamousPosts(ConnectDB db);
    List<String> getListMonths(ConnectDB db);
    List<Post> getListPostsByMonth(ConnectDB db, String month);
    Post updatePostView(ConnectDB db, Post post);
    String[] getViews(ConnectDB db);
    Account getAccount(ConnectDB db, String username);
    boolean checkLike(ConnectDB db, LikePost likePost);
}
