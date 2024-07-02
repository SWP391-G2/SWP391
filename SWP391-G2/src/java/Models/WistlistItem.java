/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author pna29
 */
public class WistlistItem {
    private String image;
    private String productName;
    private String size;
    private BigDecimal price;
    private Date wishlistDate;

    public WistlistItem() {
    }

    public WistlistItem(String image, String productName, String size, BigDecimal price, Date wishlistDate) {
        this.image = image;
        this.productName = productName;
        this.size = size;
        this.price = price;
        this.wishlistDate = wishlistDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Date getWishlistDate() {
        return wishlistDate;
    }

    public void setWishlistDate(Date wishlistDate) {
        this.wishlistDate = wishlistDate;
    }
    
    
}
