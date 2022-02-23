package Model;

import java.util.ArrayList;

public class Cart {

    Product product;
    int quantity;

    public Cart() {
    }

    public Cart(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
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

    public ArrayList<Cart> addToCart(ArrayList<Cart> listCart, Product p, int quantity) {
        boolean isExist = false;
        for (Cart cart : listCart) {
            if (cart.getProduct().getProductId() == p.getProductId()) {
                int oldQuantity = cart.getQuantity();
                cart.setQuantity(oldQuantity + quantity);
                isExist = true;
            }
        }
        if (isExist == false) {
            listCart.add(new Cart(p, quantity));
        }
        return listCart;
    }

    public ArrayList<Cart> deleteProduct(ArrayList<Cart> listCart, int idDelete) {
        
        for (int i = 0; i < listCart.size(); i++) {
            if(listCart.get(i).getProduct().getProductId() == idDelete) {
                listCart.remove(listCart.get(i));
            }
        }
        
        return listCart;
    }

}
