package model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private HashMap<Long, Item> cartItems;

    public Cart() {
        cartItems = new HashMap<>();
    }

    public Cart(HashMap<Long, Item> cartItems) {
        this.cartItems = cartItems;
    }

    public HashMap<Long, Item> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Long, Item> cartItems) {
        this.cartItems = cartItems;
    }

    public void insertToCart(Long key, Item item, int amount) {
        boolean bln = cartItems.containsKey(key);
        if (bln) {
            int quantity_old = item.getQuantity();
            item.setQuantity(quantity_old + amount);
            cartItems.put(item.getProduct().getProductID(), item);
        } else {
            cartItems.put(item.getProduct().getProductID(), item);
        }
    }

    /*public void plusToCart(Long key, Item item) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old = item.getQuantity();
            item.setQuantity(quantity_old + 1);
            cartItems.put(key, item);
        } else {
            cartItems.put(key, item);
        }
    }*/
    public void plusToCart(Long key, Item item, int amount) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old = item.getQuantity();
            item.setQuantity(quantity_old + amount);
            cartItems.put(key, item);
        } else {
            cartItems.put(key, item);
        }
    }

    public void updateCart(Long key, Item item, int amount) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            item.setQuantity(amount);
            cartItems.put(key, item);
        }

    }

    // sub to cart
    public void subToCart(Long key, Item item) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old = item.getQuantity();
            if (quantity_old <= 1) {
                cartItems.remove(key);
            } else {
                item.setQuantity(quantity_old - 1);
                cartItems.put(key, item);
            }
        }
    }

    // remove to cart
    public void removeToCart(Long key) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            cartItems.remove(key);
        }
    }

    //clear
    public void clearCart(Long key) {
        cartItems.clear();
    }

    // count item
    public int countItem() {
        return cartItems.size();
    }

    // sum total 
    public long totalCart() {
        long count = 0;
        // count = price * quantity
        for (Map.Entry<Long, Item> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getProductPrice() * list.getValue().getQuantity();
        }
        return count;
    }

    public long totalProduct(long id) {
        long count = 0;
        // count = price * quantity
        for (Map.Entry<Long, Item> list : cartItems.entrySet()) {
            if (list.getValue().getProduct().getProductID() == id) {
                count = list.getValue().getProduct().getProductPrice() * list.getValue().getQuantity();
            }

        }
        return count;
    }
}