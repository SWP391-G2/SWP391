/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.maketing;

import Dal.CategoriesDAO;
import Models.Categories;
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
public class CategoryController extends HttpServlet {

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
        int categoryID = -1;
        try {
            status_new = request.getParameter("statusnew") == null ? -1 : Integer.parseInt(request.getParameter("statusnew"));
            categoryID = request.getParameter("categoryID") == null ? -1 : Integer.parseInt(request.getParameter("categoryID"));
        } catch (Exception e) {
        }

        if (status_new != -1) {
            CategoriesDAO categoryDAO = new CategoriesDAO();
            categoryDAO.updateStatusCategory(status_new, categoryID);
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

        CategoriesDAO categoryDAO = new CategoriesDAO();
        List<Categories> listcategory = categoryDAO.getCategoriesByFilter(status, search, pageNo, pageSize);
        int totalPage = categoryDAO.getTotalPage(status, search, pageSize);

        request.setAttribute("search", search);
        request.setAttribute("status", status);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", pageNo);
        request.setAttribute("listcategory", listcategory);

        request.getRequestDispatcher("category/managerCategory.jsp").forward(request, response);

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
        String categorieName = request.getParameter("name");
        String categorieDescription = request.getParameter("description");
        CategoriesDAO cDAO = new CategoriesDAO();

        cDAO.insertCategory(categorieName, categorieDescription, 1);

        request.getRequestDispatcher("category").forward(request, response);
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