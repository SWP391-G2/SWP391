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
    private int ProductID;
    private String ProductName;
    private int ProductFullDetailID;
    private int pdProductID;
    private String ProductDescription; 
    private Date ProductCreateDate;
    private Boolean ProductStatus;
    private String ProductSize;
    private Float ProductPrice;
    private int ProductAvaiable;
    private String ProductImageUrl;
    public ProductDetail() {
    }

    public ProductDetail(int ProductID, String ProductName, int ProductFullDetailID, int pdProductID, String ProductDescription, Date ProductCreateDate, Boolean ProductStatus, String ProductSize, Float ProductPrice, int ProductAvaiable, String ProductImageUrl) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductFullDetailID = ProductFullDetailID;
        this.pdProductID = pdProductID;
        this.ProductDescription = ProductDescription;
        this.ProductCreateDate = ProductCreateDate;
        this.ProductStatus = ProductStatus;
        this.ProductSize = ProductSize;
        this.ProductPrice = ProductPrice;
        this.ProductAvaiable = ProductAvaiable;
        this.ProductImageUrl = ProductImageUrl;
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

    public int getProductFullDetailID() {
        return ProductFullDetailID;
    }

    public void setProductFullDetailID(int ProductFullDetailID) {
        this.ProductFullDetailID = ProductFullDetailID;
    }

    public int getPdProductID() {
        return pdProductID;
    }

    public void setPdProductID(int pdProductID) {
        this.pdProductID = pdProductID;
    }

    public String getProductDescription() {
        return ProductDescription;
    }

    public void setProductDescription(String ProductDescription) {
        this.ProductDescription = ProductDescription;
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
    
    public String getProductSize() {
        return ProductSize;
    }

    public void setProductSize(String ProductSize) {
        this.ProductSize = ProductSize;
    }

    public Float getProductPrice() {
        return ProductPrice;
    }

    public void setProductPrice(Float ProductPrice) {
        this.ProductPrice = ProductPrice;
    }

    public int getProductAvaiable() {
        return ProductAvaiable;
    }

    public void setProductAvaiable(int ProductAvaiable) {
        this.ProductAvaiable = ProductAvaiable;
    }

    public String getProductImageUrl() {
        return ProductImageUrl;
    }

    public void setProductImageUrl(String ProductImageUrl) {
        this.ProductImageUrl = ProductImageUrl;
    }

    
}