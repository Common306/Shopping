package DAL;

import Model.Classify;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClassifyDBContext extends DBContext{
    public ArrayList<Classify> getListClassify() {
        
        ArrayList<Classify> listClassify = new ArrayList<>();
        String query = "SELECT ClassifyID, ClassifyName FROM dbo.Classifies";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {                
                listClassify.add(new Classify(rs.getInt("ClassifyID"), rs.getString("ClassifyName")));
            }
            
            return listClassify;
            
        } catch (SQLException ex) {
            Logger.getLogger(ClassifyDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listClassify;
    }
}