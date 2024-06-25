/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Brands;
import Models.ImageDetail;
import Models.Products;
import Models.ProductDetail;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ProductDetailDAO extends DBContext {

    public List<ProductDetail> getPriceAllowSize(int id) {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "select * from Products p join ProductFullDetail pfd \n"
                + "                 on p.ProductID = pfd.ProductFullDetailID \n"
                + "                 where pfd.pdProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetail(
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt("pdProductID"), rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductSize"),
                        rs.getBigDecimal("ProductPrice"),
                        rs.getInt("ProductAvaiable")));
            }

        } catch (SQLException e) {

        }
        return list;
    }

    //Get Price by Size
    public BigDecimal getProductPriceBySize(int productId, String size) {
        String sql = "SELECT pfd.ProductPrice "
                + "FROM dbo.ProductFullDetail pfd "
                + "JOIN dbo.Products p ON p.ProductID = pfd.pdProductID "
                + "WHERE p.ProductID = ? AND pfd.ProductSize = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ps.setString(2, size);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getBigDecimal("ProductPrice");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; 

    }

    public List<ImageDetail> getListImageDetail(int id) {
        List<ImageDetail> list = new ArrayList<>();
        String sql = "select * from  ProductDetailImages where ProductFullDetailID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new ImageDetail(rs.getInt("ImageID"), 1,
                        rs.getString("ImageUrl")));
            }

        } catch (SQLException e) {

        }
        return list;
    }

    public ProductDetail getProductDetail(int id) {
        String sql = "select * from ProductFullDetail where pdProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new ProductDetail(
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt("pdProductID"), rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductSize"),
                        rs.getBigDecimal("ProductPrice"),
                        rs.getInt("ProductAvaiable"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDetailDAO p = new ProductDetailDAO();
        List<ProductDetail> list = p.getPriceAllowSize(2);
        for (ProductDetail product : list) {
            System.out.println(product.getProductPrice());
        }
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();


        int productId = 1; 
        String size = "30ml"; 
        BigDecimal productPrice = productDetailDAO.getProductPriceBySize(productId, size);

        if (productPrice != null) {
            System.out.println("Product Price for Product ID " + productId + " and Size " + size + ": " + productPrice);
        } else {
            System.out.println("Product not found for Product ID " + productId + " and Size " + size);
        }
    }
}
