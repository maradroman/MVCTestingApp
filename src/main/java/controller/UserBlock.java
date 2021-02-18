package controller;

import dao.UserDAO;
import dao.UserDAOImpl;
import entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/users/block")
public class UserBlock extends HttpServlet {
    UserDAO userDAO = null;

    public UserBlock(){
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("block servlet");
        String userName = req.getParameter("userName");
        User user = new User();
        user.setUsername(userName);
        if (userDAO.block(user)){
            req.setAttribute("message", "User blocked successfully");
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/");
        requestDispatcher.forward(req, resp);
    }
}
