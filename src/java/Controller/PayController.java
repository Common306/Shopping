
package Controller;

import DAL.OrderDBContext;
import Model.Cart;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PayController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        ArrayList<Cart> listCart = (ArrayList<Cart>)request.getSession().getAttribute("listCart");
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        if(name.trim().isEmpty()) {
            request.setAttribute("errorName", "");
            request.getRequestDispatcher("pay.jsp").forward(request, response);
        }
        if(phone.trim().isEmpty()) {
            request.setAttribute("errorPhone", "");
            request.getRequestDispatcher("pay.jsp").forward(request, response);
        }
        if(address.trim().isEmpty()) {
            request.setAttribute("errorAddress", "");
            request.getRequestDispatcher("pay.jsp").forward(request, response);
        }
        
        java.util.Date dateJava = new java.util.Date();
        java.sql.Date dateSql = new java.sql.Date(dateJava.getTime());
        java.sql.Time timeSql = new java.sql.Time(dateJava.getTime());
        
        new OrderDBContext().addToOrder(listCart, name, phone, address, dateSql, timeSql);
        request.getSession().removeAttribute("listCart");
        response.getWriter().print("<p style='color: limegreen;font-size: 30px;font-weight: bold;margin: 50px 100px;'>Thanh toán thành công</p>");
        
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
