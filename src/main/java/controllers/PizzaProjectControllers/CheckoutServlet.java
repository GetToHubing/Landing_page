package controllers.PizzaProjectControllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "CheckoutServlet", value = "/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> newPizza = request.getParameterMap(); //takes the parameters from the pizza order form and makes a map
        Map<String, Map<String, String[]>> newOrder; //a new map that holds all the pizzas a user makes
        int counter = 1;
        if (request.getSession().getAttribute("order") == null) { //make new hashmap if there's no order attribute and add the first pizza to hashmap
            newOrder = new HashMap<>();
            newOrder.put("item " + counter, newPizza);
        } else { //add pizzas to the order attribute if there's already one
            newOrder = (Map<String, Map<String, String[]>>) request.getSession().getAttribute("order");
            counter++;
            newOrder.put("item " + counter, newPizza);
//            System.out.println(newOrder.entrySet().size());
        }
        request.getSession().setAttribute("order", newOrder); //sets the new/updated hashmap to a session attribute named order
        //the above code is for users to add multiple items to one order
//        for (Map.Entry<String, Map<String, String[]>> i : newOrder.entrySet()) {
//            System.out.println(i.getKey());
//            for (Map.Entry<String, String[]> j : i.getValue().entrySet()) {
//                System.out.println(j.getKey() + ": " + Arrays.toString(j.getValue()));
//            }
//            System.out.println("--------------");
//        }
        request.getRequestDispatcher("WEB-INF/checkout.jsp").forward(request, response);

    }
}
