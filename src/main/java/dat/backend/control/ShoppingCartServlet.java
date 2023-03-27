package dat.backend.control;

import dat.backend.model.entities.Order;
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
        request.setAttribute("shoppingcart", order);

        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/shoppingcart.jsp");

        dispatcher.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action != null && action.equals("Remove"))
        {
            int orderItemId = Integer.parseInt(request.getParameter("orderItemId"));
            Order order = (Order) session.getAttribute("shoppingcart");
            order.removeItem(orderItemId);
            request.setAttribute("shoppingcart", order);
            request.getRequestDispatcher("WEB-INF/shoppingcart.jsp").forward(request, response);
        }


    }

}
