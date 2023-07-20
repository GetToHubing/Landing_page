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

@WebServlet(name = "ProfileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("fName", DaoFactory.getUsersDao().findByEmail((String) request.getSession().getAttribute("email")).getFirstName());
        request.setAttribute("lName", DaoFactory.getUsersDao().findByEmail((String) request.getSession().getAttribute("email")).getLastName());
        request.setAttribute("address", DaoFactory.getUsersDao().findByEmail((String) request.getSession().getAttribute("email")).getAddress());
        request.getRequestDispatcher("WEB-INF/user_profile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("fName");
        String lastName = request.getParameter("lName");
        String newEmail = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        if (request.getSession().getAttribute("email").equals(newEmail) || DaoFactory.getUsersDao().findByEmail(newEmail) == null) {
            if (password.equals("")) { //checks to see if the user updated their password
                User updatedUser = new User(DaoFactory.getUsersDao().findByEmail((String) request.getSession().getAttribute("email")).getId(), firstName, lastName, newEmail, DaoFactory.getUsersDao().findByEmail((String) request.getSession().getAttribute("email")).getPassword(), address);
                DaoFactory.getUsersDao().update(updatedUser);
                request.getSession().setAttribute("email", newEmail);
                response.sendRedirect("profile");
            } else {
                User updatedUser = new User(DaoFactory.getUsersDao().findByEmail((String) request.getSession().getAttribute("email")).getId(), firstName, lastName, newEmail, Password.hash(password), address);
                DaoFactory.getUsersDao().update(updatedUser);
                response.sendRedirect("profile");
            }
        } else {
            boolean emailUsage = DaoFactory.getUsersDao().findByEmail(newEmail) == null;
            request.getSession().setAttribute("emailUsage", emailUsage); //used for if statement in user_profile jsp
            String msg = "Email is already in use";
            request.getSession().setAttribute("takenEmail", msg);
            response.sendRedirect("profile");
        }
    }
}
