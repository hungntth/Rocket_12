package com.vti.backend.presentation;

import com.vti.backend.business.IUserService;
import com.vti.backend.business.UserServiceImpl;
import com.vti.entity.Project;
import com.vti.entity.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class UserController {
    private IUserService userService;

    public UserController() throws SQLException, IOException, ClassNotFoundException {
        userService = new UserServiceImpl();
    }
    public User login(String email, String password) throws Exception {
        return userService.login(email, password);
    }
    public List<Project> getUserById(int id) throws SQLException, ClassNotFoundException {
        return userService.getUserById(id);
    }
    public boolean ProjectIdExits(int id) throws SQLException, ClassNotFoundException {
        return userService.ProjectIdExits(id);
    }

    public List<Project> getListUsers() throws SQLException, ClassNotFoundException {

        return userService.getListUsers();
    }
}

