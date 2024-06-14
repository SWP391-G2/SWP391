/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import Models.Sliders;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nguye
 */
public class SliderDAO extends DBContext {
    
    public List<Sliders> getAll() {
        List<Sliders> slider = new ArrayList<>();
        String sql = "select * from Sliders";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                slider.add(new Sliders(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getBoolean(3),
                        rs.getString(4)
                ));
            }
            
        } catch (SQLException e) {
            
        }
        return slider;
    }
    public static void main(String[] args) {
        SliderDAO Sdao = new SliderDAO();
        for (Sliders s : Sdao.getAll()) {
            System.out.println(s.getSliderID());
        }
    }
}
