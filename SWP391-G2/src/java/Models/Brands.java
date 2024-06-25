/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import Dal.ProductsDAO;
import java.util.List;

/**
 *
 * @author admin
 */
public class Brands {

    private int BrandID;
    private String BrandName;
    private String BrandDescription;

    public Brands() {
    }

    public Brands(int BrandID, String BrandName, String BrandDescription) {
        this.BrandID = BrandID;
        this.BrandName = BrandName;
        this.BrandDescription = BrandDescription;
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

    public int getTotalProductBrand() {
        int total = 0;
        ProductsDAO p = new ProductsDAO();
        List<Products> list = p.getProductsByBrand(this.BrandID);
        for (int i = 0; i < list.size(); i++) {
            total += 1;
        }
        return total;
    }

}
