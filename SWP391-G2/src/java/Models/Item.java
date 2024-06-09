/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author hatru
 */
public class Item {

    private ProductDetail product;
    private int quantity;
    private String mil;
    private double price;

    public Item() {
    }

    public Item(ProductDetail product, int quantity, String mil, double price) {
        this.product = product;
        this.quantity = quantity;
        this.mil = mil;
        this.price = price;
    }

    public ProductDetail getProduct() {
        return product;
    }

    public void setProduct(ProductDetail product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getMil() {
        return mil;
    }

    public void setMil(String mil) {
        this.mil = mil;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

   

}
