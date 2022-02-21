package Controller;

import DAL.CategoryDBContext;
import DAL.ProductDBContext;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        Product p = new ProductDBContext().getProductByProductId(productId);
        ArrayList<Category> listCategory = new CategoryDBContext().getAllCategory();
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("product", p);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        int id = Integer.parseInt(request.getParameter("pid"));
        Product proBefore = new ProductDBContext().getProductByProductId(id);
        ArrayList<Category> listCategory = new CategoryDBContext().getAllCategory();
        String name_raw = request.getParameter("name");
        String img_raw = request.getParameter("image");
        String price_raw = request.getParameter("price");
        String desc_raw = request.getParameter("desc");

        String name = "", img = "", desc = "";

        int category = Integer.parseInt(request.getParameter("category"));
        int price = 0;
        if (name_raw.trim().equals("")) {
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("product", proBefore);
            request.setAttribute("error_name", "");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } else {
            name = name_raw;
        }
        if (img_raw.trim().equals("")) {
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("product", proBefore);
            request.setAttribute("error_img", "");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } else {
            img = img_raw;
        }
        if (desc_raw.trim().equals("")) {
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("product", proBefore);
            request.setAttribute("error_desc", "");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } else {
            desc = desc_raw;
        }
        try {
            price = Integer.parseInt(price_raw.trim());
            Category c = new Category();
            c.setCategoryId(category);
            Product p = new Product(id, name, img, price, desc, c);
            new ProductDBContext().updateProduct(p);
            request.getRequestDispatcher("manager.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("product", proBefore);
            request.setAttribute("error_price", "");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
