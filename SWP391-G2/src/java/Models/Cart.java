/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hatru
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getPdProductID() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    //add item to cart
    public void addItem(Item t) {
        //Exist in cart
        if (getItemById(t.getProduct().getPdProductID()) != null) {
            Item i = getItemById(t.getProduct().getPdProductID());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        } //Not exist in cart
        else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public BigDecimal getTotalMoney() {
        BigDecimal t = BigDecimal.valueOf(0);
        
        for (Item i : items) {
      BigDecimal quantity = BigDecimal.valueOf(i.getQuantity());
            t = t.add(quantity.multiply(i.getPrice()));
        }
        return t;
    }

    private ProductDetail getProductDetailByID(int id, List<ProductDetail> list) {
        for (ProductDetail i : list) {
            if (i.getPdProductID() == id) {
                return i;
            }
        }
        return null;
    }

    public Cart(String txt, List<ProductDetail> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split(",");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    ProductDetail p = getProductDetailByID(id, list);
                    Item t = new Item(p, quantity, p.getProductSize(), p.getProductPrice());
                    addItem(t);
                }
            }
        } catch (NumberFormatException e) {
            
        }

    }

}
