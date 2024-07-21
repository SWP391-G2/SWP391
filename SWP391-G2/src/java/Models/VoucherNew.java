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
public class VoucherNew {
    private int VoucherID;
    private String Code;
    private float Discount;
    private Date ExpiryDate;
    private int Quantity;
    private Date CreateAt;

    public VoucherNew() {
    }

    public VoucherNew(int VoucherID, String Code, float Discount, Date ExpiryDate, int Quantity, Date CreateAt) {
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

    public float getDiscount() {
        return Discount;
    }

    public void setDiscount(float Discount) {
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

    @Override
    public String toString() {
        return "Vourchers{" + "VoucherID=" + VoucherID + ", Code=" + Code + ", Discount=" + Discount + ", ExpiryDate=" + ExpiryDate + ", Quantity=" + Quantity + ", CreateAt=" + CreateAt + '}';
    }
    
    
}
