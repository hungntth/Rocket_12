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
                throw new Exception("Tài khoản hoặc mật khẩu không đúng.");
            }

        } finally {
            connection.close();
        }

    }
public List<Project> getUserById(int id) throws SQLException, ClassNotFoundException {
    List<Project> projects = new ArrayList<>();
    try {

        // Step 2: get connect
        connection = jdbcUltils.connect();

        // Step 3: Create a statement object
        String sql = "SELECT * FROM `ProjectAndUser` pau JOIN `User` u ON u.id = pau.userId WHERE pau.projectId = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        // set parameter
        preparedStatement.setInt(1, id);

        // Step 4: Execute SQL query
        ResultSet resultSet = preparedStatement.executeQuery();

        // Step 5: Handling result set
        while (resultSet.next()) {
            int projectId = resultSet.getInt("projectId");
            String fullName = resultSet.getString("fullName");
            String role = resultSet.getString("Role");

            Project project = new Project(projectId, fullName, role);
            projects.add(project);


        }
        return projects;

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

    @Override
public List<Project> getListUsers() throws SQLException, ClassNotFoundException {
    List<Project> projects = new ArrayList<>();

    try {
        // get connect
        connection = jdbcUltils.connect();

        // Step 3: Create a statment object
        Statement statement = connection.createStatement();

        // Step 4: Execute query
        String ListManager = "SELECT * FROM `User` u JOIN ProjectAndUser pau ON u.id = pau.userId WHERE pau.Role = 'MANAGER'";
        ResultSet resultSet = statement.executeQuery(ListManager);

        // Step 5: Handling result set
        while (resultSet.next()) {
            int projectId = resultSet.getInt("projectId");
            String fullName = resultSet.getString("FullName");
            String role = resultSet.getString("role");
            String password = resultSet.getString("Password");

            Project project = new Project(projectId, fullName, role);
            projects.add(project);

        }
        return projects;
    } finally {
        // Step 6: Close connection
        connection.close();
    }

}

}
