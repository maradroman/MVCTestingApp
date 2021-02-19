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

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/login.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Login login = new Login();
        login.setUsername(req.getParameter("username"));
        login.setPassword(req.getParameter("password"));

       Login authResult = loginDAO.authenticate(login);
       if (authResult != null){
           session.setAttribute("username", authResult.getUsername());
           session.setAttribute("userID", authResult.getId());
           session.setAttribute("type", authResult.getType());
           resp.sendRedirect(req.getContextPath());

       }else {
           resp.sendRedirect("login?status=error");
       }
    }


//        PrintWriter printWriter = resp.getWriter();
//        printWriter.println("username: "+ username);
//        printWriter.println("password: "+ password);
//        printWriter.close();

    }

