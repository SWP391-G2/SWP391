/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import Models.Categories;
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
        List<Categories> caList = dao.getAll();
        for (Categories string : caList) {
            System.out.println(string.getCategoryName());
        }
        for (String categories1 : dao.getAllName()) {
            System.out.println(categories1);
        }
        System.out.println("");
    }

    public List<Categories> loadCategory() {
        List<Categories> categories = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Categories]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories category = new Categories(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getInt(5));
                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categories;
    }

    public List<Categories> getAll() {
        List<Categories> caList = new ArrayList<>();
        Categories category = new Categories();
        String sql = "select * from Categories Where status = 1;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                category = new Categories(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getInt(5));
                caList.add(category);
            }
        } catch (Exception e) {
        }
        return caList;
    }

    public Categories getCategoryById(int cateId) {
        Categories category = new Categories();
        String sql = "select * from Categories WHERE CategoryID = ? AND status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cateId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                category = new Categories(
                      rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getInt(5));
                return category;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<String> getAllName() {
        List<String> caList = new ArrayList<>();
        String category = "";
        String sql = "select CategoryName from Categories Where status = 1;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                category = rs.getString(1);
                caList.add(category);
            }
        } catch (Exception e) {
        }
        return caList;
    }
}