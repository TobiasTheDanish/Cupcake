package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.OrderItem;
import dat.backend.model.entities.Topping;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.OrderFacade;
import dat.backend.model.services.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "CreateOrderServlet", value = "/CreateOrderServlet")
public class CreateOrderServlet extends HttpServlet {
    private ConnectionPool connectionPool;
    private List<Bottom> bottoms;
    private List<Topping> toppings;

    @Override
    public void init() throws ServletException {
        connectionPool = ApplicationStart.getConnectionPool();
        try {
            bottoms = OrderFacade.getAllBottoms(connectionPool);
            toppings = OrderFacade.getAllToppings(connectionPool);
        } catch (DatabaseException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("bottoms", bottoms);
        request.setAttribute("toppings", toppings);
        request.getRequestDispatcher("WEB-INF/createOrder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int bottomId = Integer.parseInt(request.getParameter("bottom"));
            int toppingId = Integer.parseInt(request.getParameter("topping"));
            int amount = Integer.parseInt(request.getParameter("amount"));

            Topping topping = OrderFacade.getTopping(toppingId, connectionPool);
            Bottom bottom = OrderFacade.getBottom(bottomId, connectionPool);
            OrderItem item = new OrderItem(bottom, topping, amount);

            ShoppingCart.addItem(item);

            request.getSession().setAttribute("shoppingcart", ShoppingCart.getOrder());
            request.setAttribute("errormessage", "Successfully added the cupcake to the shoppingcart.");
            request.setAttribute("bottoms", bottoms);
            request.setAttribute("toppings", toppings);
            request.getRequestDispatcher("WEB-INF/createOrder.jsp").forward(request, response);
        } catch (DatabaseException e) {
            Logger.getLogger("web").log(Level.WARNING, "DatabaseException: [" + e.getMessage() + "]");
            request.setAttribute("errormessage", e.getMessage());
            request.setAttribute("bottoms", bottoms);
            request.setAttribute("toppings", toppings);
            request.getRequestDispatcher("WEB-INF/createOrder.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            Logger.getLogger("web").log(Level.WARNING, "NumberFormatException: [" + e.getMessage() + "]");
            request.setAttribute("errormessage", "Unable to parse number");
            request.setAttribute("bottoms", bottoms);
            request.setAttribute("toppings", toppings);
            request.getRequestDispatcher("WEB-INF/createOrder.jsp").forward(request, response);
        }
    }
}
