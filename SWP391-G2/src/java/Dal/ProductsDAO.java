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
               Products product = new Products(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("productImageUrl"),
                        rs.getInt("BrandID")
                );
               pro.add(product);               
            }

        } catch (SQLException e) {
             System.out.println(e);               
        }
        return pro;
    }
    //Top best seller 
    public List<Products> getTopBestSellers(String number) {
        List<Products> products = new ArrayList<>();
        String sql = "SELECT TOP " + number + " * FROM Products WHERE CategoryID <> 4 ORDER BY NEWID()" ;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Products product = new Products(
                         rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("productImageUrl"),
                        rs.getInt("BrandID")
                );
                products.add(product);
            }           
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }
 

    // List Products by Category
    public List<Products> getProductsByCategory(int categoryid) {
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products] "
                + " WHERE CategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products product = new Products(
                         rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("productImageUrl"),
                        rs.getInt("BrandID")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    //Get Product by ProductID
    public Products getProductByProductID(int id) {
        String sql = "select * from Products where ProductID=?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, id);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Products p = new Products(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("productImageUrl"),
                        rs.getInt("BrandID")
                );
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public static void main(String[] args) {
        ProductsDAO Pdao = new ProductsDAO();
        /*System.out.println(Pdao.loadProducts().size());
        System.out.println(Pdao.getPaging(2).size());

        System.out.println(Pdao.getCount());*/
        Products p = Pdao.getProductByProductID(1);
        int categoryId = 1; // example category ID
        List<Products> products = Pdao.getProductsByCategory(categoryId);
        products.forEach(product -> System.out.println("Product ID: " + product.getProductID()
                + ", Name: " + product.getProductName()));
    }

}
