/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import Models.Categories;
import Models.SubCategories;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ROG
 */
public class CategoriesDAO extends DBContext {

    public static void main(String[] args) {
        CategoriesDAO dao = new CategoriesDAO();
        List<Categories> categories = dao.loadCategory();
        for (Categories category : categories) {
            System.out.println("Category ID: " + category.getCategoryID());
            System.out.println("Category Name: " + category.getCategoryName());
            System.out.println("Category Description: " + category.getDescription());
        }

    }
     public void updateCategory(String name, String description, int status, int categoryId){
        String sql = "Update Brands set CategoryName= ?, Description = ? , status = ? where CategoryID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
           ur.setString(1, name);
           ur.setString(2, description);
           ur.setInt(3, status);
           ur.setInt(4, categoryId);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public List<Categories> loadCategory() {
        List<Categories> categories = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Categories]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categories category = new Categories(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("Description"),
                        rs.getInt("status")
                );
                categories.add(category);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categories;
    }

    public ArrayList<Categories> getCategoriesByFilter(int status, String search, int pageNo, int pageSize) {
        ArrayList<Categories> listCategory = new ArrayList<>();
        String sql = "SELECT * FROM Categories";
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
                sql += " (Description LIKE ? OR CategoryName LIKE ?)";
            }
        }

        sql += " ORDER BY CategoryID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
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
                Categories category = new Categories(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("Description"),
                        rs.getInt("status"));
                listCategory.add(category);
            }
        } catch (Exception e) {
        }

        return listCategory;
    }

    public int getTotalPage(int status, String search, int pageSize) {
        String sql = "SELECT COUNT(*) FROM Categories";
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
                sql += " (Description LIKE ? OR CategoryName LIKE ?)";
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

    public void updateStatusCategory(int status, int categoryID) {
        String sql = "UPDATE [dbo].[Categories]\n"
                + "   SET [status] = ?\n"
                + " WHERE [CategoryID] = ?;";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, status);
            ur.setInt(2, categoryID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Categories getCategoryById(int id) {
        String sql = "select * from Categories where CategoryID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Categories(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("Description"),
                        rs.getInt("status"));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void insertCategory(String name, String description, int status) {
        String sql = "INSERT INTO [dbo].[Categories]\n"
                + "           ([CategoryName]\n"
                + "           ,[Description]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setInt(3, status);
            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
}
