/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Categories;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ROG
 */
public class CategoriesDAO extends DBContext{
    
     public static void main(String[] args) {
         CategoriesDAO c = new CategoriesDAO();
  
        List<Categories> list = c.loadCategory();
        System.out.println(list.size());
    }

    public List<Categories> loadCategory() {
        List<Categories> cate = new ArrayList<>();
        String sql = """
                     SELECT  [CategoryID]
                           ,[CategoryName]
                           ,[Description]
                       FROM [DEMO].[dbo].[Categories]
                     
                     """;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cate.add(new Categories(
                        rs.getInt("CategoryID"),
                        rs.getString("CategoryName"),
                        rs.getString("Description")
                ));
            }
        } catch (SQLException e) {

        }
        return cate;
    }
}
