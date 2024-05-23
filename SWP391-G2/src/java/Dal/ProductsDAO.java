/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Categories;
import Models.Products;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ROG
 */
public class ProductsDAO extends DBContext {

    String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Products> loadProduct() {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt("ProductID"),
                        rs.getInt("SubCategoryID"),
                        rs.getString("ProductName"),
                        rs.getString("ProductDetail"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getInt("ProductImageID"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getFloat("ProductPrice")
                ));
            }

        } catch (SQLException e) {
            status = "Error at read Products " + e.getMessage();
        }
        return pro;
    }

    
    public List<Products> loadProductbyID() {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt("ProductID"),
                        rs.getInt("SubCategoryID"),
                        rs.getString("ProductName"),
                        rs.getString("ProductDetail"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getInt("ProductImageID"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getFloat("ProductPrice")
                ));
            }

        } catch (SQLException e) {
            status = "Error at read Products " + e.getMessage();
        }
        return pro;
    }

    
    public List<Products> loadProductOderBypIDcID() {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products "
                + "order by CategoryID, ProductID asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt("ProductID"),
                        rs.getInt("SubCategoryID"),
                        rs.getString("ProductName"),
                        rs.getString("ProductDetail"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getInt("ProductImageID"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getFloat("ProductPrice")
                ));
            }

        } catch (SQLException e) {
            status = "Error at read Products " + e.getMessage();
        }
        return pro;
    }

    public static void main(String[] args) {
        ProductsDAO dao = new ProductsDAO();
        List<Products> list = dao.loadProductbyID();
        System.out.println(list.size());
//        List<Categories> list = dao.loadCategory();
//        System.out.println(list.size());
    }

    public List<Categories> loadCategory() {
        List<Categories> cate = new ArrayList<>();
        String sql = """
                     SELECT  [CategoryID]
                           ,[CategoryName]
                           ,[Description]
                       FROM [DEMO].[dbo].[Categories]
                     
                     """;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cate.add(new Categories(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3)
                ));
            }
        } catch (SQLException e) {

        }
        return cate;
    }

    public List<Products> loadProductByCID(int cid) {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products where CategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt("ProductID"),
                        rs.getInt("SubCategoryID"),
                        rs.getString("ProductName"),
                        rs.getString("ProductDetail"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getInt("ProductImageID"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getFloat("ProductPrice")
                ));
            }

        } catch (Exception e) {
            status = "Error at read Products " + e.getMessage();
        }
        return pro;
    }

}
