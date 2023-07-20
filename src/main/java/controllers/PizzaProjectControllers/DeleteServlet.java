package controllers.PizzaProjectControllers;

import dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteServlet", value = "/delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long userId = DaoFactory.getUsersDao().findByEmail((String) request.getSession().getAttribute("email")).getId();
        DaoFactory.getUsersDao().delete(userId);
        request.getSession().removeAttribute("email");
        response.sendRedirect("pizzaOrder");
    }
}
