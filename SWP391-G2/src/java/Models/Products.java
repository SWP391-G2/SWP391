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
    private String productDetail;
    private Date productCreateDate;
    private int pdtID;
    private boolean productStatus;
    private int productImageID;
    private int OrderID;
    private int fbID;
    private float productPrice;

    public Products() {
    }

    public Products(int productID, int subCategoryID, String productName, String productDetail, Date productCreateDate, int pdtID, boolean productStatus, int productImageID, int OrderID, int fbID, float productPrice) {
        this.productID = productID;
        this.subCategoryID = subCategoryID;
        this.productName = productName;
        this.productDetail = productDetail;
        this.productCreateDate = productCreateDate;
        this.pdtID = pdtID;
        this.productStatus = productStatus;
        this.productImageID = productImageID;
        this.OrderID = OrderID;
        this.fbID = fbID;
        this.productPrice = productPrice;
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

    public String getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public Date getProductCreateDate() {
        return productCreateDate;
    }

    public void setProductCreateDate(Date productCreateDate) {
        this.productCreateDate = productCreateDate;
    }

    public int getPdtID() {
        return pdtID;
    }

    public void setPdtID(int pdtID) {
        this.pdtID = pdtID;
    }

    public boolean isProductStatus() {
        return productStatus;
    }

    public void setProductStatus(boolean productStatus) {
        this.productStatus = productStatus;
    }

    public int getProductImageID() {
        return productImageID;
    }

    public void setProductImageID(int productImageID) {
        this.productImageID = productImageID;
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

    public float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(float productPrice) {
        this.productPrice = productPrice;
    }

    @Override
    public String toString() {
        return "Products{" + "productID=" + productID + ", subCategoryID=" + subCategoryID + ", productName=" + productName + ", productDetail=" + productDetail + ", productCreateDate=" + productCreateDate + ", pdtID=" + pdtID + ", productStatus=" + productStatus + ", productImageID=" + productImageID + ", OrderID=" + OrderID + ", fbID=" + fbID + ", productPrice=" + productPrice + '}';
    }

     

   
    
}
