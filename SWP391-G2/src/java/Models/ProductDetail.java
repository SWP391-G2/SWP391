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
    private int ProductFullDetailID;
    private int pdProductID;
    private String ProductDescription; 
    private Date ProductCreateDate;
    private Boolean ProductStatus;
    private String ProductSize;
    private Float ProductPrice;
    private int ProductAvaiable;
    private String image;

    public ProductDetail() {
    }

    public ProductDetail(int ProductFullDetailID, int pdProductID, String ProductDescription, Date ProductCreateDate, Boolean ProductStatus, String ProductSize, Float ProductPrice, int ProductAvaiable, String image) {
        this.ProductFullDetailID = ProductFullDetailID;
        this.pdProductID = pdProductID;
        this.ProductDescription = ProductDescription;
        this.ProductCreateDate = ProductCreateDate;
        this.ProductStatus = ProductStatus;
        this.ProductSize = ProductSize;
        this.ProductPrice = ProductPrice;
        this.ProductAvaiable = ProductAvaiable;
        this.image = image;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "ProductDetail{" + "ProductFullDetailID=" + ProductFullDetailID + ", pdProductID=" + pdProductID + ", ProductDescription=" + ProductDescription + ", ProductCreateDate=" + ProductCreateDate + ", ProductStatus=" + ProductStatus + ", ProductSize=" + ProductSize + ", ProductPrice=" + ProductPrice + ", ProductAvaiable=" + ProductAvaiable + ", image=" + image + '}';
    }

    
   
}