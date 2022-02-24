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
    
    
    public ArrayList<Product> getListProductByText(String txt, int pageIndex, int pageSize) {
        ArrayList<Product> listProduct = new ArrayList<>();
        String query = "SELECT ProductID, ProductName, Image, UnitCost, Description, Temp.CategoryID, Temp.CategoryName FROM\n"
                + "(SELECT ProductID, ProductName, Image, UnitCost, Description, p.CategoryID, c.CategoryName, ROW_NUMBER() OVER (ORDER BY p.ProductID ASC) AS Num \n"
                + "FROM dbo.Products p JOIN dbo.Categories c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "WHERE ProductName LIKE '%" + txt + "%') AS Temp\n"
                + "WHERE Temp.Num >= (? - 1) * ? + 1 AND Temp.Num <= ? * ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pageIndex);
            ps.setInt(2, pageSize);
            ps.setInt(3, pageIndex);
            ps.setInt(4, pageSize);
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
    
     public Product getProductByProductId(int productId) {
        String query = "SELECT ProductID, ProductName, Image, UnitCost, Description, p.CategoryID, c.CategoryName FROM dbo.Products p JOIN dbo.Categories c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "WHERE p.ProductID = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            Product p = new Product();
            while (rs.next()) {
                Category c = new Category();

                p.setProductId(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setImage(rs.getString("Image"));
                p.setUnitCost(rs.getInt("UnitCost"));
                p.setDescription(rs.getString("Description"));
                c.setCategoryId(rs.getInt("CategoryID"));
                c.setCategoryName(rs.getString("CategoryName"));
                p.setCategory(c);

            }

            return p;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;

    }
     
     public ArrayList<Product> getAllProduct() {
        ArrayList<Product> listProduct = new ArrayList<>();
        String query = "SELECT ProductID, ProductName, Image, UnitCost, Description, p.CategoryID, c.CategoryName FROM dbo.Products p JOIN dbo.Categories c\n"
                + "ON c.CategoryID = p.CategoryID";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
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
     
     
     public int getLastIdProduct() {
        String query = "SELECT TOP 1 ProductID FROM dbo.Products\n"
                + "ORDER BY ProductID DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("productID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void addProduct(Product p) {
        String query = "INSERT INTO [Products]([ProductID],[ProductName],[Image],[UnitCost],[Description],[CategoryID])\n"
                + " VALUES(?,?,?,?,?,?)";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, p.getProductId());
            ps.setString(2, p.getProductName());
            ps.setString(3, p.getImage());
            ps.setInt(4, p.getUnitCost());
            ps.setString(5, p.getDescription());
            ps.setInt(6, p.getCategory().getCategoryId());

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }
    
    
    public void updateProduct(Product p) {
        String query = "UPDATE [Products]\n"
                + "   SET	[ProductName] = ?,\n"
                + "		[Image] = ?,\n"
                + "		[UnitCost] = ?,\n"
                + "		[Description] = ?,\n"
                + "		[CategoryID] = ?\n"
                + " WHERE ProductID = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getImage());
            ps.setInt(3, p.getUnitCost());
            ps.setString(4, p.getDescription());
            ps.setInt(5, p.getCategory().getCategoryId());
            ps.setInt(6, p.getProductId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    
    public void deleteProduct(int productId) {
        String query = "DELETE FROM dbo.Products WHERE ProductID = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, productId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    public int countRecord(String txt) {
        String query = "SELECT COUNT(*) as num FROM dbo.Products p JOIN dbo.Categories c\n"
                + "ON c.CategoryID = p.CategoryID\n"
                + "WHERE p.ProductName LIKE '%"+ txt +"%'";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("num");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
