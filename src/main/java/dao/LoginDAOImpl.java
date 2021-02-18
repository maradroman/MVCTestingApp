package dao;

import controller.DBConnectionUtil;
import entity.Login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAOImpl implements LoginDAO {
    @Override
    public Login authenticate(Login login) {


        String sql = "SELECT * FROM users where username=? and password=?";

        try {
            Connection connection = DBConnectionUtil.openConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,login.getUsername());
            preparedStatement.setString(2,login.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                login = new Login();
                login.setId(resultSet.getInt("id"));
                login.setUsername(resultSet.getString("username"));
                System.out.println(login);
            }
        } catch (SQLException throwables) {
            login = null;
        }

        return login;
    }

}
