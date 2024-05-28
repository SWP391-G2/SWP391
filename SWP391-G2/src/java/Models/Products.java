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
    private int subCategoryID;
    private String productName;
    private Date productCreateDate;
    private int productDetailID;
    private boolean productStatus;
    private String productImageUrl;
    private int OrderID;
    private int fbID;
    private int BrandID;

    public Products() {
    }

    public Products(int productID, int subCategoryID, String productName, Date productCreateDate, int productDetailID, boolean productStatus, String productImageUrl, int OrderID, int fbID, int BrandID) {
        this.productID = productID;
        this.subCategoryID = subCategoryID;
        this.productName = productName;
        this.productCreateDate = productCreateDate;
        this.productDetailID = productDetailID;
        this.productStatus = productStatus;
        this.productImageUrl = productImageUrl;
        this.OrderID = OrderID;
        this.fbID = fbID;
        this.BrandID = BrandID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getSubCategoryID() {
        return subCategoryID;
    }

    public void setSubCategoryID(int subCategoryID) {
        this.subCategoryID = subCategoryID;
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

    public int getProductDetailID() {
        return productDetailID;
    }

    public void setProductDetailID(int productDetailID) {
        this.productDetailID = productDetailID;
    }

    public boolean isProductStatus() {
        return productStatus;
    }

    public void setProductStatus(boolean productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductImageUrl() {
        return productImageUrl;
    }

    public void setProductImageUrl(String productImageUrl) {
        this.productImageUrl = productImageUrl;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getFbID() {
        return fbID;
    }

    public void setFbID(int fbID) {
        this.fbID = fbID;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

   

     

   
    
}
