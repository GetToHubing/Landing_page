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
import java.util.Objects;

@WebServlet(name = "CheckoutServlet", value = "/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> newPizza = request.getParameterMap(); //takes the parameters from the pizza order form and makes a map
        int cost = 0;
        if(newPizza.get("Size and Crust")[0].contains("10")) {
            cost = cost + 10;
        } else if(newPizza.get("Size and Crust")[0].contains("12")) {
            cost = cost + 12;
        } else if(newPizza.get("Size and Crust")[0].contains("14")) {
            cost = cost + 14;
        }
        if(newPizza.get("topping") != null && newPizza.get("topping").length > 2) {
            cost = cost + (newPizza.get("topping").length - 2);
        }
        //if the cost attribute isn't set, then set it, otherwise add to it and set it
        if(request.getSession().getAttribute("cost") == null) {
            request.getSession().setAttribute("cost", cost);
        } else {
            request.getSession().setAttribute("cost", (int) request.getSession().getAttribute("cost") + cost);
        }
        System.out.println(request.getSession().getAttribute("cost"));
        Map<String, Map<String, String[]>> newOrder; //a new map that holds all the pizzas a user makes
        int counter;
        if (request.getSession().getAttribute("order") == null) { //make new hashmap if there's no order attribute and add the first pizza to hashmap
            newOrder = new HashMap<>();
            counter = 1;
            newOrder.put("item " + counter, new HashMap<>(newPizza));//new hashmap is required so each new pizza object isn't just a reference which is what my old code was doing
        } else { //add pizzas to the order attribute if attribute exist
            newOrder = (Map<String, Map<String, String[]>>) request.getSession().getAttribute("order");
            counter = newOrder.size() + 1;
            newOrder.put("item " + counter, new HashMap<>(newPizza)); // again new hashmap is required
//            System.out.println(newOrder.entrySet().size());
        }
        request.getSession().setAttribute("order", newOrder); //sets the new/updated hashmap to a session attribute named order
//        the above code is for users to add multiple items to one order

        for (Map.Entry<String, Map<String, String[]>> i : newOrder.entrySet()) {
            System.out.println(i.getKey());
            for (Map.Entry<String, String[]> j : i.getValue().entrySet()) {
                System.out.println(j.getKey() + ": " + Arrays.toString(j.getValue()));
            }
            System.out.println("--------------");
        }
        request.getRequestDispatcher("WEB-INF/checkout.jsp").forward(request, response);

    }
}
