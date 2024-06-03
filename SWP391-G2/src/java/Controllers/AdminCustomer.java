/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Dal.AccountsDAO;
import Models.Accounts;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hatru
 */
public class AdminCustomer extends HttpServlet {

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
            out.println("<title>Servlet AdminCustomer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminCustomer at " + request.getContextPath() + "</h1>");
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
        // processRequest(request, response);
        String roleID = request.getParameter("roleID");
        List<Accounts> list = new ArrayList();
        AccountsDAO accountDAO = new AccountsDAO();
        List<Accounts> listAccount = new ArrayList<>();
        int id = -1;
        try {
            id = Integer.parseInt(roleID);
            //AccountsDAO accountDAO = new AccountsDAO();
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        switch (id) {
            case 1:
                request.getRequestDispatcher("admin.jsp").forward(request, response);
                break;
            case 2:
                listAccount = accountDAO.getAllCustomer(2);
                break;
            case 3:
                listAccount = accountDAO.getAllCustomer(3);

                break;
            case 4:
                listAccount = accountDAO.getAllCustomer(4);

                break;
            default:
                request.getRequestDispatcher("/admincustomer");
        }
        request.setAttribute("roleID", id);
        request.setAttribute("listaccount", listAccount);
        request.getRequestDispatcher("admincustomer.jsp").forward(request, response);

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
        //processRequest(request, response);
        String name = request.getParameter("searchname");
        AccountsDAO dao = new AccountsDAO();
        List<Accounts> listSearch = new ArrayList();

        String roleid = (String) request.getParameter("roleID");
        int id = -1;
        try {
            id = Integer.parseInt(roleid);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        listSearch = dao.getCustomerByName(name, id);
        if(listSearch.isEmpty()) {
            request.setAttribute("result", "Not found account! Please enter again! ");
            request.getRequestDispatcher("admincustomer.jsp").forward(request, response);
        }
        request.setAttribute("listsearch", listSearch);
        request.setAttribute("roleID", id);
        request.getRequestDispatcher("admincustomer.jsp").forward(request, response);
    }

    /**
     * s
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
