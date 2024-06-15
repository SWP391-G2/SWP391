/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author hatru
 */
public class Carts {
    private int CardID;
    private int ProductFullDetailID;
    private int AccountID;
    private int Quantity;
    private double Price;

    public Carts() {
    }

    public Carts(int CardID, int ProductFullDetailID, int AccountID, int Quantity, double Price) {
        this.CardID = CardID;
        this.ProductFullDetailID = ProductFullDetailID;
        this.AccountID = AccountID;
        this.Quantity = Quantity;
        this.Price = Price;
    }

    public int getCardID() {
        return CardID;
    }

    public void setCardID(int CardID) {
        this.CardID = CardID;
    }

    public int getProductFullDetailID() {
        return ProductFullDetailID;
    }

    public void setProductFullDetailID(int ProductFullDetailID) {
        this.ProductFullDetailID = ProductFullDetailID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    @Override
    public String toString() {
        return "Carts{" + "CardID=" + CardID + ", ProductFullDetailID=" + ProductFullDetailID + ", AccountID=" + AccountID + ", Quantity=" + Quantity + ", Price=" + Price + '}';
    }
    
    
    
    
}
