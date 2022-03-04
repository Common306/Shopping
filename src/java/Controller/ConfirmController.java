package Controller;

import DAL.OrderDBContext;
import Model.Account;
import Model.Order;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConfirmController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Account account = (Account) request.getSession().getAttribute("account");
        if (account == null || !account.isManager()) {
            response.getWriter().print("<p style=\"margin-left: 100px;color: red;\">Access denied</p>");
        } else if (account.isManager()) {
            int orderId = Integer.parseInt(request.getParameter("id"));
            Order order = new OrderDBContext().getOrderByID(orderId);
            new OrderDBContext().removeOrder(orderId);
            response.sendRedirect("order");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
