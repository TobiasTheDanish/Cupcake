package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.UserFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EditWalletServlet", value = "/EditWalletServlet")
public class EditWalletServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<User> userList = null;
        try {
            userList = UserFacade.getAll(ApplicationStart.getConnectionPool());
        } catch (DatabaseException e) {
            request.setAttribute("errormessage", "ERROR: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/adminUserList.jsp").forward(request,response);
        }

        try {
            float wallet = Float.parseFloat(request.getParameter("wallet"));
            int id = Integer.parseInt(request.getParameter("user_id"));
            if (!UserFacade.editWallet(wallet, id, ApplicationStart.getConnectionPool())){
                request.setAttribute("errormessage", "Could not update wallet.");
            }
        } catch (NumberFormatException | DatabaseException e){
            request.setAttribute("userList", userList);
            request.setAttribute("errormessage", "ERROR: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/adminUserList.jsp").forward(request,response);
        }
        try {
            userList = UserFacade.getAll(ApplicationStart.getConnectionPool());
        } catch (DatabaseException e) {
            request.setAttribute("errormessage", "ERROR: " + e.getMessage());
            request.getRequestDispatcher("WEB-INF/adminUserList.jsp").forward(request,response);
        }
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("WEB-INF/adminUserList.jsp").forward(request,response);
    }
}
