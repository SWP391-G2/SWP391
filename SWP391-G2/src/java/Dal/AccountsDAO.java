/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import Models.Accounts;
import java.sql.Date;
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
                Accounts account = new Accounts(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getInt(11));
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
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getInt(11));
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
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getInt(11));
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
            ur.setInt(6, account.getGender());
            ur.setDate(7, (Date) account.getBirthDay());
            ur.setDate(8, (Date) account.getCreateDate());
            ur.setInt(9, account.getRoleID());
            ur.setInt(10, account.getStatus());
            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }    //get All customer by roleID

    public List<Accounts> getAllCustomer(int roleID) {
        List<Accounts> listAccount = new ArrayList();
        String sql = "select * from Accounts where RoleID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, roleID);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Accounts account = new Accounts(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getInt(11));
                listAccount.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAccount;
    }

    //get All customer by Name and roleID
    public List<Accounts> getCustomerByName(String name, int id) {
        List<Accounts> listAccount = new ArrayList();
        String sql = "select * from Accounts where LastName like ? and RoleID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, "%" + name + "%");
            ur.setInt(2, id);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Accounts account = new Accounts(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getInt(11));
                listAccount.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAccount;
    }

    //Block Account
    public void updateStatusAccount(int status, int accountID) {
        String sql = "UPDATE Accounts\n"
                + "SET Status = ?\n"
                + "WHERE AccountID = ?;";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, status);
            ur.setInt(2, accountID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //get Image by accountID
    public static List<Accounts> listImage = new ArrayList<>();

    public Accounts getAccoutByID(int id) {
        String sql = "select * from Accounts where AccountID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, id);
            ResultSet rs = ur.executeQuery();
            if (rs.next()) {
                Accounts account = new Accounts(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getInt(11));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //Update 
    public int update(Accounts account) {
        for (int i = 0; i < listImage.size(); i++) {
            if (listImage.get(i).getAccountID() == account.getAccountID()) {
                listImage.set(i, account);
                return i;
            }
        }
        return -1;
    }

    public int save(Accounts account) {
        listImage.add(account);
        return 1;
    }

    //get number of account 
    public int getTotalAccountByRoleID(int roleID) {
        String sql = "select COUNT(*) from Accounts where RoleID=?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, roleID);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Accounts> pagingAccount(int roleID, int index) {
        List<Accounts> list = new ArrayList<>();
        String sql = "select * From Accounts where RoleID = ?\n"
                + "Order by AccountID\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, roleID);
            ur.setInt(2, (index - 1) * 6);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Accounts account = new Accounts(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getInt(11));
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Insert new acocunt for sale/marketing
    public void setInsertAccount(Accounts account) {
        String sql = "INSERT INTO [dbo].[Accounts] ([FirstName],[LastName],[Password],[Image],[Gender],[BirthDay],[Email],[Status],[CreateDate],[RoleID]) VALUES (?,?,?,?,?,?,?,?,?,?);";
        try {

            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, account.getFirstName());
            ur.setString(2, account.getLastName());
            ur.setString(3, account.getPassword());
            ur.setString(4, account.getImage());
            ur.setInt(5, account.getGender());
            ur.setDate(6, (Date) account.getBirthDay());
            ur.setString(7, account.getEmail());
            ur.setInt(8, account.getStatus());
            ur.setDate(9, (Date) account.getCreateDate());
            ur.setInt(10, account.getRoleID());
            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public int getLastID() {
        String sql = "select MAX(AccountID) from Accounts";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public ArrayList<Accounts> getListAdminByFilter(int roleId, int status, String search, int pageNo, int pageSize) {
        ArrayList<Accounts> listAccount = new ArrayList<>();
        String sql = "SELECT * FROM Accounts";
        boolean whereAdded = false; // A flag to track whether "WHERE" has been added to the SQL query.
        if (roleId != -1 || status != -1 || !search.isEmpty()) {
            sql += " WHERE";
            if (roleId != -1) {
                sql += " RoleID = ?";
                whereAdded = true;
            }

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
                sql += " (FirstName LIKE ? OR LastName LIKE ?  OR Email LIKE ?)";
            }
        }

        sql += " ORDER BY AccountID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            int parameterIndex = 1; // Start with the first parameter index
            if (roleId != -1) {
                ur.setInt(parameterIndex, roleId);
                parameterIndex++;
            }
            if (status != -1) {
                ur.setInt(parameterIndex, status);
                parameterIndex++;
            }
            if (!search.isEmpty()) {
                for (int i = 0; i < 3; i++) {
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
                Accounts account = new Accounts(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getDate(10),
                        rs.getInt(11));
                listAccount.add(account);
            }
        } catch (Exception e) {
        }

        return listAccount;
    }

    public int getTotalPage(int roleId, int status, String search, int pageSize) {
        String sql = "SELECT COUNT(*) FROM Accounts";
        boolean whereAdded = false; // A flag to track whether "WHERE" has been added to the SQL query.
        if (roleId != -1 || status != -1 || !search.isEmpty()) {
            sql += " WHERE";
            if (roleId != -1) {
                sql += " RoleID = ?";
                whereAdded = true;
            }
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
                sql += " (FirstName LIKE ? OR LastName LIKE ? OR Email LIKE ?)";
            }
        }

        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            int parameterIndex = 1; // Start with the first parameter index
            if (roleId != -1) {
                ur.setInt(parameterIndex, roleId);
                parameterIndex++;
            }
            if (status != -1) {
                ur.setInt(parameterIndex, status);
                parameterIndex++;
            }
            if (!search.isEmpty()) {
                for (int i = 0; i < 3; i++) {
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

    public void updateAccount(int status, int roleID, String image, int accountID) {
        String sql = "Update Accounts set Status = ?, RoleID = ?,Image = ? where AccountID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, status);
            ur.setInt(2, roleID);
            ur.setString(3, image);
            ur.setInt(4, accountID);

            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        AccountsDAO a = new AccountsDAO();
        
        
    }
}
