/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Brands;
import Models.ImageDetail;
import Models.Products;
import Models.ProductDetail;
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

    public ProductDetail getProductDetail(int id) {
        String sql = "select * from Products p join ProductFullDetail pfd \n"
                + "on p.ProductID = pfd.ProductFullDetailID \n"
                + "where p.ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new ProductDetail(rs.getInt(1), rs.getString("ProductName"),
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt("pdProductID"), rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"), rs.getString("ProductSize"),
                        rs.getFloat("ProductPrice"), rs.getInt("ProductAvaiable"),
                        rs.getString("ProductImageUrl"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

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
                list.add(new ProductDetail(rs.getInt(rs.getInt("ProductID")), rs.getString("ProductName"),
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt(1), rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"), rs.getString("ProductSize"),
                        rs.getFloat("ProductPrice"), rs.getInt("ProductAvaiable"),
                        rs.getString("ProductImageUrl")));
            }

        } catch (SQLException e) {

        }
        return list;
    }

    public Brands getBrand(int id) {
        String sql = "select * from Products p join Brands b on"
                + " p.BrandID = b.BrandID where p.ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Brands(1, rs.getInt("BrandID"),
                        rs.getString("BrandName"),
                        rs.getString("Description"));
            }
        } catch (SQLException e) {

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

    public static void main(String[] args) {
        ProductDetailDAO p = new ProductDetailDAO();
        List<ProductDetail> list = p.getPriceAllowSize(1);
        for( ProductDetail product : list){
            System.out.println(product.getProductPrice());
        }
    }
}
