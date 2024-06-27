/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
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
                        rs.getInt("pdProductID"),
                        rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductSize"),
                        rs.getFloat("ProductPrice"),
                        rs.getInt("ProductAvaiable"),
                        rs.getString("image")));
            }

        } catch (SQLException e) {

        }
        return list;
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

    //get Product details by ProductId and size
    public int getProductDetailID(int pdID, String size) {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "select * from ProductFullDetail where pdProductID = ? and ProductSize like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pdID);
            st.setString(2, size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductDetail p = new ProductDetail(
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt("pdProductID"), rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductSize"),
                        rs.getFloat("ProductPrice"),
                        rs.getInt("ProductAvaiable"),
                        rs.getString("image"));
                return p.getProductFullDetailID();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public ProductDetail getInforProductDetail(int pdID) {

        String sql = "select * from ProductFullDetail where ProductFullDetailID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, pdID);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                ProductDetail p = new ProductDetail(
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt("pdProductID"), rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductSize"),
                        rs.getFloat("ProductPrice"),
                        rs.getInt("ProductAvaiable"),
                        rs.getString("image"));
                return p;
            }

        } catch (SQLException e) {

        }
        return null;
    }

    public void insetCart(int pdID, int accountID, int quantity, double totalPrice) {
        String sql = "insert into Cart(ProductFullDetailID, AccountID, Quantity, TotalPrice) \n"
                + "values (?,?,?,?);";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, pdID);
            ur.setInt(2, accountID);
            ur.setInt(3, quantity);
            ur.setDouble(4, totalPrice);

            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateMinusAvaiableProductDetail(int avaiable, int pdID) {
        String sql = "UPDATE ProductFullDetail set ProductAvaiable = ? -1 where ProductFullDetailID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, avaiable);
            ur.setInt(2, pdID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateAddAvaiableProductDetail(int avaiable, int pdID) {
        String sql = "UPDATE ProductFullDetail set ProductAvaiable = ? +1 where ProductFullDetailID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, avaiable);
            ur.setInt(2, pdID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<ProductDetail> listCart() {
        List<ProductDetail> list = new ArrayList<>();

        return list;
    }

    public List<ProductDetail> getAll() {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "select * from ProductFullDetail ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetail(
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt("pdProductID"),
                        rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductSize"),
                        rs.getFloat("ProductPrice"),
                        rs.getInt("ProductAvaiable"),
                        rs.getString("image")));
            }

        } catch (SQLException e) {

        }
        return list;
    }

    public static void main(String[] args) {
        ProductDetailDAO p = new ProductDetailDAO();
//        List<ProductDetail> list = p.getPriceAllowSize(1);
//        for( ProductDetail product : list){
//            System.out.println(product.getProductPrice());
//        }
//            ProductDetail product = p.getProductDetailByIdAndSize(1, "100ml");
//            System.out.println(product.getProductPrice());
        //p.insetCart(2, 2, 6, 200);
        p.updateMinusAvaiableProductDetail(100, 2);
    }
}
