/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author hatru
 */
public class Orders {

    private int orderID;
    private int accountID;
    private Date orderDate;
    private float orderTotalPrice;
    private String orderContactName;
    private String orderPhone;
    private String orderEmail;
    private String orderAddress;
    private String PaymentMethod;
    private String orderNote;
    private int orderSoID;
    private int voucherID;

    public Orders() {
    }

    public Orders(int accountID, Date orderDate, float orderTotalPrice, String orderContactName, String orderPhone, String orderEmail, String orderAddress, String PaymentMethod, String orderNote, int orderSoID, int voucherID) {
        this.accountID = accountID;
        this.orderDate = orderDate;
        this.orderTotalPrice = orderTotalPrice;
        this.orderContactName = orderContactName;
        this.orderPhone = orderPhone;
        this.orderEmail = orderEmail;
        this.orderAddress = orderAddress;
        this.PaymentMethod = PaymentMethod;
        this.orderNote = orderNote;
        this.orderSoID = orderSoID;
        this.voucherID = voucherID;
    }

    public Orders(int orderID, int accountID, Date orderDate, float orderTotalPrice, String orderContactName, String orderPhone, String orderEmail, String orderAddress, String PaymentMethod, String orderNote, int orderSoID, int voucherID) {
        this.orderID = orderID;
        this.accountID = accountID;
        this.orderDate = orderDate;
        this.orderTotalPrice = orderTotalPrice;
        this.orderContactName = orderContactName;
        this.orderPhone = orderPhone;
        this.orderEmail = orderEmail;
        this.orderAddress = orderAddress;
        this.PaymentMethod = PaymentMethod;
        this.orderNote = orderNote;
        this.orderSoID = orderSoID;
        this.voucherID = voucherID;
    }

    public String getOrderEmail() {
        return orderEmail;
    }

    public void setOrderEmail(String orderEmail) {
        this.orderEmail = orderEmail;
    }

    public String getPaymentMethod() {
        return PaymentMethod;
    }

    public void setPaymentMethod(String PaymentMethod) {
        this.PaymentMethod = PaymentMethod;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public float getOrderTotalPrice() {
        return orderTotalPrice;
    }

    public void setOrderTotalPrice(float orderTotalPrice) {
        this.orderTotalPrice = orderTotalPrice;
    }

    public String getOrderContactName() {
        return orderContactName;
    }

  
    public void setOrderContactName(String orderContactName) {
        this.orderContactName = orderContactName;
    }

    public String getOrderPhone() {
        return orderPhone;
    }

    public void setOrderPhone(String orderPhone) {
        this.orderPhone = orderPhone;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public String getOrderNote() {
        return orderNote;
    }

    public void setOrderNote(String orderNote) {
        this.orderNote = orderNote;
    }

    public int getOrderSoID() {
        return orderSoID;
    }

    public void setOrderSoID(int orderSoID) {
        this.orderSoID = orderSoID;
    }

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

}
