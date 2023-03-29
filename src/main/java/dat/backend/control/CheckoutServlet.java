package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Order;
import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.OrderFacade;
import dat.backend.model.persistence.UserFacade;
import dat.backend.model.services.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CheckoutServlet", value = "/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Order order = (Order) request.getSession().getAttribute("shoppingcart");
        HttpSession session = request.getSession();

        try {
            OrderFacade.createOrder(order, ApplicationStart.getConnectionPool());

            session.setAttribute("user", UserFacade.getUser(ApplicationStart.getConnectionPool(), order.getCustomer().getId()));

            ShoppingCart.clear();
            session.setAttribute("shoppingcart", null);
            request.setAttribute("message", "Succesfully checked out.");
            request.getRequestDispatcher("WEB-INF/checkout.jsp").forward(request, response);
        } catch (DatabaseException e) {
            request.setAttribute("message", "Checkout unsuccesful, with following error message: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/checkout.jsp").forward(request, response);
        }
    }
}
