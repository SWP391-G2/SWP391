/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Accounts;
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
                        rs.getInt("BrandID"),
                        rs.getString("BrandName"),
                        rs.getString("Description"),
                        rs.getInt("status")
                );
                brands.add(brand);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return brands;
    }
    
    public ArrayList<Brands> getBrandByFilter(int status, String search, int pageNo, int pageSize) {
        ArrayList<Brands> listBrands = new ArrayList<>();
        String sql = "SELECT * FROM Brands";
        boolean whereAdded = false; // A flag to track whether "WHERE" has been added to the SQL query.
        if (status != -1 || !search.isEmpty()) {
            sql += " WHERE";
            if (status != -1) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " status = ?";
                whereAdded = true;
            }
            if (!search.isEmpty()) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " (Description LIKE ? OR BrandName LIKE ?)";
            }
        }

        sql += " ORDER BY BrandID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            int parameterIndex = 1; // Start with the first parameter index
            if (status != -1) {
                ur.setInt(parameterIndex, status);
                parameterIndex++;
            }
            if (!search.isEmpty()) {
                for (int i = 0; i < 2; i++) {
                    ur.setString(parameterIndex, "%" + search + "%");
                    parameterIndex++;
                }
            }
            // Set the limit and offset parameters for pagination
            ur.setInt(parameterIndex, (pageNo - 1) * pageSize);
            parameterIndex++;
            ur.setInt(parameterIndex, pageSize);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
               Brands brand = new Brands(
                        rs.getInt("BrandID"),
                        rs.getString("BrandName"),
                        rs.getString("Description"),
                        rs.getInt("status")
                );
                listBrands.add(brand);
            }
        } catch (Exception e) {
        }

        return listBrands;
    }

    public int getTotalPage(int status, String search, int pageSize) {
        String sql = "SELECT COUNT(*) FROM Brands";
        boolean whereAdded = false; // A flag to track whether "WHERE" has been added to the SQL query.
        if (status != -1 || !search.isEmpty()) {
            sql += " WHERE";
            if (status != -1) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " status = ?";
                whereAdded = true;
            }
            if (!search.isEmpty()) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " (Description LIKE ? OR BrandName LIKE ?)";
            }
        }

        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            int parameterIndex = 1; // Start with the first parameter index
            if (status != -1) {
                ur.setInt(parameterIndex, status);
                parameterIndex++;
            }
            if (!search.isEmpty()) {
                for (int i = 0; i < 2; i++) {
                    ur.setString(parameterIndex, "%" + search + "%");
                    parameterIndex++;
                }
            }
            ResultSet rs = ur.executeQuery();
            if (rs.next()) {
                int totalRecord = rs.getInt(1);
                int totalPage = totalRecord / pageSize;
                if (totalRecord % pageSize != 0) {
                    totalPage++;
                }
                return totalPage;
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public void updateStatusBrand( int status, int brandID){
         String sql = "UPDATE Brands\n"
                + "SET Status = ?\n"
                + "WHERE BrandID = ?;";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, status);
            ur.setInt(2, brandID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        BrandsDAO brdao = new BrandsDAO();
//        List<Brands> brands = brdao.getBrands();
//        for (Brands brand : brands) {
//            System.out.println(brand.getBrandID() + " " + brand.getBrandName() + " " + brand.getBrandDescription());
//        }
//        int number = brdao.getTotalPage(1, "", 10);
//        System.out.println(number);
//        List<Brands> list = brdao.getBrandByFilter(1, "", 1, 6);
//        for (Brands brands : list) {
//            System.out.println(brands.getBrandID() + brands.getBrandName());
//        }
        
        List<Brands> list = brdao.getBrands();
        for (Brands brands : list) {
            System.out.println(brands.toString());
        }
    }
}
