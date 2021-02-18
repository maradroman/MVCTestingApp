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

        //        PrintWriter printWriter = resp.getWriter();
//
//        Map map = req.getParameterMap();
//        Set set = map.entrySet();
//        Iterator iterator = set.iterator();
//
//        Map<String, ArrayList<String>> result = new HashMap<>();
//
//        while (iterator.hasNext()){
//
//            iterator.next().
//            Map.Entry<String, String[]> entry = (Map.Entry<String, String[]>)iterator.next();
//
//            String key = entry.getKey();
//            String[] answers = key.split(",");
////            System.out.println(Arrays.toString(answers));
//            if (result.get(answers[0]) == null){
//                result.put(answers[0], new ArrayList<>());
//                try {
//                    result.get(answers[0]).add(answers[1]);
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//            System.out.println("end of iteration");
//        }
//        System.out.println(Arrays.asList(result));


////        testEnd = System.currentTimeMillis();
////        testTime = (testEnd - testStart) / 1000;
////        System.out.println("test time is: " + testTime);
////        Map<String, String> post = new HashMap<>();
//
//        List<String> names = new ArrayList<String>(req.getParameterMap().keySet());
////        System.out.println(names);
////        String time = req.getParameter("time");
//        ArrayList<String> nameList = new ArrayList<>();
//        for (int i = 0; i < names.size(); i++) {
//
//        }
//
//
//
////        for (int i = 0; i < names.size(); i++) {
////            post.put(names.get(i), req.getParameter(names.get(i)));
////        }
////
////        for (Map.Entry<String, String> entry : post.entrySet()) {
////            answer.setAnswer(entry.getKey());
////            System.out.println(entry.getKey() + ":" + entry.getValue());
////
////        }
////
////        for (int i = 0; i < post.size(); i++) {
////            System.out.println(i);
////
////        }
//////
////    }





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
