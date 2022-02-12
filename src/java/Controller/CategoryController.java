
package Controller;

import DAL.CategoryDBContext;
import DAL.ClassifyDBContext;
import DAL.ProductDBContext;
import Model.Category;
import Model.Classify;
import Model.Product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CategoryController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int classifyId = Integer.parseInt(request.getParameter("classify"));
        int categoryId;
        try {
            categoryId = Integer.parseInt(request.getParameter("category"));
        } catch (NumberFormatException e) {
            categoryId = -1;
        }

        Classify classifyFind = new ClassifyDBContext().getClassifyById(classifyId);
        ArrayList<Category> listCategory = new CategoryDBContext().getListCategory(classifyId);
        
        ArrayList<Product> listProduct = new ProductDBContext().getListProductById(categoryId, classifyId);
        
        request.setAttribute("classifyFind", classifyFind);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("category.jsp").forward(request, response);
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
