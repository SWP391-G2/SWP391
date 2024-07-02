/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import Models.Sliders;

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
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6)
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return slider;
    }

    public List<Sliders> getAllActiveSliders() {
        List<Sliders> slider = new ArrayList<>();
        String sql = "SELECT SliderID, SliderImage, SliderTitle, SliderStatus, UpdateAt, AccountID FROM Sliders WHERE SliderStatus = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                slider.add(new Sliders(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return slider;
    }

    //Get Slider by SliderID
       public Sliders getSliderById(int sliderID) {
        String sql = "SELECT SliderID, SliderImage, SliderTitle, SliderStatus, UpdateAt, AccountID FROM Sliders WHERE SliderID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, sliderID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Sliders slider = new Sliders(
                            rs.getInt("SliderID"),
                            rs.getString("SliderImage"),
                            rs.getInt("SliderStatus"),
                            rs.getString("SliderTitle"),
                            rs.getDate("UpdateAt"),
                            rs.getInt("AccountId")
                    );
                    return slider;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //INSERT SLIDER
    public void insertSlider(Sliders slider) {
        String sql = "INSERT INTO Sliders (SliderImage, SliderTitle, SliderStatus, UpdateAt, AccountID) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, slider.getSliderImage());
            preparedStatement.setString(2, slider.getSliderTitle());
            preparedStatement.setDate(3, new Date(slider.getUpdateAt().getTime()));
            preparedStatement.setInt(4, slider.getSliderStatus());
            preparedStatement.setInt(5, slider.getAccountId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //UPDATE SLIDER
    public void updateSlider(Sliders slider) {
        String sql = "UPDATE Sliders SET SliderImage = ?, SliderTitle = ?, update_at = ?, SliderStatus = ?, fk_account_id = ? WHERE SliderID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, slider.getSliderID());
            preparedStatement.setString(2, slider.getSliderImage());
            preparedStatement.setString(3, slider.getSliderTitle());
            preparedStatement.setDate(3, new Date(slider.getUpdateAt().getTime()));
            preparedStatement.setInt(5, slider.getSliderStatus());
            preparedStatement.setInt(6, slider.getAccountId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //DELETE SLIDER
    public void deleteSlider(int sliderID) {
        String sql = "DELETE FROM Sliders WHERE SliderID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, sliderID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        SliderDAO Sdao = new SliderDAO();
       
        
        int sliderID = 1; // Example sliderID
        Sliders slider = Sdao.getSliderById(sliderID);
        System.out.println(slider);

    }
}
