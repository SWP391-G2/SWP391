/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.FeedBacks;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class FeedbackDAO extends DBContext {

    public void insertFeedback(int idAccount,int idProduct,int star,String content,String image,Date date,int status,String reply) {
           String sql = "INSERT INTO [dbo].[Feedbacks] "
                   + "([fbAccountID], [fbProductID], [fbStar], [fbContent], [fbImage], [fbDate], [fbStatus], [reply]) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idAccount);
            st.setInt(2, idProduct);
            st.setInt(3, star);
            st.setString(4, content);
            st.setString(5, image);
            st.setDate(6, (Date)date);
            st.setInt(7, status);
            st.setString(8, reply);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    public List<FeedBacks> getListFeedback(int id){
        List<FeedBacks> list = new ArrayList<>();
        String sql = "select * from Feedbacks fb join Accounts a on fb.fbAccountID = a.AccountID where fb.fbProductID = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new FeedBacks(
                        rs.getInt("fbAccountID"),
                        rs.getInt("fbProductID"),
                        rs.getInt("fbStar"),
                        rs.getString("fbContent"),
                        rs.getString("fbImage"),
                        rs.getDate("fbDate"),
                        rs.getInt("fbStatus"), 
                        rs.getString("reply")));
            }
        }catch (SQLException e){
            
        }
        return list;
    }
    public FeedBacks getFeedback(int id){      
        String sql = "select * from Feedbacks where fbProductID = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return  new FeedBacks(
                        rs.getInt("fbAccountID"),
                        rs.getInt("fbProductID"),
                        rs.getInt("fbStar"),
                        rs.getString("fbContent"),
                        rs.getString("fbImage"),
                        rs.getDate("fbDate"),
                        rs.getInt("fbStatus"), 
                        rs.getString("reply"));
            }
        }catch (SQLException e){
            
        }
        return null;
    }
}
