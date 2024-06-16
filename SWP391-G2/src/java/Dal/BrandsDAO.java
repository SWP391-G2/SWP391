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
                        rs.getInt(4)
                );
                brands.add(brand);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return brands;
    }

    public List<Brands> getAll() {
        List<Brands> list = new ArrayList<>();
        Brands brand = new Brands();
        String sql = "SELECT * FROM [dbo].[Brands] Where status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                brand = new Brands(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)
                );
                list.add(brand);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }
    
    public List<String> getAllName(){
         List<String> list = new ArrayList<>();
        
        String sql = "SELECT BrandName FROM [dbo].[Brands] Where status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               String brand = rs.getString(1);
                list.add(brand);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }
    public static void main(String[] args) {
        BrandsDAO brdao = new BrandsDAO();
        List<Brands> brands = brdao.getBrands();
        for (Brands brand : brands) {
            System.out.println(brand.getBrandID() + " " + brand.getBrandName() + " " + brand.getBrandDescription());
        }
        List<String> s = brdao.getAllName();
        for (String string : s) {
            System.out.println(string);
        }
        System.out.println(brdao.getAll().size());
    }
}
