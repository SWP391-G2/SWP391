/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;


import Models.Accounts;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nguye
 */
public class AccountsDAO extends DBContext{
     public List<Accounts> getAll() {
        List<Accounts> list = new ArrayList<>();
        String sql = "select * from Accounts";
        //chay lenhj truy van
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {

               Accounts account = new Accounts(rs.getInt("userID"), rs.getString("lastName"), rs.getString("firstName"), rs.getString("password"), rs.getString("image"), rs.getByte("gender"), rs.getString("birthday"), rs.getString("phone"), rs.getString("email"), rs.getString("address"), rs.getInt("status"), rs.getString("createDate"), rs.getInt("role"));
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
       public Accounts getAccount(String email) {

        String sql = "select * from Accounts where email=?";
        //chay lenhj truy van
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1,email);
            ResultSet rs = ur.executeQuery();
            if (rs.next()) {

                Accounts account = new Accounts(rs.getInt("userID"), rs.getString("lastName"), rs.getString("firstName"), rs.getString("password"), rs.getString("image"), rs.getByte("gender"), rs.getString("birthday"), rs.getString("phone"), rs.getString("email"), rs.getString("address"), rs.getInt("status"), rs.getString("createDate"), rs.getInt("role"));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        AccountsDAO d = new AccountsDAO();
        for (Accounts u : d.getAll()) {
            System.out.println(u.getEmail());
        }
        System.out.println(d.getAccount("123@gmail.com").getLastName());
    }
}
