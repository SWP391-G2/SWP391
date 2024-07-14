/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.marketing;

import Dal.VouchersDAO;
import Models.Vouchers;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
public class UpdateVoucher extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateVoucher</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateVoucher at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
   
        int voucherID = -1;
        
        try {
            voucherID = request.getParameter("voucherID") == null ? -1 : Integer.parseInt(request.getParameter("voucherID"));
            
        } catch (Exception e) {
        }
         String search = "";
        int status = -1;
        int pageNo = 1;
        final int pageSize = 10;
        try{
            
        }catch(Exception e){
            search = request.getParameter("search") == null ? "" : request.getParameter("search");
            status = request.getParameter("status") == null ? -1 : Integer.parseInt(request.getParameter("status"));
             pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
        }

        VouchersDAO voucherDAO = new VouchersDAO();
        Vouchers voucher = voucherDAO.getVoucherById(voucherID);
         int totalPage = voucherDAO.getTotalPage(status, search, pageSize);
          request.setAttribute("search", search);
        request.setAttribute("status", status);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", pageNo);
        request.setAttribute("voucher", voucher);

        request.getRequestDispatcher("voucher/update-mange-vouchers.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
