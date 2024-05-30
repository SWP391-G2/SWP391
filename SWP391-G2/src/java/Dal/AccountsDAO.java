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

    //get All customer in database
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

    public Accounts getAccountFull(String email, String pass) {

        String sql = "select * from Accounts where email=?";
        //chay lenhj truy van
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, email);
            ur.setString(2, pass);
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

    //get All customer by roleID
    public List<Accounts> getAllCustomer(int roleID) {
        List<Accounts> listAccount = new ArrayList();
        String sql = "select * from Accounts where RoleID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, roleID);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Accounts account = new Accounts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getByte(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getByte(11), rs.getString(12), rs.getInt(13));
                listAccount.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAccount;
    }

    //get All customer by Name
    public List<Accounts> getCustomerByName(String name, int id) {
        List<Accounts> listAccount = new ArrayList();
        String sql = "select * from Accounts where LastName like ? and RoleID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, "%" + name + "%");
            ur.setInt(2, id);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Accounts account = new Accounts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getByte(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getByte(11), rs.getString(12), rs.getInt(13));
                listAccount.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAccount;
    }

    //Block Account
    public void blockAccount(int accountID) {
        String sql = "UPDATE Accounts\n"
                + "SET Status = 0\n"
                + "WHERE AccountID = ?;";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, accountID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Unblock Account
    public void unblockAccount(int accountID) {
        String sql = "UPDATE Accounts\n"
                + "SET Status = 1\n"
                + "WHERE AccountID = ?;";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, accountID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        AccountsDAO d = new AccountsDAO();
        /*for (Accounts a : d.getAll()) {
            System.out.println(a.getAccountID());
        }
        System.out.println(d.getAccount("admin@gmail.com").getPassword());*/
 /*List<Accounts> list = d.getAllCustomer(1);
        for (Accounts accounts : list) {
            System.out.println( accounts.getFirstName());
        }*/

 /*List<Accounts> list = d.getCustomerByName("Trung", 4);
        for (Accounts accounts : list) {
            System.out.println(accounts.getFirstName() + accounts.getLastName());
        }*/
        
    }
}
