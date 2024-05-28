/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;


import java.util.Date;

/**
 *
 * @author hatru
 */
public class ProductDetail {
    private int ProductDetailID;
    private int pdProductID;
    private float ProductML;
    private int ProductSold;
    private int ProductAvailable;
    private Date ProductCreateDate;
    private Boolean  ProductStatus;
    private int ProductImageID;
    private int ProductQuantity;

    public ProductDetail() {
    }

    public ProductDetail(int ProductDetailID, int pdProductID, float ProductML, int ProductSold, int ProductAvailable, Date ProductCreateDate, Boolean ProductStatus, int ProductImageID, int ProductQuantity) {
        this.ProductDetailID = ProductDetailID;
        this.pdProductID = pdProductID;
        this.ProductML = ProductML;
        this.ProductSold = ProductSold;
        this.ProductAvailable = ProductAvailable;
        this.ProductCreateDate = ProductCreateDate;
        this.ProductStatus = ProductStatus;
        this.ProductImageID = ProductImageID;
        this.ProductQuantity = ProductQuantity;
    }

    public int getProductDetailID() {
        return ProductDetailID;
    }

    public void setProductDetailID(int ProductDetailID) {
        this.ProductDetailID = ProductDetailID;
    }

    public int getPdProductID() {
        return pdProductID;
    }

    public void setPdProductID(int pdProductID) {
        this.pdProductID = pdProductID;
    }

    public float getProductML() {
        return ProductML;
    }

    public void setProductML(float ProductML) {
        this.ProductML = ProductML;
    }

    public int getProductSold() {
        return ProductSold;
    }

    public void setProductSold(int ProductSold) {
        this.ProductSold = ProductSold;
    }

    public int getProductAvailable() {
        return ProductAvailable;
    }

    public void setProductAvailable(int ProductAvailable) {
        this.ProductAvailable = ProductAvailable;
    }

    public Date getProductCreateDate() {
        return ProductCreateDate;
    }

    public void setProductCreateDate(Date ProductCreateDate) {
        this.ProductCreateDate = ProductCreateDate;
    }

    public Boolean getProductStatus() {
        return ProductStatus;
    }

    public void setProductStatus(Boolean ProductStatus) {
        this.ProductStatus = ProductStatus;
    }

    public int getProductImageID() {
        return ProductImageID;
    }

    public void setProductImageID(int ProductImageID) {
        this.ProductImageID = ProductImageID;
    }

    public int getProductQuantity() {
        return ProductQuantity;
    }

    public void setProductQuantity(int ProductQuantity) {
        this.ProductQuantity = ProductQuantity;
    }
    
    
}
