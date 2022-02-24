package DAL;

import Model.Cart;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDBContext extends DBContext {

    public void addToOrder(ArrayList<Cart> listCart, String name, String phone, String address, Date date, Time time) {
        for (Cart cart : listCart) {
            String query = "INSERT INTO [Order]([Date],[Time],[Name],[Phone],[Address],[ProductID],[Quantity])\n"
                    + "     VALUES(?,?,?,?,?,?,?)";
            PreparedStatement ps;
            try {
                ps = connection.prepareStatement(query);
                ps.setDate(1, date);
                ps.setTime(2, time);
                ps.setString(3, name);
                ps.setString(4, phone);
                ps.setString(5, address);
                ps.setInt(6, cart.getProduct().getProductId());
                ps.setInt(7, cart.getQuantity());

                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}
