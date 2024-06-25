/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Products;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

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
        String sql = "SELECT TOP " + number + " * FROM Products WHERE CategoryID <> 4 ORDER BY NEWID()";
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
    // List Products by Category

    public List<Products> getProductsByCategory(int categoryid) {
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM Products";
        if (categoryid != 0) {
            sql += " WHERE CategoryID = ?";
        } else {
            sql += " WHERE 0 = ?";
        }
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
            e.printStackTrace();
        }
        return products;
    }
    
    //List Products by Brand
    public List<Products> getProductsByBrand(int brandid){
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM Products";
        if (brandid != 0) {
            sql += " WHERE BrandID = ?";
        } else {
            sql += " WHERE 0 = ?";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, brandid);
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
            e.printStackTrace();
        }
        return products;
    }

    //Search by check box BrandID
    public List<Products> searchByCheckboxBrand(int[] brandid) {
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE 1=1 ";
        if ((brandid != null) && (brandid[0] != 0)) {
            sql += " AND BrandID in(";
            for (int i = 0; i < brandid.length; i++) {
                sql += brandid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
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
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    
    //Search by check box CategoryID
    public List<Products> searchByCheckbox(int[] categoryid) {
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE 1=1 ";
        if ((categoryid != null) && (categoryid[0] != 0)) {
            sql += " AND CategoryID in(";
            for (int i = 0; i < categoryid.length; i++) {
                sql += categoryid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
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
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    //Search by name 
    public List<Products> searchByName(String text){
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM Products "
                + " WHERE ProductName LIKE ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
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
            e.printStackTrace();
        }
        return products;
    }
    
    // Get list product by page
    public List<Products> getListByPage(List<Products> list, int start, int end) {
        ArrayList<Products> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        ProductsDAO Pdao = new ProductsDAO();
//        int categoryId = 1; // example category ID
//        List<Products> products = Pdao.getProductsByCategory(categoryId);
//        products.forEach(product -> System.out.println("Product ID: " + product.getProductID()
//                + ", Name: " + product.getProductName()));
        List<Products> products = Pdao.getProductsByBrand(1);
        for (Products product : products) {
            System.out.println(product.getProductName());
        }
    }

}
