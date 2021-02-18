package controller;

import dao.QuestionDAO;
import dao.QuestionDAOImpl;
import dao.TestPassDAO;
import dao.TestPassDAOImpl;
import entity.Answer;
import entity.Question;
import entity.TestPass;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet("/pass")
public class TestPassController extends HttpServlet {
    QuestionDAO questionDAO = new QuestionDAOImpl();

    TestPassDAO testPassDAO = new TestPassDAOImpl();
    TestPass testPass;

    ArrayList<Answer> listAnswer = new ArrayList<>();
    Answer answer = new Answer();
    Long testStart = null;
    Long testEnd = null;
    Long testTime = null;
    Integer result = 0;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String questions[] = req.getParameterValues("questions");
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
            System.out.println(testPass);
            if (testPassDAO.checkAnswer(testPass)){
                result += 1;
            }
        }

        System.out.println(questions.length);
        int resultPercent = result/questions.length;
        PrintWriter printWriter = resp.getWriter();
        printWriter.println(resultPercent);
        printWriter.close();

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        testStart = System.currentTimeMillis();

        List<Question> list = questionDAO.get(Integer.parseInt(req.getParameter("testID")));
        req.setAttribute("list", list);



        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/pass-test.jsp");
        requestDispatcher.forward(req,resp);

    }
}
