package com.vti.backend.business;

import com.vti.backend.data.IUserRepository;
import com.vti.backend.data.UserRepositoryImpl;
import com.vti.entity.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService {
    private IUserRepository userRepository;

    public UserServiceImpl() throws SQLException, IOException, ClassNotFoundException {
        userRepository = new UserRepositoryImpl();
    }
    @Override
    public User login(String email, String password) throws Exception {
        return userRepository.login(email, password);
    }
    @Override
    public List<User> getListUsers(int id) throws SQLException, ClassNotFoundException {
        return userRepository.getListUsers(id);
    }
    @Override
    public boolean ProjectIdExits(int id) throws SQLException, ClassNotFoundException {
        return userRepository.ProjectIdExits(id);
    }
}
