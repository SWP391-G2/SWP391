/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Brands {
    private int ProductID;
    private int BrandID;
    private String BrandName;
    private String BrandDescription;

    public Brands() {
    }

    public Brands(int ProductID, int BrandID, String BrandName, String BrandDescription) {
        this.ProductID = ProductID;
        this.BrandID = BrandID;
        this.BrandName = BrandName;
        this.BrandDescription = BrandDescription;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public String getBrandName() {
        return BrandName;
    }

    public void setBrandName(String BrandName) {
        this.BrandName = BrandName;
    }

    public String getBrandDescription() {
        return BrandDescription;
    }

    public void setBrandDescription(String BrandDescription) {
        this.BrandDescription = BrandDescription;
    }

        
}
