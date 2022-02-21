package Controller;

import DAL.ProductDBContext;
import Model.Category;
import Model.Product;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        String name_raw = request.getParameter("name");
        String img_raw = request.getParameter("image");
        String price_raw = request.getParameter("price");
        String desc_raw = request.getParameter("desc");
        String name = null, img = null, desc = null;
        int category = Integer.parseInt(request.getParameter("category"));
        int id = new ProductDBContext().getLastIdProduct() + 1;
        int price = 0;
        if(name_raw.trim().equals("")) {
            request.setAttribute("error_name", "");
            request.getRequestDispatcher("add.jsp").forward(request, response);
        }
        else {
            name = name_raw;
        }
        if(img_raw.trim().equals("")) {
            request.setAttribute("error_img", "");
            request.getRequestDispatcher("add.jsp").forward(request, response);
        }
        else {
            img = img_raw;
        }
        if(desc_raw.trim().equals("")) {
            request.setAttribute("error_desc", "");
            request.getRequestDispatcher("add.jsp").forward(request, response);
        }
        else {
            desc = desc_raw;
        }
        try {
            price = Integer.parseInt(price_raw.trim());
            Category c = new Category();
            c.setCategoryId(category);
            Product p = new Product(id, name, img, price, desc, c);
            new ProductDBContext().addProduct(p);
            request.getRequestDispatcher("manager.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error_price", "error price");
            request.getRequestDispatcher("add.jsp").forward(request, response);
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
    }// </editor-fold>

}
