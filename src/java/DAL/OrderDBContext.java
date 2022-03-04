package DAL;

import Model.Cart;
import Model.Order;
import Model.Product;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
    public ArrayList<Order> getListOrder() {
        ArrayList<Order> listOrder = new ArrayList<>();
        String query = "SELECT o.OrderId, o.[Date], o.[Time], o.Name, o.Phone, o.[Address], p.ProductName, p.[Image], p.UnitCost, o.Quantity FROM [Order] o JOIN Products p\n"
                + "ON p.ProductID = o.ProductID";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Product p = new Product();
                p.setProductName(rs.getString("ProductName"));
                p.setImage(rs.getString("Image"));
                p.setUnitCost(rs.getInt("UnitCost"));

                Order o = new Order();
                o.setOrderId(rs.getInt("OrderId"));
                o.setDate(rs.getDate("Date"));
                o.setTime(rs.getTime("Time"));
                o.setName(rs.getString("Name"));
                o.setPhone(rs.getString("Phone"));
                o.setAddress(rs.getString("Address"));
                o.setProduct(p);
                o.setQuantity(rs.getInt("Quantity"));
                listOrder.add(o);
            }

            return listOrder;

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Order getOrderByID(int orderId) {
        String query = "SELECT o.OrderId, o.[Date], o.[Time], o.Name, o.Phone, o.[Address], p.ProductName, p.[Image], p.UnitCost, o.Quantity FROM [Order] o JOIN Products p\n"
                + "ON p.ProductID = o.ProductID WHERE o.OrderId = 1?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Product p = new Product();
                p.setProductName(rs.getString("ProductName"));
                p.setImage(rs.getString("Image"));
                p.setUnitCost(rs.getInt("UnitCost"));

                Order o = new Order();
                o.setOrderId(rs.getInt("OrderId"));
                o.setDate(rs.getDate("Date"));
                o.setTime(rs.getTime("Time"));
                o.setName(rs.getString("Name"));
                o.setPhone(rs.getString("Phone"));
                o.setAddress(rs.getString("Address"));
                o.setProduct(p);
                o.setQuantity(rs.getInt("Quantity"));

                return o;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void removeOrder(int orderId) {
        String query = "DELETE FROM [Order] WHERE OrderId = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, orderId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

}
