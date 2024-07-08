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
        System.out.println(dao.getAll().size());
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
                        rs.getInt(5),
                        rs.getDate(4)
                );
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
                        rs.getInt(5),
                        rs.getDate(4));
                caList.add(category);
            }
        } catch (Exception e) {
        }
        return caList;
    }

    public Categories getCategoryById(int cateId) {
        Categories category = new Categories();
        String sql = "select * from Categories WHERE CategoryID = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cateId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                category = new Categories(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(5),
                        rs.getDate(4));
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
