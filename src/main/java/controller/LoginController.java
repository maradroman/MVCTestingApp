package controller;

import dao.LoginDAO;
import dao.LoginDAOImpl;
import entity.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    LoginDAO loginDAO = null;

    public LoginController(){loginDAO = new LoginDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/publicPages/login.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Login login = new Login();
        login.setUsername(req.getParameter("username"));
        login.setPassword(req.getParameter("password"));
        Login authResult = loginDAO.authenticate(login);
        if (authResult != null){
           session.setAttribute("username", authResult.getUsername());
           session.setAttribute("userID", authResult.getId());
           session.setAttribute("type", authResult.getType());
           session.setAttribute("password", authResult.getPassword());
           session.setAttribute("name", authResult.getName());
           session.setAttribute("surname", authResult.getSurname());
           session.setAttribute("email", authResult.getEmail());
           session.setAttribute("isBlocked", authResult.getIsBlocked());
           resp.sendRedirect(req.getContextPath() + "/users");
        }else {
           resp.sendRedirect("login?status=error");
        }
    }
    }

