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
        request.getAttribute("fName");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("fName");
        request.setAttribute("fName", firstName);
        String lastName = request.getParameter("lName");
        request.setAttribute("lName", lastName);
        String email = request.getParameter("email");
        //sets the email attribute to the session so the user can be easily accessed via their email throughout the website if needed
        request.getSession().setAttribute("email", email);
        String password = request.getParameter("password");
        String confirmedPassword = request.getParameter("confirmPassword");
        boolean samePassword = confirmedPassword.equals(password);
        request.getSession().setAttribute("samePassword", samePassword);
        if (samePassword && DaoFactory.getUsersDao().findByEmail(email) == null) { //if the user input their password correctly both times AND the email is not already in use, a new user is made and saved to the db and the user is then redirected
            System.out.println("made it");
            User newUser = new User(firstName, lastName, email, Password.hash(password));
            DaoFactory.getUsersDao().insert(newUser);
            response.sendRedirect("pizzaOrder");
        } else if (!samePassword) { //else if the passwords did not match, sends the msg that the passwords did not match to the user
            String msg = "Passwords did not match";
            request.getSession().setAttribute("incPassword", msg);
            response.sendRedirect("register");
        } else if (DaoFactory.getUsersDao().findByEmail(email) != null) { //else if the email is already in use, reloads the page with a msg saying the email is already in use
            boolean emailUsage = DaoFactory.getUsersDao().findByEmail(email) == null;
            request.getSession().setAttribute("emailUsage", emailUsage);
            String msg = "Email is already in use";
            request.getSession().setAttribute("takenEmail", msg);
            response.sendRedirect("register");
        }
    }
}
