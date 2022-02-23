package DAL;

import Model.Cart;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CartDBContext extends DBContext {

    public void addCart(ArrayList<Cart> listCart, String name, String phone, String address) {
        for (Cart cart : listCart) {
            String query = "INSERT INTO [Cart]([Name],[Phone],[Address],[Quantity],[ProductID]) \n"
                    + "VALUES (?,?,?,?,?)";
            PreparedStatement ps;
            try {
                ps = connection.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, address);
                ps.setInt(4, cart.getQuantity());
                ps.setInt(5, cart.getProduct().getProductId());
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}
