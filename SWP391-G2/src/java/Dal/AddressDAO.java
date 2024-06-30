/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Address;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ROG
 */
public class AddressDAO  extends DBContext{
     public List<Address> getAllAddress(int account_id) {
        List<Address> list = new ArrayList<>();
        String sql = "select * from Address where account_id=?";
        //chay lenhj truy van
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, account_id);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Address address = new Address(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
                list.add(address);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     
     public Address getAdress(int account_id) {

        String sql = "select * from Address where address_id=?";
        //chay lenhj truy van
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, account_id);
            ResultSet rs = ur.executeQuery();
            if (rs.next()) {
                 Address address = new Address(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
                return address;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
      public void updateAddress( String phone, String address_line, String city, String district, int status) {
        String sql = "Update Address set address_id = ?,phone = ?, address_line= ?, city= ?, district=?, status=? where account_id = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, phone);
            ur.setString(2, address_line);
            ur.setString(3, city);
            ur.setString(4, district);
            ur.setInt(5, status);

            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
      public void setInsertAddress(Address address) {
        String sql = "INSERT INTO [dbo].[Address] ([account_id],[phone],[address_line],[city],[district],[status]) VALUES (?,?,?,?,?,?);";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, address.getAccount_id());
            ur.setString(2, address.getPhone());
            ur.setString(3, address.getAddress_line());
            ur.setString(4, address.getCity());
            ur.setString(5, address.getDistrict());
            ur.setInt(6, address.getStatus());
            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
      public static void main(String[] args) {
        AddressDAO addressdao = new AddressDAO();
        Address address = new Address();
        address.setAccount_id(11);
        address.setPhone("0975375262");
        address.setAddress_line("nha 24");
        address.setCity("ha noi");
        address.setDistrict("Nam Tu Liem");
        address.setStatus(1);
        addressdao.setInsertAddress(address);
          
        
        
    }
      
}
