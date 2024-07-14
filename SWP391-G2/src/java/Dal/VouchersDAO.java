/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Vouchers;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class VouchersDAO extends DBContext{
    
    public Vouchers getVoucherById(int id){
        String sql ="select * from Vouchers where VoucherID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Vouchers(
                        rs.getInt(1), 
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getDate(4), 
                        rs.getDate(5), 
                        rs.getInt(6), 
                        rs.getDate(7),
                        rs.getInt(8));
            }
            
        }catch (SQLException e) {

        }
        return null;
    }
    
    
    public ArrayList<Vouchers> getVouchersByFilter(int status, String search, int pageNo, int pageSize) {
        ArrayList<Vouchers> listVoucher = new ArrayList<>();
        String sql = "SELECT * FROM Vouchers";
        boolean whereAdded = false; // A flag to track whether "WHERE" has been added to the SQL query.
        if (status != -1 || !search.isEmpty()) {
            sql += " WHERE";
            if (status != -1) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " Status = ?";
                whereAdded = true;
            }
            if (!search.isEmpty()) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " (Code LIKE ? OR Discount LIKE ? )";
            }
        }

        sql += " ORDER BY VoucherID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
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
                Vouchers voucher = new Vouchers(
                        rs.getInt(1), 
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getDate(4), 
                        rs.getDate(5), 
                        rs.getInt(6), 
                        rs.getDate(7),
                        rs.getInt(8)
                );
                        
                listVoucher.add(voucher);
            }
        } catch (Exception e) {
        }

        return listVoucher;
    }
    public void updateStatusVoucher(int status, int categoryID) {
        String sql = "UPDATE [dbo].[Vouchers]\n"
                + "   SET [Status] = ?\n"
                + " WHERE [VoucherID] = ?;";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, status);
            ur.setInt(2, categoryID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public int getTotalPage(int status, String search, int pageSize) {
        String sql = "SELECT COUNT(*) FROM Vouchers";
        boolean whereAdded = false; // A flag to track whether "WHERE" has been added to the SQL query.
        if (status != -1 || !search.isEmpty()) {
            sql += " WHERE";
            if (status != -1) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " Status = ?";
                whereAdded = true;
            }
            if (!search.isEmpty()) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " (Code LIKE ? OR Discount LIKE ?)";
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
}
