/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.List;
import Dal.ProductsDAO;

public class Categories {

    private int categoryID;
    private String categoryName;
    private String description;

    public Categories() {
    }

    public Categories(int categoryID, String categoryName, String description) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.description = description;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTotalProduct() {
        int total = 0;
        ProductsDAO p = new ProductsDAO();
        List<Products> list = p.getProductsByCategory(this.categoryID);
        for (int i = 0; i < list.size(); i++) {
            total += 1;
        }
        return total;
    }

}
