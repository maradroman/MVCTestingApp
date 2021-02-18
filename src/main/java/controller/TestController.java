package controller;

import dao.TestDAO;
import dao.TestDAOImpl;
import dao.UserDAO;
import entity.Test;
import entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet("/tests")
public class TestController extends HttpServlet {
TestDAO testDAO = null;

public TestController(){testDAO = new TestDAOImpl();}

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action !=null&&action.equals("add")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/test-add.jsp");
            requestDispatcher.forward(req,resp);
        }else {

            List<Test> list = testDAO.get();
            req.setAttribute("list", list);
            req.setAttribute("message", req.getSession().getAttribute("message"));

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/test-list.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String name = req.getParameter("name");
        Integer complexity = Integer.parseInt(req.getParameter("complexity"));
        Integer timeForTest = Integer.parseInt(req.getParameter("timeForTest"));
        Integer topic = Integer.parseInt(req.getParameter("topic"));

        Test test = new Test();
        test.setName(name);
        test.setComplexity(complexity);
        test.setTimeForTest(timeForTest);
        test.setTopic(topic);

        if (testDAO.save(test)){
            req.getSession().setAttribute("message", "test saved successfully");
            req.setAttribute("page", "test");
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/");
requestDispatcher.forward(req,resp);

    }
}
