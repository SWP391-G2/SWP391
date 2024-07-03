/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;

/**
 *
 * @author ROG
 */
public class Products {

    private int ProductID;
    private String ProductName;
    private Date ProductCreateDate;
    private int ProductStatus;
    private String ProductImageUrl;
    private int BrandID;
    private int CategoryID;

    public Products() {
    }

    public Products(int ProductID, String ProductName, Date ProductCreateDate, int ProductStatus, String ProductImageUrl, int BrandID, int CategoryID) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductCreateDate = ProductCreateDate;
        this.ProductStatus = ProductStatus;
        this.ProductImageUrl = ProductImageUrl;
        this.BrandID = BrandID;
        this.CategoryID = CategoryID;
    }

    
    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public Date getProductCreateDate() {
        return ProductCreateDate;
    }

    public void setProductCreateDate(Date ProductCreateDate) {
        this.ProductCreateDate = ProductCreateDate;
    }

    public int getProductStatus() {
        return ProductStatus;
    }

    public void setProductStatus(int ProductStatus) {
        this.ProductStatus = ProductStatus;
    }

    public String getProductImageUrl() {
        return ProductImageUrl;
    }

    public void setProductImageUrl(String ProductImageUrl) {
        this.ProductImageUrl = ProductImageUrl;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

}
