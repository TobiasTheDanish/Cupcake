package dat.backend.control;

import dat.backend.model.entities.Order;
import dat.backend.model.entities.OrderItem;
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
        request.getSession().setAttribute("shoppingcart", order);

        request.getRequestDispatcher("WEB-INF/shoppingcart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        Order order = (Order) session.getAttribute("shoppingcart");
        if (action != null && action.equals("Remove")) {
            int orderItemId = Integer.parseInt(request.getParameter("orderItemId"));
            order.removeItem(orderItemId);
            session.setAttribute("shoppingcart", order);
            request.getRequestDispatcher("WEB-INF/shoppingcart.jsp").forward(request, response);

        } else if (action != null && action.equals("Edit")) {
            int orderItemId = Integer.parseInt(request.getParameter("orderItemId"));
            request.setAttribute("editing", orderItemId);
            session.setAttribute("shoppingcart", order);
            request.getRequestDispatcher("WEB-INF/shoppingcart.jsp").forward(request, response);


        } else if (action != null && action.equals("Update")) {
            int orderItemId = Integer.parseInt(request.getParameter("orderItemId"));
            int newAmount = Integer.parseInt(request.getParameter("newAmount"));
            OrderItem orderItem = order.getOrderItems().get(orderItemId);
            orderItem.setAmount(newAmount);
            order.getOrderItems().set(orderItemId, orderItem);
            request.setAttribute("editing", null);
            session.setAttribute("shoppingcart", order);
            request.getRequestDispatcher("WEB-INF/shoppingcart.jsp").forward(request, response);
        }

    }

}
