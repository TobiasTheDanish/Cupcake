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

@WebServlet(name = "OrderServlet", value = "/OrderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

            try {
                List<Order> userOrders = OrderFacade.getUserOrders(user.getId(), ApplicationStart.getConnectionPool());
                request.setAttribute("orders", userOrders);
                request.getRequestDispatcher("WEB-INF/userOrders.jsp").forward(request, response);
            } catch (DatabaseException e) {
                request.setAttribute("message", e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

