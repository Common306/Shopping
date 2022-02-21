package DAL;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CategoryDBContext extends DBContext {

    public ArrayList<Category> getListCategory(int classifyId) {

        ArrayList<Category> listCategory = new ArrayList<>();
        String query = "SELECT CategoryID, CategoryName, ClassifyID FROM dbo.Categories WHERE ClassifyID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, classifyId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                listCategory.add(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"), rs.getInt("ClassifyID")));
            }

            return listCategory;

        } catch (SQLException ex) {
            Logger.getLogger(ClassifyDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCategory;
    }
    
    public ArrayList<Category> getAllCategory() {

        ArrayList<Category> listCategory = new ArrayList<>();
        String query = "SELECT CategoryID, CategoryName, ClassifyID FROM dbo.Categories";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                listCategory.add(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName"), rs.getInt("ClassifyID")));
            }

            return listCategory;

        } catch (SQLException ex) {
            Logger.getLogger(ClassifyDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCategory;
    }

}
