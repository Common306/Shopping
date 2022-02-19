
package Controller;

import DAL.AccountDBContext;
import Model.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("usernameLogin");
        String password = request.getParameter("passwordLogin");
        
        String remember = request.getParameter("remember");// on or null

        if (username.trim().isEmpty()) {
            request.setAttribute("errorUserLogin", "Fill must not be blank");
            request.getRequestDispatcher("account.jsp").forward(request, response);
        }
        if (password.trim().isEmpty()) {
            request.setAttribute("errorPassLogin", "Fill must not be blank");
            request.getRequestDispatcher("account.jsp").forward(request, response);
        }     
        
        Account a = new AccountDBContext().getAccount(username, password);
        if (a == null) {
            request.setAttribute("errorWrong", "Username or password wrong. Input again");
            request.getRequestDispatcher("account.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("account", a);
            response.sendRedirect("home.jsp");
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
