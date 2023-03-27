package dat.backend.control;

import dat.backend.model.entities.Order;
import dat.backend.model.entities.User;
import dat.backend.model.services.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "shoppingCartServlet", urlPatterns = "/shoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    Order order = ShoppingCart.getOrder();
    request.setAttribute("order", order);

        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/shoppingcart.jsp");

        dispatcher.forward(request, response);




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    if(action != null && action.equals("Remove"));{

        }
        response.sendRedirect("shoppingCartServlet");
    }
}
