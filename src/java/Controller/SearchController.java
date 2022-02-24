
package Controller;

import DAL.ProductDBContext;
import Model.Product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String textSearch = request.getParameter("textSearch");

        int pageIndex;
        if (request.getParameter("page") != null) {
            pageIndex = Integer.parseInt(request.getParameter("page"));
        } else {
            pageIndex = 1;
        }
        
        int pageSize = 6;

        int numRecord = new ProductDBContext().countRecord(textSearch);
        int numPage;
        if (numRecord % pageSize == 0) {
            numPage = numRecord / pageSize;
        } else {
            numPage = numRecord / pageSize + 1;
        }
        ArrayList<Product> listProduct = new ProductDBContext().getListProductByText(textSearch, pageIndex, pageSize);
        request.setAttribute("textSearch", textSearch);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("numPage", numPage);
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("category2.jsp").forward(request, response);
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
