package com.vti.backend.data;

import com.vti.Ultis.JdbcUltils;
import com.vti.entity.Project;
import com.vti.entity.User;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {
    private JdbcUltils jdbcUltils;
    private Connection connection;
    public UserRepositoryImpl() throws SQLException, IOException, ClassNotFoundException {
        jdbcUltils = new JdbcUltils();
    }

    @Override
    public User login(String email, String password) throws Exception {

        try {

            connection = jdbcUltils.connect();


            String sql = "SELECT * FROM testingsystem.user " + "WHERE email = ? AND password = ? ";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);


            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int Id = resultSet.getInt("id");
                String fullName = resultSet.getString("FullName");

                User user = new User(Id, fullName, email, password);
                return user;
            } else {
                throw new Exception("Tai khoan hoac mat khau sai!");
            }

        } finally {
            connection.close();
        }

    }
    @Override
    public List<User> getListUsers(int id) throws SQLException, ClassNotFoundException {
        List<Project> projects = new ArrayList<Project>();
        try {
            // Step 2: get connect
            connection = jdbcUltils.connect();

            // Step 3: Create a statement object
            String sql = " SELECT pau.projectId, u.`fullName`, pau.`Role` " + " FROM `ProjectAndUser` pau " + " JOIN `User` u " + "ON u.id = pau.userId" + "WHERE pau.projectId = ?";
            PreparedStatement preStatement = connection.prepareStatement(sql);
            preStatement.setInt(1, id);
            ResultSet resultSet = preStatement.executeQuery();
            while (resultSet.next()) {
                int ids = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String role = resultSet.getString(3);
                Project a = new Project(ids, name, role);
                    projects.add(a);
                }


            return null;

        } finally {
            connection.close();
        }

    }
    @Override
    public boolean ProjectIdExits(int id) throws SQLException, ClassNotFoundException {
        try {

            // step 2: get connect
            connection = jdbcUltils.connect();

            // Step 3: Create a statement object

            String sql = "SELECT * FROM testingsystem.Project " + " WHERE id = ? ";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            // set parameter
            preparedStatement.setInt(1, id);

            // Step 4: Execute Query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Step 5: Handling result set

            if (resultSet.next()) {

                return true;
            }

            return false;
        } finally {
            connection.close();
        }

    }

}
