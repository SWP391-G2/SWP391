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
        String sql = "SELECT * FROM [dbo].[Brands] WHERE status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Brands brand = new Brands(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getInt(5));
                brands.add(brand);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
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
                        rs.getDate(4),
                        rs.getInt(5));
                list.add(brand);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

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
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getInt(5));
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

    public void updateStatusBrand(int status, int brandID) {
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

    public void insertBrand(String brandName, String brandDescription) {
        String sql = "insert into Brands(BrandName, Description, status) values (?,?,1);";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, brandName);
            ur.setString(2, brandDescription);
            ur.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<String> getAllName() {
        List<String> list = new ArrayList<>();

        String sql = "SELECT BrandName FROM [dbo].[Brands] Where status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String brand = rs.getString(1);
                list.add(brand);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public Brands getBrandById(int brandID) {
        String sql = "select * from Brands where BrandID = ? AND  status = 1";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, brandID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Brands brand = new Brands(
                         rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getInt(5));
                return brand;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateBrand(String name, String description, int status, int brandID) {
        String sql = "Update Brands set BrandName= ?, Description = ? , status = ? where BrandID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, name);
            ur.setString(2, description);
            ur.setInt(3, status);
            ur.setInt(4, brandID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
     public static void main(String[] args) {
     BrandsDAO brandDAO = new BrandsDAO();
     List<Brands> list = brandDAO.getAll();
         for (Brands brands : list) {
             System.out.println(brands.getBrandName());
         }
     }

}

