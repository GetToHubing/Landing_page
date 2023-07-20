package controllers.PizzaProjectControllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

@WebServlet(name = "controllers.PizzaProjectControllers.PizzaOrderServlet", urlPatterns = "/pizzaOrder")
public class PizzaOrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.getRequestDispatcher("/pizza_order_form.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        Map<String, String[]> newPizza = request.getParameterMap();
//        for (Map.Entry<String, String[]> i : newPizza.entrySet()) {
//            System.out.println(i.getKey() + ": " + Arrays.toString(i.getValue()));
//        }
//        request.setAttribute("item", newPizza);
//        response.sendRedirect("checkout");
    }
}
