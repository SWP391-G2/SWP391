/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import Models.Products;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.Categories;
import Models.SubCategories;

/**
 *
 * @author ROG
 */
public class ProductsDAO extends DBContext {
    public Products getProduct(int id) {
        String sql = "select * from Products where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Products(
                        rs.getInt("ProductID"),               
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID"),
                        rs.getInt("fk_category_id"),
                        rs.getString("UpdateDescription")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Products> getProductSimilar(int id) {
        List<Products> p = new ArrayList<>();
        String sql = "select * from Products where BrandID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p.add(new Products(
                        rs.getInt("ProductID"),               
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID"),
                        rs.getInt("fk_category_id"),
                        rs.getString("UpdateDescription")
                ));
            }

        } catch (SQLException e) {

        }
        return p;
    }
    public List<Products> loadProducts() {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt("ProductID"),               
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID"),
                        rs.getInt("fk_category_id"),
                        rs.getString("UpdateDescription")
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
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID"),
                        rs.getInt("fk_category_id"),
                        rs.getString("UpdateDescription")
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

    // List Products of Men
    public List<Products> getProductMen() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products ";
        return list;
    }

    // List Products of Women
    public List<Products> getProductWomen() {
        List<Products> list = new ArrayList<>();
        String sql = "";
        return list;
    }

    // List Products of Unisex
    public List<Products> getProductUnisex() {
        List<Products> list = new ArrayList<>();
        String sql = "";
        return list;
    }

    // List Products by Category
    public List<Products> getProductsByCategory(int categoryid) {
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM Products p "
                + " JOIN SubCategories sc ON p.SubCategoryID = sc.SubCategoryID "
                + " JOIN Categories c ON sc.CategoryID = c.CategoryID "
                + " WHERE c.CategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products product = new Products(
                        rs.getInt("ProductID"),               
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID"),
                        rs.getInt("fk_category_id"),
                        rs.getString("UpdateDescription")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    // List Products by SubCategory
    public List<Products> getProductBySubCategory(int subcategoryid) {
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM Products p"
                + "JOIN SubCategories sc ON p.SubCategoryID = sc.SubCategoryID"
                + "WHERE sc.SubCategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subcategoryid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products product = new Products(
                        rs.getInt("ProductID"),               
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID"),
                        rs.getInt("fk_category_id"),
                        rs.getString("UpdateDescription")
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
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductDetailID"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("OrderID"),
                        rs.getInt("fbID"),
                        rs.getInt("BrandID"),
                        rs.getInt("fk_category_id"),
                        rs.getString("UpdateDescription")
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
        System.out.println(p.getProductImageUrl());

        System.out.println(Pdao.getCount());
        int categoryId = 1; // example category ID
        List<Products> products = Pdao.getProductsByCategory(categoryId);
        products.forEach(product -> System.out.println("Product ID: " + product.getProductID()
                + ", Name: " + product.getProductName()));
    }

}
