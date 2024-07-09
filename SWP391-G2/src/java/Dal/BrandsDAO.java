/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.Brands;

/**
 *
 * @author pna29
 */
public class BrandsDAO extends DBContext {

    public List<Brands> getBrands() {
        List<Brands> brands = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Brands]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Brands brand = new Brands(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(5),
                        rs.getInt(6)
                );
                brands.add(brand);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return brands;
    }

    public Brands getBrandById(int id) {
        String sql = "select * from Brands where BrandID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Brands(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(5),
                        rs.getInt(6)
                );
            }
        } catch (SQLException e) {

        }
        return null;
    }
}
