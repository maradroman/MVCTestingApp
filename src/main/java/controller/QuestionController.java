package controller;

import dao.QuestionDAO;
import dao.QuestionDAOImpl;
import entity.Question;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/questions")
public class QuestionController extends HttpServlet {
    QuestionDAO questionDAO = null;
    public QuestionController(){questionDAO = new QuestionDAOImpl();  }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/question-add.jsp");
        requestDispatcher.forward(req,resp);

    }





    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String option1IsCorrect ="false";
        String option2IsCorrect ="false";
        String option3IsCorrect ="false";
        String option4IsCorrect ="false";

        Integer testID = Integer.parseInt(req.getParameter("testID"));
        String text = req.getParameter("text");
        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String option3 = req.getParameter("option3");
        String option4 = req.getParameter("option4");

        if (req.getParameter("option1IsCorrect") == null){
            option1IsCorrect ="false";
        }else{
            if (req.getParameter("option1IsCorrect").equals("true")){
                option1IsCorrect = "true";
            }
        }

        if (req.getParameter("option2IsCorrect") == null){
            option2IsCorrect ="false";
        }else{
            if (req.getParameter("option2IsCorrect").equals("true")){
                option2IsCorrect = "true";
            }
        }

        if (req.getParameter("option3IsCorrect") == null){
            option3IsCorrect ="false";
        }else{
            if (req.getParameter("option3IsCorrect").equals("true")){
                option3IsCorrect = "true";
            }
        }

        if (req.getParameter("option4IsCorrect") == null){
            option4IsCorrect ="false";
        }else{
            if (req.getParameter("option4IsCorrect").equals("true")){
                option4IsCorrect = "true";
            }
        }

        Question question = new Question();
        question.setTestID(testID);
        question.setText(text);
        question.setOption1(option1);
        question.setOption2(option2);
        question.setOption3(option3);
        question.setOption4(option4);
        question.setOption1IsCorrect(option1IsCorrect);
        question.setOption2IsCorrect(option2IsCorrect);
        question.setOption3IsCorrect(option3IsCorrect);
        question.setOption4IsCorrect(option4IsCorrect);


//        question.setOption2IsCorrect(option2IsCorrect);
//        question.setOption3IsCorrect(option3IsCorrect);
//        question.setOption4IsCorrect(option4IsCorrect);

        if (questionDAO.save(question)){
            req.setAttribute("message", "Question saved successfully");
            req.setAttribute("page", "question");
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/");
        requestDispatcher.forward(req, resp);
    }
}
