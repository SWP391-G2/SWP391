/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Vouchers {
    private int VoucherID;
    private String Code;
    private Float Discount;
    private Date ExpiryDate;
    private int Quantity;
    private Date CreateAt;

    public Vouchers() {
    }

    public Vouchers(int VoucherID, String Code, Float Discount, Date ExpiryDate, int Quantity, Date CreateAt) {
        this.VoucherID = VoucherID;
        this.Code = Code;
        this.Discount = Discount;
        this.ExpiryDate = ExpiryDate;
        this.Quantity = Quantity;
        this.CreateAt = CreateAt;
    }

    public int getVoucherID() {
        return VoucherID;
    }

    public void setVoucherID(int VoucherID) {
        this.VoucherID = VoucherID;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String Code) {
        this.Code = Code;
    }

    public Float getDiscount() {
        return Discount;
    }

    public void setDiscount(Float Discount) {
        this.Discount = Discount;
    }

    public Date getExpiryDate() {
        return ExpiryDate;
    }

    public void setExpiryDate(Date ExpiryDate) {
        this.ExpiryDate = ExpiryDate;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public Date getCreateAt() {
        return CreateAt;
    }

    public void setCreateAt(Date CreateAt) {
        this.CreateAt = CreateAt;
    }
    
    
}
