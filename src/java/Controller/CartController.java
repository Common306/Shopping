package Controller;

import DAL.ProductDBContext;
import Model.Cart;
import Model.Product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idDelete = Integer.parseInt(request.getParameter("idDelete"));

        ArrayList<Cart> listCart = (ArrayList<Cart>) request.getSession().getAttribute("listCart");

        listCart = new Cart().deleteProduct(listCart, idDelete);
        if (listCart.isEmpty()) {
            request.getSession().setAttribute("listCart", null);
        } else {
            request.getSession().setAttribute("listCart", listCart);

        }

        response.sendRedirect("cart.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Product p = new ProductDBContext().getProductByProductId(id);

        ArrayList<Cart> listCart = new ArrayList<>();
        Object obj = request.getSession().getAttribute("listCart");
        if (obj != null) {
            listCart = (ArrayList<Cart>) obj;
        }

        listCart = new Cart().addToCart(listCart, p, quantity);

        request.getSession().setAttribute("listCart", listCart);
        response.sendRedirect("cart.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
