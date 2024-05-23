/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ROG
 */
public class Categories {
    private int categoryID;
    private String categoryName;
    private int categoryStatus;

    public Categories() {
    }

    public Categories(int categoryID, String categoryName, int categoryStatus) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryStatus = categoryStatus;
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

    public int getCategoryStatus() {
        return categoryStatus;
    }

    public void setCategoryStatus(int categoryStatus) {
        this.categoryStatus = categoryStatus;
    }

  
}
