package DAL;
import Model.Category;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDBContext extends DBContext {

    public ArrayList<Product> getListProductById(int categoryId, int classifyId) {
        ArrayList<Product> listProduct = new ArrayList<>();
        String query;
        if (categoryId <= 0) {
            query = "SELECT ProductID, ProductName, Image, UnitCost, Description, p.CategoryID, c.CategoryName FROM dbo.Products p JOIN dbo.Categories c\n"
                    + "ON c.CategoryID = p.CategoryID JOIN dbo.Classifies cl\n"
                    + "ON cl.ClassifyID = c.ClassifyID\n"
                    + "WHERE cl.ClassifyID = ?";
        } else {
            query = "SELECT ProductID, ProductName, Image, UnitCost, Description, p.CategoryID, c.CategoryName FROM dbo.Products p JOIN dbo.Categories c\n"
                    + "ON c.CategoryID = p.CategoryID\n"
                    + "WHERE c.CategoryID = ?";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            if (categoryId <= 0) {
                ps.setInt(1, classifyId);
            } else {
                ps.setInt(1, categoryId);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                Category c = new Category();

                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setImage(rs.getString("Image"));
                p.setUnitCost(rs.getInt("UnitCost"));
                p.setDescription(rs.getString("Description"));
                c.setCategoryId(rs.getInt("CategoryID"));
                c.setCategoryName(rs.getString("CategoryName"));
                p.setCategory(c);

                listProduct.add(p);

            }

            return listProduct;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }
}
