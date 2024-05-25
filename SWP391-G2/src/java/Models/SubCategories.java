/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ROG
 */
public class SubCategories {
    private int subCategoryID;
    private  String subCategoryName;
    private int categoryID;

    public SubCategories(int subCategoryID, String subCategoryName, int categoryID) {
        this.subCategoryID = subCategoryID;
        this.subCategoryName = subCategoryName;
        this.categoryID = categoryID;
    }

    public SubCategories() {
    }

    public int getSubCategoryID() {
        return subCategoryID;
    }

    public void setSubCategoryID(int subCategoryID) {
        this.subCategoryID = subCategoryID;
    }

    public String getSubCategoryName() {
        return subCategoryName;
    }

    public void setSubCategoryName(String subCategoryName) {
        this.subCategoryName = subCategoryName;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
    
    
}
