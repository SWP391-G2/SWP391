/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Vouchers;
import context.DBContext;
import controller.customer.VourcherController;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author hatru
 */
public class VoucherDAO extends DBContext {


    public Vouchers getVoucher() {
        String sql = "select * from Vouchers";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Vouchers voucher = new Vouchers(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getDate(4),
                        rs.getInt(5),
                        rs.getDate(6)
                );
                return voucher;
            }

        } catch (Exception e) {

        }
        return null;
    }

    public Vouchers getVourcherByCode(String code) {
        String sql = "select * from Vouchers where Code = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Vouchers voucher = new Vouchers(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getDate(4),
                        rs.getInt(5),
                        rs.getDate(6)
                );
                return voucher;
            }

        } catch (Exception e) {

        }
        return null;
    }

    public static void main(String[] args) {
        VoucherDAO dao = new VoucherDAO();
        Vouchers voucher = dao.getVourcherByCode("NEWYEAR2024");
        System.out.println(voucher.getCode());
    }
}
