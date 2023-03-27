package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Order;
import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.OrderFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminViewOrdersServlet", value = "/AdminViewOrdersServlet")
public class AdminViewOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
            try {
                List<Order> orders = OrderFacade.getAllOrders(ApplicationStart.getConnectionPool());
                request.setAttribute("orders", orders);
                request.getRequestDispatcher("WEB-INF/adminOrders.jsp").forward(request, response);
            } catch (DatabaseException e) {
                request.setAttribute("message", e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
