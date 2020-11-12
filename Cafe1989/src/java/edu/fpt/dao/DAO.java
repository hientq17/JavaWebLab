/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.dao;

import java.util.List;
import java.util.Optional;

/**
 *
 * @author MrEnd
 */
public interface DAO<T> {
    List<T> getAll();
    Optional<T> get(int id);
    Optional<T> get(String s);
    Optional<T> getAbout();
    String[] getViews();
    void save(T t);
    void update(T t);
    void delete(T t);
}
