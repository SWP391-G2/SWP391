/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.Brands;
/**
 *
 * @author pna29
 */
public class BrandsDAO extends DBContext {
    public List<Brands> getBrands(){
    List<Brands> brands = new ArrayList<>();
    String sql = "SELECT * FROM [dbo].[Brands]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Brands brand = new Brands(
                        rs.getInt("BrandID"),
                        rs.getString("BrandName"),
                        rs.getString("Description")
                );
                brands.add(brand);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    return brands;
    }   
   public static void main (String[] args){
       BrandsDAO brdao = new BrandsDAO();
       List<Brands> brands = brdao.getBrands();
       for(Brands brand : brands){
           System.out.println(brand.getBrandID()+ " " + brand.getBrandName() + " " + brand.getBrandDescription());
       }
   }
}
