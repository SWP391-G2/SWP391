/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import Dal.VoucherDAO;
import Models.Vouchers;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hatru
 */
public class VourcherController extends HttpServlet {

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
            out.println("<title>Servlet VourcherController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VourcherController at " + request.getContextPath() + "</h1>");
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
        String voucher = request.getParameter("voucher");
        String delete = request.getParameter("delete");
        String totalprice = request.getParameter("totalprice");
        VoucherDAO dao = new VoucherDAO();
        HttpSession session = request.getSession();
        if (delete == null) {
            Vouchers vou = dao.getVourcherByCode(voucher);

            if (vou != null) {
                //request.setAttribute("discount", discount);
                session.setAttribute("dis", vou);
                //response.sendRedirect("checkout");
                request.setAttribute("totalprice", totalprice);
                request.getRequestDispatcher("checkout").forward(request, response);
            } else {
                request.setAttribute("error", "error");
                request.setAttribute("totalprice", totalprice);
                request.getRequestDispatcher("checkout").forward(request, response);
                //response.sendRedirect("checkout");
            }
        } else {
            session.invalidate();
            request.setAttribute("totalprice", totalprice);
            request.getRequestDispatcher("checkout").forward(request, response);
        }

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
