/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author hatru
 */
public class Orders {
    private int OrderID;
    private int AccountID;
    private Date OrderDate;
    private String OrderContactName;
    private String OrderPhone;
    private String OrderAddress;
    private int OrderStatus;
    private Date OrderRecieveDate;
    private String OrderNote;
    private int OrderSoID;

    public Orders() {
    }

    public Orders(int OrderID, int AccountID, Date OrderDate, String OrderContactName, String OrderPhone, String OrderAddress, int OrderStatus, Date OrderRecieveDate, String OrderNote, int OrderSoID) {
        this.OrderID = OrderID;
        this.AccountID = AccountID;
        this.OrderDate = OrderDate;
        this.OrderContactName = OrderContactName;
        this.OrderPhone = OrderPhone;
        this.OrderAddress = OrderAddress;
        this.OrderStatus = OrderStatus;
        this.OrderRecieveDate = OrderRecieveDate;
        this.OrderNote = OrderNote;
        this.OrderSoID = OrderSoID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public Date getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getOrderContactName() {
        return OrderContactName;
    }

    public void setOrderContactName(String OrderContactName) {
        this.OrderContactName = OrderContactName;
    }

    public String getOrderPhone() {
        return OrderPhone;
    }

    public void setOrderPhone(String OrderPhone) {
        this.OrderPhone = OrderPhone;
    }

    public String getOrderAddress() {
        return OrderAddress;
    }

    public void setOrderAddress(String OrderAddress) {
        this.OrderAddress = OrderAddress;
    }

    public int getOrderStatus() {
        return OrderStatus;
    }

    public void setOrderStatus(int OrderStatus) {
        this.OrderStatus = OrderStatus;
    }

    public Date getOrderRecieveDate() {
        return OrderRecieveDate;
    }

    public void setOrderRecieveDate(Date OrderRecieveDate) {
        this.OrderRecieveDate = OrderRecieveDate;
    }

    public String getOrderNote() {
        return OrderNote;
    }

    public void setOrderNote(String OrderNote) {
        this.OrderNote = OrderNote;
    }

    public int getOrderSoID() {
        return OrderSoID;
    }

    public void setOrderSoID(int OrderSoID) {
        this.OrderSoID = OrderSoID;
    }
    
    
}
