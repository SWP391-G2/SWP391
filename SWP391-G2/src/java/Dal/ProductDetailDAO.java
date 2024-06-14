/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import Models.Brands;
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
                list.add( new ProductDetail(
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt("pdProductID"), 
                        rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"), 
                        rs.getString("ProductSize"),
                        rs.getFloat("ProductPrice"),
                        rs.getInt("ProductAvaiable"),
                        rs.getString("image")
                ));
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
                        rs.getInt("pdProductID"), 
                        rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"), 
                        rs.getString("ProductSize"),
                        rs.getFloat("ProductPrice"),
                        rs.getInt("ProductAvaiable"),
                        rs.getString("image")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDetailDAO p = new ProductDetailDAO();
        List<ProductDetail> list = p.getPriceAllowSize(1);
        for( ProductDetail product : list){
            System.out.println(product.getProductAvaiable());
        }
    }
}
