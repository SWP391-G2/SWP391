/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author ROG
 */
public class Products {

    private int productID;
    private int CategoryID;
    private String productName;
    private Date productCreateDate;
    private int productStatus;
    private String productImageUrl;
    private int BrandID;
    private String updateDescription;
    private BigDecimal priceMin;
    private BigDecimal priceMax;

    public Products() {
    }

    public Products(int productID, int CategoryID, String productName, Date productCreateDate, int productStatus, String productImageUrl, int BrandID, String updateDescription, BigDecimal priceMin, BigDecimal priceMax) {
        this.productID = productID;
        this.CategoryID = CategoryID;
        this.productName = productName;
        this.productCreateDate = productCreateDate;
        this.productStatus = productStatus;
        this.productImageUrl = productImageUrl;
        this.BrandID = BrandID;
        this.updateDescription = updateDescription;
        this.priceMin = priceMin;
        this.priceMax = priceMax;
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

    public String getUpdateDescription() {
        return updateDescription;
    }

    public void setUpdateDescription(String updateDescription) {
        this.updateDescription = updateDescription;
    }

    public BigDecimal getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(BigDecimal priceMin) {
        this.priceMin = priceMin;
    }

    public BigDecimal getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(BigDecimal priceMax) {
        this.priceMax = priceMax;
    }

   
}
