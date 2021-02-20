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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/users")
public class UserController extends HttpServlet {
    UserDAO userDAO = null;

   public UserController(){
       userDAO = new UserDAOImpl();
   }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        String type = (String) session.getAttribute("type");
        if (type != null){

        if (type.equals("admin")){
            if (action == null) {
                listUsers(req, resp);
            } else {
                if (action.equals("LIST")) {
                    listUsers(req, resp);
                }
                if (action.equals("EDIT")){
                    getSingleUser(req, resp);
                }


        }

        }
        if (type.equals("student")){
            String id = session.getAttribute("userID").toString();
            User user = userDAO.getByID(Integer.parseInt(id));
            req.setAttribute("user", user);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/userPages/user-info.jsp");
            requestDispatcher.forward(req, resp);

        }
        }
        if (action.equals("SIGNUP")){
            signUpUser(req, resp);
        }
    }
    public void listUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> list = userDAO.get();
        req.setAttribute("list", list);
        req.setAttribute("message", req.getSession().getAttribute("message"));

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/user-list.jsp");
        requestDispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String id = req.getParameter("id");

        User user = new User();
        if (!id.isEmpty()){
            user.setId(Integer.parseInt(id));
        }
        user.setUsername(username);
        user.setName(name);
        user.setSurname(surname);
        user.setEmail(email);
        user.setPassword(password);

        if (!id.isEmpty()){
            //save
            if (userDAO.update(user)){
                req.setAttribute("message", "User saved successfully!");
                req.setAttribute("page", "user");
            }

        }else {
            //update
            if (userDAO.save(user)){
                req.setAttribute("message", "User updated successfully!");
                req.setAttribute("page", "user");
            }
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/");
        requestDispatcher.forward(req, resp);
    }


    public void getSingleUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String id = req.getParameter("id");
       User user = userDAO.getByID(Integer.parseInt(id));
       req.setAttribute("user", user);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user-add.jsp");
        requestDispatcher.forward(req, resp);


    }

    public void signUpUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/publicPages/user-add.jsp");
        requestDispatcher.forward(req, resp);
    }
}
