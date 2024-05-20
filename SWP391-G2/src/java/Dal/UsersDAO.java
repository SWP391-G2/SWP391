/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Users;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nguye
 */
public class UsersDAO extends DBContext {

    public List<Users> getAll() {
        List<Users> list = new ArrayList<>();
        String sql = "select * from Users";
        //chay lenhj truy van
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {

                Users account = new Users(rs.getInt("userID"), rs.getString("lastName"), rs.getString("firstName"), rs.getString("password"), rs.getString("image"), rs.getByte("gender"), rs.getString("dob"), rs.getString("phone"), rs.getString("email"), rs.getString("address"), rs.getInt("status"), rs.getString("createDate"), rs.getInt("role"));
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Users getAccount(String email) {

        String sql = "select * from Users where email=?";
        //chay lenhj truy van
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1,email);
            ResultSet rs = ur.executeQuery();
            if (rs.next()) {

                Users account = new Users(rs.getInt("userID"), rs.getString("lastName"), rs.getString("firstName"), rs.getString("password"), rs.getString("image"), rs.getByte("gender"), rs.getString("dob"), rs.getString("phone"), rs.getString("email"), rs.getString("address"), rs.getInt("status"), rs.getString("createDate"), rs.getInt("role"));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        UsersDAO d = new UsersDAO();
        for (Users u : d.getAll()) {
            System.out.println(u.getEmail());
        }
        System.out.println(d.getAccount("admin@gmail.com").getLastName());
    }

}
