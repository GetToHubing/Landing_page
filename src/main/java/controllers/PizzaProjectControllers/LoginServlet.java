package controllers.PizzaProjectControllers;

import dao.DaoFactory;
import models.User;
import util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        System.out.println(email);
        String password = request.getParameter("password");
        if (Password.check(password, DaoFactory.getUsersDao().findByEmail(email).getPassword())) {
            User user = new User(email);
            request.getSession().setAttribute("user", user);
            response.sendRedirect("pizzaOrder");

        } else {
            boolean bool = true;
            request.getSession().setAttribute("bool", bool);
            String msg = "Incorrect email or password";
            request.getSession().setAttribute("incorrect", msg);
            response.sendRedirect("login");
        }

    }
}
