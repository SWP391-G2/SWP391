/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Carts;
import Models.ProductDetail;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hatru
 */
public class CartsDAO extends DBContext {

    public List<Carts> getAllCart() {
        List<Carts> list = new ArrayList<>();
        String sql = "select * from Cart";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);

            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Carts cart = new Carts(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDouble(5));
                list.add(cart);
            }

        } catch (SQLException e) {

        }
        return list;
    }

    public static void main(String[] args) {
        CartsDAO dao = new CartsDAO();
        List<Carts> list = dao.getAllCart();
        ProductDetailDAO pdDAO = new ProductDetailDAO();
        List<ProductDetail> listProductDetails = new ArrayList<>();
        List<Carts> listCart = dao.getAllCart();
        for (Carts carts : listCart) {
            ProductDetail p = pdDAO.listProdcutDetail(carts.getProductFullDetailID());
            listProductDetails.add(p);
            
        }
        for (ProductDetail listProductDetail : listProductDetails) {
            System.out.println(listProductDetail.toString());
        }
        
    }
}
