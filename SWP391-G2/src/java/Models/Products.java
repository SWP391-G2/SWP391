/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author pna29
 */
public class Products {
     private int productID;
    private int CategoryID;
    private String productName;
    private Date productCreateDate;
    private int productStatus;
    private String productImageUrl;
    private int BrandID;

    public Products() {
    }

    public Products(int productID, int CategoryID, String productName, Date productCreateDate, int productStatus, String productImageUrl, int BrandID) {
        this.productID = productID;
        this.CategoryID = CategoryID;
        this.productName = productName;
        this.productCreateDate = productCreateDate;
        this.productStatus = productStatus;
        this.productImageUrl = productImageUrl;
        this.BrandID = BrandID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Date getProductCreateDate() {
        return productCreateDate;
    }

    public void setProductCreateDate(Date productCreateDate) {
        this.productCreateDate = productCreateDate;
    }

    public int getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(int productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductImageUrl() {
        return productImageUrl;
    }

    public void setProductImageUrl(String productImageUrl) {
        this.productImageUrl = productImageUrl;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }
    
    
}
