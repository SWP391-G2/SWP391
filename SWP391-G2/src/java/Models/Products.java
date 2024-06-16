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

    private int productID;
    private String productName;
    private Date productCreateDate;
    private int productStatus;
    private String productImageUrl;
    private int BrandID;
    private int fk_category_id;
    private String UpdateDescription;

    public Products(int productID, String productName, Date productCreateDate, int productStatus, String productImageUrl, int BrandID, int fk_category_id, String UpdateDescription) {
        this.productID = productID;
        this.productName = productName;
        this.productCreateDate = productCreateDate;
        this.productStatus = productStatus;
        this.productImageUrl = productImageUrl;
        this.BrandID = BrandID;
        this.fk_category_id = fk_category_id;
        this.UpdateDescription = UpdateDescription;
    }

    public Products() {
    }

    public Products(String productName, Date productCreateDate, int productStatus, String productImageUrl, int BrandID, int fk_category_id) {
        this.productName = productName;
        this.productCreateDate = productCreateDate;
        this.productStatus = productStatus;
        this.productImageUrl = productImageUrl;
        this.BrandID = BrandID;
        this.fk_category_id = fk_category_id;
    }

    
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
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

    public int getFk_category_id() {
        return fk_category_id;
    }

    public void setFk_category_id(int fk_category_id) {
        this.fk_category_id = fk_category_id;
    }

    public String getUpdateDescription() {
        return UpdateDescription;
    }

    public void setUpdateDescription(String UpdateDescription) {
        this.UpdateDescription = UpdateDescription;
    }

}
