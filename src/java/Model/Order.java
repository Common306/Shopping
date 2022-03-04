package Model;

import java.sql.Date;
import java.sql.Time;

public class Order {
    private int orderId;
    private Date date;
    private Time time;
    private String name;
    private String phone;
    private String address;
    private Product product;
    private int quantity;

    public Order() {
    }

    public Order(int orderId, Date date, Time time, String name, String phone, String address, Product product, int quantity) {
        this.orderId = orderId;
        this.date = date;
        this.time = time;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.product = product;
        this.quantity = quantity;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}