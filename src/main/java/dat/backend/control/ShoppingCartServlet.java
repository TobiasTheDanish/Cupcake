package dat.backend.control;

import dat.backend.model.entities.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "shoppingCartServlet", urlPatterns = "/shoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");


        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/shoppingcart.jsp");
        dispatcher.forward(request, response);
        response.sendRedirect("WEB-INF/shoppingcart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String action = request.getParameter("action");
if(action != null && action.equals("Remove"));{

        }
        response.sendRedirect("shoppingCartServlet");
    }
}
