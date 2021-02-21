package controller;

import dao.*;
import entity.PassedTest;
import entity.Test;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet("/tests")
public class TestController extends HttpServlet {
TestDAO testDAO = null;
PassedTestDAO passedTestDAO = null;

public TestController(){
    testDAO = new TestDAOImpl();
    passedTestDAO = new PassedTestDAOImpl();
}

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String type = session.getAttribute("type").toString();

        if (type.equals("admin")){
        String action = req.getParameter("action");
        if (action !=null&&action.equals("add")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/test-add.jsp");
            try {
                requestDispatcher.forward(req,resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }else {
            List<PassedTest> passedTestList = passedTestDAO.get((Integer) session.getAttribute("userID"));
            List<Test> testsList = testDAO.get();
            req.setAttribute("list", testsList);
            req.setAttribute("listpassed", passedTestList);
            req.setAttribute("message", req.getSession().getAttribute("message"));

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/test-list.jsp");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
        }
        if (type.equals("student")){
            List<PassedTest> passedTestList = passedTestDAO.get((Integer) session.getAttribute("userID"));
            List<Test> testsList = testDAO.get();
            req.setAttribute("list", testsList);
            req.setAttribute("listpassed", passedTestList);
            req.setAttribute("message", req.getSession().getAttribute("message"));

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/userPages/test-list.jsp");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
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
        Integer complexity = null;
        try {
            complexity = Integer.parseInt(req.getParameter("complexity"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        Integer timeForTest = null;
        try {
            timeForTest = Integer.parseInt(req.getParameter("timeForTest"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        Integer topic = null;
        try {
            topic = Integer.parseInt(req.getParameter("topic"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        Test test = new Test();
        test.setName(name);
        test.setComplexity(complexity);
        test.setTimeForTest(timeForTest);
        test.setTopic(topic);

        if (testDAO.save(test)){
            req.getSession().setAttribute("message", "test saved successfully");
            req.setAttribute("page", "test");
        }

        try {
            resp.sendRedirect(req.getContextPath() + "/tests");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
