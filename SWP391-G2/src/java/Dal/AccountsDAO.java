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
public class AccountsDAO extends DBContext {

    public List<Accounts> getAll() {
        List<Accounts> list = new ArrayList<>();
        String sql = "select * from Accounts";
        //chay lenhj truy van
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Accounts account = new Accounts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getByte(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getByte(11), rs.getString(12), rs.getInt(13));
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
            ur.setString(1, email);
            ResultSet rs = ur.executeQuery();
            if (rs.next()) {
                Accounts account = new Accounts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getByte(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getByte(11), rs.getString(12), rs.getInt(13));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        AccountsDAO d = new AccountsDAO();
        for (Accounts a : d.getAll()) {
            System.out.println(a.getAccountID());
        }
        System.out.println(d.getAccount("admin@gmail.com").getPassword());
    }
}
