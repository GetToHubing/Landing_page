package controllers.PizzaProjectControllers;

import dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import util.Password;

import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        request.getSession().setAttribute("email", email);
        String password = request.getParameter("password");
        String confirmedPassword = request.getParameter("confirmPassword");
        boolean samePassword = confirmedPassword.equals(password);
        request.getSession().setAttribute("samePassword", samePassword);
        if (samePassword && DaoFactory.getUsersDao().findByEmail(email) == null) {
            System.out.println("made it");
            User newUser = new User(email, Password.hash(password));
            DaoFactory.getUsersDao().insert(newUser);
            response.sendRedirect("pizzaOrder");
        } else if (!samePassword) {
            String msg = "Passwords did not match";
            request.getSession().setAttribute("incPassword", msg);
            response.sendRedirect("register");
        } else if (DaoFactory.getUsersDao().findByEmail(email) != null) {
            boolean emailUsage = DaoFactory.getUsersDao().findByEmail(email) == null;
            request.getSession().setAttribute("emailUsage", emailUsage);
            String msg = "Email is already in use";
            request.getSession().setAttribute("takenEmail", msg);
            response.sendRedirect("register");
        }
    }
}
