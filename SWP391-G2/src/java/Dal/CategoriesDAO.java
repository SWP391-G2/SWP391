/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import Models.Categories;
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
public class CategoriesDAO extends DBContext {

    public static void main(String[] args) {
        CategoriesDAO dao = new CategoriesDAO();
        List<Categories> categories = dao.loadCategory();
        for (Categories category : categories) {
            System.out.println("Category ID: " + category.getCategoryID());
            System.out.println("Category Name: " + category.getCategoryName());
            System.out.println("Category Description: " + category.getDescription());
        }

    }

    public List<Categories> loadCategory() {
        List<Categories> categories = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Categories]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories category = new Categories(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("Description"),
                        rs.getInt("status")
                );
                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categories;
    }

    public Categories getCategoryById(int id) {
        String sql = "select * from Categories where CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Categories(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("Description"),
                        rs.getInt("status"));
            }
        }catch(SQLException e){
            
        }
        return null;
    }
}
