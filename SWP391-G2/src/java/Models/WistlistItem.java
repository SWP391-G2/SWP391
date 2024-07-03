/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author pna29
 */
public class WistlistItem {
    private int wishlistId;
    private int accountId;
    private int productId;
    private Date wishlistDate;



    public WistlistItem() {
    }

    public WistlistItem(int wishlistId, int accountId, int productId, Date wishlistDate) {
        this.wishlistId = wishlistId;
        this.accountId = accountId;
        this.productId = productId;
        this.wishlistDate = wishlistDate;
    }

    public int getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(int wishlistId) {
        this.wishlistId = wishlistId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Date getWishlistDate() {
        return wishlistDate;
    }

    public void setWishlistDate(Date wishlistDate) {
        this.wishlistDate = wishlistDate;
    }

  
}
