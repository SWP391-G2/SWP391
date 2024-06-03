/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;


import Models.Products;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import Models.Categories;
import Models.SubCategories;

/**
 *
 * @author ROG
 */
public class ProductsDAO extends DBContext {
    
    public List<Products> loadProducts() {
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
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("productImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID")
                ));
            }

        } catch (SQLException e) {

        }
        return pro;
    }

    public List<Products> getPaging(int index) {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products order by productID OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY;";
        //chay lenhj truy van
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 12);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt("ProductID"),
                        rs.getInt("SubCategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("productImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID")
                ));
            }

        } catch (SQLException e) {

        }
        return pro;
    }

    public int getCount() {
        String sql = "Select count(*) from products";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);

            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }
    // List Products by Category
    public List<Products> getProductsByCategory(int category){
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] p " + 
                "JOIN [dbo].[SubCategories] sc ON p.SubCategoryID = sc.SubCategoryID" +
                "JOIN [dbo].[Categories] c ON sc.CategoryID = c.CategoryID" +
                "WHERE c.CategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, category);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Products product = new Products(
                        rs.getInt("ProductID"),
                        rs.getInt("SubCategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("productImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }
    // List Products by SubCategory
    public List<Products> getProductBySubCategory(int subcategory){
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] p" +
                "JOIN [dbo].[SubCategories] sc ON p.SubCategoryID = sc.SubCategoryID" +
                "WHERE sc.SubCategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subcategory);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Products product = new Products(
                        rs.getInt("ProductID"),
                        rs.getInt("SubCategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("productImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }
    // List Products
    public List<Products> getProductUnisex(){
        List<Products> list = new ArrayList<>();
        String sql = "";
        return list;
    }
    public static void main(String[] args) {
        ProductsDAO Pdao = new ProductsDAO();
        System.out.println(Pdao.loadProducts().size());
        System.out.println(Pdao.getPaging(2).size());
        System.out.println(Pdao.getCount());
    }

}
