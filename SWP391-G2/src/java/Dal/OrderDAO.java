/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Brands;
import Models.Orders;
import context.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hatru
 */
public class OrderDAO extends DBContext {

    public int getSumRevenue() {
        String sql = "select SUM(OrderTotalPrice) from Orders";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
     public int getSumQuantitySold() {
        String sql = "select SUM(odQuantity) from OrderDetail";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }


    public void insertOrder(Orders order) {
        String sql = "INSERT INTO Orders(AccountID, OrderDate, OrderTotalPrice, OrderContactName, OrderPhone, OrderAddress, OrderReceiveDate,OrderNote, OrderSoID, VoucherID)\n"
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, order.getAccountID());
            ur.setDate(2, (Date) order.getOrderDate());
            ur.setFloat(3, order.getOrderTotalPrice());
            ur.setString(4, order.getOrderContactName());
            ur.setString(5, order.getOrderPhone());
            ur.setString(6, order.getOrderAddress());
            ur.setDate(7, (Date) order.getOrderReceiveDate());
            ur.setString(8, order.getOrderNote());
            ur.setInt(9, order.getOrderSoID());
            ur.setInt(10, order.getVoucherID());
            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public List<Orders> getListOrder() {
        List<Orders> listOrder = new ArrayList<>();
        String sql = "select * from Orders";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Orders order = new Orders(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDate(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11));
                listOrder.add(order);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return listOrder;
    }

    public ArrayList<Orders> getBrandByFilter(int status, String search, int pageNo, int pageSize) {
        ArrayList<Orders> listOrder = new ArrayList<>();
        String sql = "select * from Orders";
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
                sql += " (OrderAddress like ? or OrderContactName like ? or OrderNote like ? or OrderPhone like ?)";
            }
        }

        sql += " ORDER BY OrderID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
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
                Orders order = new Orders(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDate(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11));
                listOrder.add(order);

            }
        } catch (Exception e) {
        }

        return listOrder;
    }

    public int getTotalPage(int status, String search, int pageSize) {
        String sql = "SELECT COUNT(*) FROM Orders";
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
                sql += " (OrderAddress like ? or OrderContactName like ? or OrderNote like ? or OrderPhone like ?)";
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

    public int getOrderID() {
        String sql = "SELECT TOP 1 * FROM Orders ORDER BY OrderID DESC;";
        int orderID = -1;
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                orderID = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return orderID;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
//        LocalDate orderDate = LocalDate.of(2024, 7, 2);
//        LocalDate recieveDate = LocalDate.of(2024, 7, 5);
//
//        Date sqlOrderDate = Date.valueOf(orderDate);
//        Date sqlRecieveDate = Date.valueOf(recieveDate);
//        Orders order = new Orders(1, sqlOrderDate, 3600, "0944362986", "Ha Trung", "Thanh Ba - Phu Tho", sqlRecieveDate, "Hang de vo", 1, 2);
//        dao.insertOrder(order);
        List<Orders> list = dao.getListOrder();
        for (Orders orders : list) {
            System.out.println(orders.toString());
        }
        System.out.println(dao.getSumQuantitySold());
    }
}
