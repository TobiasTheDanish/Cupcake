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
import java.util.List;

@WebServlet(name = "AdminUserListServlet", value = "/AdminUserListServlet")
public class AdminUserListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = null;
        try {
            userList = UserFacade.getAll(ApplicationStart.getConnectionPool());
        } catch (DatabaseException e) {
            request.setAttribute("error message", e.getMessage());
        }
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("WEB-INF/adminUserList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
