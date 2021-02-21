package dao;

import controller.DBConnectionUtil;
import entity.Question;
import entity.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TestDAOImpl implements TestDAO {
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    PreparedStatement preparedStatement = null;


    public List<Test> get() {
        List <Test> list = null;
        Test test = null;

        list = new ArrayList<>();
        String sql = "SELECT * FROM tests";
        connection = DBConnectionUtil.openConnection();

        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while(resultSet.next()){
                QuestionDAO questionDAO = new QuestionDAOImpl();
                List<Question> questionsList = questionDAO.get(resultSet.getInt("id"));

                test = new Test();
                test.setId(resultSet.getInt("id"));
                test.setName(resultSet.getString("name"));
                test.setComplexity(resultSet.getInt("complexity"));
                test.setNumberOfRequests(resultSet.getInt("number_of_requests"));
                test.setTimeForTest(resultSet.getInt("time_for_test"));
                test.setTopic(resultSet.getInt("topic"));
                test.setQuestions(questionsList);
                list.add(test);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public Test get(int id) {
        Test test = null;

        try {
            test = new Test();
            QuestionDAO questionDAO = new QuestionDAOImpl();
            List<Question> list = questionDAO.get(id);
            String sql = "SELECT * FROM tests WHERE id=" + id;
            connection = DBConnectionUtil.openConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                test = new Test();
                test.setId(resultSet.getInt("id"));
                test.setName(resultSet.getString("name"));
                test.setComplexity(resultSet.getInt("complexity"));
                test.setNumberOfRequests(resultSet.getInt("number_of_requests"));
                test.setTimeForTest(resultSet.getInt("time_for_test"));
                test.setTopic(resultSet.getInt("topic"));
                test.setQuestions(list);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return test;
    }

    public boolean save(Test test) {
        boolean flag = false;

        try {
            String sql = "INSERT INTO tests(name, complexity, time_for_test, topic) VALUES('" + test.getName() + "','"+ test.getComplexity() + "','"+ test.getTimeForTest() + "','"+ test.getTopic() + "')";
            connection = DBConnectionUtil.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            flag = true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return flag;
    }

    @Override
    public boolean delete(Test test) {
        boolean flag = false;
        return flag;
    }
}
