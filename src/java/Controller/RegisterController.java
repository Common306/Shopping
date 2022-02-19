
package Controller;

import DAL.AccountDBContext;
import Model.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usernameRegis = request.getParameter("usernameRegister");
        String passwordRegis = request.getParameter("passwordRegister");
        String rePassword = request.getParameter("re-password");
        if (usernameRegis.trim().isEmpty()) {
            request.setAttribute("errorUserRegis", "Fill must not be blank");
            request.getRequestDispatcher("account.jsp").forward(request, response);
        }
        if (passwordRegis.trim().isEmpty()) {
            request.setAttribute("errorPassRegis", "Fill must not be blank");
            request.getRequestDispatcher("account.jsp").forward(request, response);
        }
        if (!rePassword.trim().equals(passwordRegis.trim())) {
            request.setAttribute("errorRePassRegis", "Password and re-password must be same");
            request.getRequestDispatcher("account.jsp").forward(request, response);
        }
        boolean isExistAccount = new AccountDBContext().isExistAccount(usernameRegis);
        if(isExistAccount) {
            request.setAttribute("errorExist", "Username is already exist. Input again");
            request.getRequestDispatcher("account.jsp").forward(request, response);
        } else {
            Account newAccount = new Account(usernameRegis, rePassword, false);
            new AccountDBContext().addAccount(newAccount);
            request.getSession().setAttribute("account", newAccount);
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
