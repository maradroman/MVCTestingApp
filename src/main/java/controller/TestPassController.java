package controller;

import dao.QuestionDAO;
import dao.QuestionDAOImpl;
import entity.Answer;
import entity.Question;

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
    ArrayList<Answer> listAnswer = new ArrayList<>();
    Answer answer = new Answer();

    Long testStart = null;
    Long testEnd = null;
    Long testTime = null;



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String questions[] = req.getParameterValues("questions");
        for (String question: questions
             ) {
            System.out.println("Start of question " + question + " ___________");
            System.out.println("Question id is " + question + " and first answer is " + req.getParameter(question + "1"));
            System.out.println("Question id is " + question + " and second answer is " + req.getParameter(question + "2"));
            System.out.println("Question id is " + question + " and third answer is " + req.getParameter(question + "3"));
            System.out.println("Question id is " + question + " and fourth answer is " + req.getParameter(question + "4"));
            System.out.println("end of question " + question + " ___________");
            System.out.println("#####################################");

        }






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
