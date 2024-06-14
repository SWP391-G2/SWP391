/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import Models.SubCategories;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ROG
 */
public class SubCategoriesDAO extends DBContext {
    public List<SubCategories> getAllSubCategories() {
    List<SubCategories> subCate = new ArrayList<>();
    String sql = "SELECT * FROM [dbo].[SubCategories]";
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            SubCategories subcategory = new SubCategories(
                    rs.getInt("SubCategoryID"),
                    rs.getString("SubCategoryName"),
                    rs.getInt("CategoryID")
            );
            subCate.add(subcategory);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return subCate;
}


        public static void main(String[] args) {
            SubCategoriesDAO dao = new SubCategoriesDAO();
        List<SubCategories> subcategories = dao.getAllSubCategories();
        for (SubCategories subcategory : subcategories) {
            System.out.println("SubCategory ID: " + subcategory.getSubCategoryID());
            System.out.println("SubCategory Name: " + subcategory.getSubCategoryName());
            System.out.println("Category ID: " + subcategory.getCategoryID());
        }
    }
    }

