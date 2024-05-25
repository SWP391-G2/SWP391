/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;


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
public class SubCategoriesDAO extends DBContext{
       public List<SubCategories> loadSubCategory() {
        List<SubCategories> subC = new ArrayList<>();
        String sql = "select * from SubCategories";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                subC.add(new SubCategories(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3)
                ));
            }
        } catch (SQLException e) {

        }
        return subC;
    }
       public static void main(String[] args) {
           SubCategoriesDAO SubCdao = new SubCategoriesDAO();
           System.out.println(SubCdao.loadSubCategory().size());
    }
}
