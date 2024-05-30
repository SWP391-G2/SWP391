/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Accounts;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
                Accounts account = new Accounts(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getBoolean(11),
                        rs.getDate(12),
                        rs.getInt(13));
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
                Accounts account = new Accounts(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getBoolean(11),
                        rs.getDate(12),
                        rs.getInt(13));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Accounts getAccountFull(String email, String pass) {

        String sql = "select * from Accounts where email=?";
        //chay lenhj truy van
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, email);
            ur.setString(2, pass);
            ResultSet rs = ur.executeQuery();
            if (rs.next()) {
                Accounts account = new Accounts(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getBoolean(11),
                        rs.getDate(12),
                        rs.getInt(13));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void setInsert(Accounts account) {
        String sql = "INSERT INTO [dbo].[Accounts] ([FirstName],[LastName],[Email],[Password],[Image],[Gender],[BirthDay],[Phone],[Address],[CreateDate],[RoleID],[Status]) VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";
        try {
            
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, account.getFirstName());
            ur.setString(2, account.getLastName());
            ur.setString(3, account.getEmail());
            ur.setString(4, account.getPassword());
            ur.setString(5, account.getImage());
            ur.setBoolean(6, account.isGender());
            ur.setDate(7, (Date) account.getBirthday());
            ur.setString(8, account.getPhone());
            ur.setString(9, account.getAddress());
            ur.setDate(10, (Date) account.getCreateDate());
            ur.setInt(11, account.getRole());
            ur.setBoolean(12, account.isStatus());
            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public static void main(String[] args) {
        AccountsDAO d = new AccountsDAO();
        Date date = new Date(System.currentTimeMillis());
        Accounts er = new Accounts("sd", "sd", "sd", "sd", true, date, "sd", "sd",
                "sd", true, date, 0);
        d.setInsert(new Accounts(
                "d",
                "sd",
                "sd",
                "sd",
                true,
                date,
                "sd",
                "sd",
                "sd",
                true,
                date,
                1));
        
        for (Accounts a : d.getAll()) {
            System.out.println(a.getAccountID());
        }
        System.out.println(d.getAccount("123@gmail.com").getPassword());

    }
}
