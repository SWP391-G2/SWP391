/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

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

    public Cart(List<Item> items) {
        this.items = items;
    }
    
    private Item getItemById(int id){
        for (Item i : items) {
            if(i.getProduct().getPdProductID() == id){
                return i;
            }
        }
        return null;
    }
    
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    
    //add item to cart
    public void add(Item t){
        //Exist in cart
        if(getItemById(t.getProduct().getPdProductID()) != null) {
            Item i = getItemById(t.getProduct().getPdProductID());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        }
        //Not exist in cart
        else{
            items.add(t);
        }
    }
    
    public void removeItem(int id){
        if(getItemById(id) != null){
            items.remove(getItemById(id));
        }
    }
    
    public double getTotalMoney(){
        double t=0;
        for (Item i : items) {
            t+= i.getQuantity()*i.getPrice();
        }
        return t;
    }
    
}
