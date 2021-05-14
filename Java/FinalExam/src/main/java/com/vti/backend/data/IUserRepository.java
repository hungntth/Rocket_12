package com.vti.backend.data;

import com.vti.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {


    User login(String email, String password) throws Exception;

    List<User> getListUsers(int id) throws SQLException, ClassNotFoundException;

    boolean ProjectIdExits(int id) throws SQLException, ClassNotFoundException;
}
