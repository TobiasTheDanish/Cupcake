package dat.backend.control;

import dat.backend.model.entities.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "shoppingCartServlet", value = "/shoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");


        RequestDispatcher dispatcher = request.getRequestDispatcher("/shoppingcart.jsp");
        dispatcher.forward(request, response);
        response.sendRedirect("shoppingcart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
