/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.marketing;

import Dal.VouchersDAO;
import Models.Vouchers;
import jakarta.el.ELException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class VoucherManager extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VoucherManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VoucherManager at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int status_new = -1;
        int voucherID = -1;

        try {
            status_new = request.getParameter("statusnew") == null ? -1 : Integer.parseInt(request.getParameter("statusnew"));
            voucherID = request.getParameter("voucherID") == null ? -1 : Integer.parseInt(request.getParameter("voucherID"));
        } catch (Exception e) {
        }

        if (status_new != -1) {
            VouchersDAO voucherDAO = new VouchersDAO();
            voucherDAO.updateStatusVoucher(status_new, voucherID);
        }
        String search = "";
        int status = -1;
        int pageNo = 1;
        final int pageSize = 10;
        try {
            search = request.getParameter("search") == null ? "" : request.getParameter("search");
            status = request.getParameter("status") == null ? -1 : Integer.parseInt(request.getParameter("status"));
            pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));

        } catch (Exception e) {
        }
        String startStr = request.getParameter("start");
        String endStr = request.getParameter("end");
        Date start_raw = null;
        Date end = null;

        try {
            if (startStr != null && !startStr.isEmpty()) {
              String start = String.valueOf( Date.valueOf(startStr));
            }
            if (endStr != null && !endStr.isEmpty()) {
                end = Date.valueOf(endStr);
            }

        } catch (ELException e) {

        }

        VouchersDAO voucherDAO = new VouchersDAO();
        List<Vouchers> listvoucher = voucherDAO.getVouchersByFilter(status, search, pageNo, pageSize, start, end);
        int totalPage = voucherDAO.getTotalPage(status, search, pageSize);

        request.setAttribute("search", search);
        request.setAttribute("status", status);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", pageNo);
        request.setAttribute("listvoucher", listvoucher);

        request.getRequestDispatcher("voucher/manageVouchers.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int status_new = -1;
        int voucherID = -1;
        String statusnew = request.getParameter("statusnew");
        String quantity_raw = request.getParameter("quantity");
        String code = request.getParameter("voucherName");
        String discounts = request.getParameter("discount");
        String StartDate = request.getParameter("startDate");
        String EndDate = request.getParameter("endDate");
        try {
            int status = Integer.parseInt(statusnew);
            int discount = Integer.parseInt(discounts);
            int quantity = Integer.parseInt(quantity_raw);
            Date create = new Date(System.currentTimeMillis());
            Date start = Date.valueOf(StartDate);
            Date end = Date.valueOf(EndDate);
            VouchersDAO voucherDAO = new VouchersDAO();
            voucherDAO.InsertVoucher(code, discount, end, start, quantity, create, status);
        } catch (Exception e) {

        }
        try {
            status_new = request.getParameter("statusnew") == null ? -1 : Integer.parseInt(request.getParameter("statusnew"));
            voucherID = request.getParameter("voucherID") == null ? -1 : Integer.parseInt(request.getParameter("voucherID"));
        } catch (Exception e) {
        }

        if (status_new != -1) {
            VouchersDAO voucherDAO = new VouchersDAO();
            voucherDAO.updateStatusVoucher(status_new, voucherID);
        }
        String search = "";
        int status = -1;
        int pageNo = 1;
        final int pageSize = 10;
        String startStr = request.getParameter("start");
        String endStr = request.getParameter("end");
        Date start = null;
        Date end = null;

        try {
            if (startStr != null && !startStr.isEmpty()) {
                start = Date.valueOf(startStr);
            }
            if (endStr != null && !endStr.isEmpty()) {
                end = Date.valueOf(endStr);
            }

        } catch (ELException e) {

        }
        try {
            search = request.getParameter("search") == null ? "" : request.getParameter("search");
            status = request.getParameter("status") == null ? -1 : Integer.parseInt(request.getParameter("status"));
            pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));

        } catch (Exception e) {
        }

        VouchersDAO voucherDAO = new VouchersDAO();
        List<Vouchers> listvoucher = voucherDAO.getVouchersByFilter(status, search, pageNo, pageSize,start,end);
        int totalPage = voucherDAO.getTotalPage(status, search, pageSize);

        request.setAttribute("search", search);
        request.setAttribute("status", status);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", pageNo);
        request.setAttribute("listvoucher", listvoucher);

        request.getRequestDispatcher("voucher/manageVouchers.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
