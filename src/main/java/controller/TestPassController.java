package controller;

import dao.*;
import entity.PassedTest;
import entity.Question;
import entity.TestPass;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/pass")
public class TestPassController extends HttpServlet {
    QuestionDAO questionDAO = new QuestionDAOImpl();
    TestPassDAO testPassDAO = new TestPassDAOImpl();
    PassedTestDAO passedTestDAO = new PassedTestDAOImpl();
    TestPass testPass;
    PassedTest passedTest;
    Long testStart = null;
    Long testEnd = null;
    Long testTime = null;
    Integer result = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        result = 0;
        req.setCharacterEncoding("UTF-8");
        req.setAttribute("testID", req.getParameter("testID"));
        HttpSession session = req.getSession();
        testEnd = System.currentTimeMillis();
        testTime = (testEnd - testStart)/1000;



        String[] questions = req.getParameterValues("questions");
        for (String question: questions
             ) {
            testPass = new TestPass();
            testPass.setQuestionID(Integer.parseInt(question));

            if (req.getParameter(question + "1") == null){
                testPass.setOption1Chosen("false");
            }else{testPass.setOption1Chosen(req.getParameter(question + "1"));}

            if (req.getParameter(question + "2") == null){
                testPass.setOption2Chosen("false");
            }else{testPass.setOption2Chosen(req.getParameter(question + "2"));}

            if (req.getParameter(question + "3") == null){
                testPass.setOption3Chosen("false");
            }else{testPass.setOption3Chosen(req.getParameter(question + "3"));}

            if (req.getParameter(question + "4") == null){
                testPass.setOption4Chosen("false");
            }else{testPass.setOption4Chosen(req.getParameter(question + "4"));}

            if (testPassDAO.checkAnswer(testPass)){
                result += 1;
            }
        }
        String testID = req.getParameter("testID");

        int percentRound = roundResult(result, questions.length);
        passedTest = new PassedTest();
        passedTest.setUserID((Integer) session.getAttribute("userID"));
        passedTest.setTestID(Integer.parseInt(testID));
        passedTest.setResult(percentRound);
        passedTest.setTimeSpent(Math.toIntExact(testTime));

        if (passedTestDAO.save(passedTest)){
            req.setAttribute("message", "Result saved successfully");
        }

        try {
            resp.sendRedirect(req.getContextPath() + "/tests");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public int roundResult(Integer result, Integer qOfQuestions){
        double resultDouble = result;
        double qOfQuestionsDouble = qOfQuestions;
        double percent = (resultDouble/qOfQuestionsDouble)*100;
        return (int)Math.round(percent);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String type = session.getAttribute("type").toString();
        testStart = System.currentTimeMillis();
        List<Question> list = questionDAO.get(Integer.parseInt(req.getParameter("testID")));
        req.setAttribute("list", list);



        if (type.equals("student")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/userPages/pass-test.jsp");
            requestDispatcher.forward(req,resp);
        }
        if (type.equals("admin")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/pass-test.jsp");
            requestDispatcher.forward(req,resp);
        }
    }
}
