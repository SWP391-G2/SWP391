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
    private int ProductDetailID;
    private boolean ProductStatus;
    private String ProductImageUrl;
    private int OrderID;
    private int fbID;
    private int BrandID;
    private int fk_category_id;
    private String UpdateDescription;

    public Products() {
    }

    public Products(int ProductID, String ProductName, Date ProductCreateDate, int ProductDetailID, boolean ProductStatus, String ProductImageUrl, int OrderID, int fbID, int BrandID, int fk_category_id, String UpdateDescription) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductCreateDate = ProductCreateDate;
        this.ProductDetailID = ProductDetailID;
        this.ProductStatus = ProductStatus;
        this.ProductImageUrl = ProductImageUrl;
        this.OrderID = OrderID;
        this.fbID = fbID;
        this.BrandID = BrandID;
        this.fk_category_id = fk_category_id;
        this.UpdateDescription = UpdateDescription;
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

    public int getProductDetailID() {
        return ProductDetailID;
    }

    public void setProductDetailID(int ProductDetailID) {
        this.ProductDetailID = ProductDetailID;
    }

    public boolean isProductStatus() {
        return ProductStatus;
    }

    public void setProductStatus(boolean ProductStatus) {
        this.ProductStatus = ProductStatus;
    }

    public String getProductImageUrl() {
        return ProductImageUrl;
    }

    public void setProductImageUrl(String ProductImageUrl) {
        this.ProductImageUrl = ProductImageUrl;
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
