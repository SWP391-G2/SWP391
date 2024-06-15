/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.marketing;

import Dal.CategoriesDAO;
import Dal.ProductsDAO;
import Models.Accounts;
import Models.Categories;
import Models.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author nguye
 */
public class MarketingManagerment extends HttpServlet {

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
            out.println("<title>Servlet MarketingManagerment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarketingManagerment at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Accounts a = (Accounts) session.getAttribute("account");
        if (a == null) {
            
        } else {
            int accountId = a.getAccountID();
        }
        String search = "";
        int cateId = -1;
        int status = -1;
        int pageNo = 1;
        int brandId = -1;
        final int pageSize = 10;
        try {
            search = request.getParameter("search") == null ? "" : request.getParameter("search");
            cateId = request.getParameter("cate") == null ? -1 : Integer.parseInt(request.getParameter("cate"));
            status = request.getParameter("status") == null ? -1 : Integer.parseInt(request.getParameter("status"));
            brandId = request.getParameter("brand") == null ? -1 : Integer.parseInt(request.getParameter("brand"));
            pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
        } catch (Exception e) {
        }

        //get list products and get total page of list by condition
        ProductsDAO pDao = new ProductsDAO();
        List<Products> listProducts = pDao.getListProductByFilter(cateId, status, search, brandId, pageNo, pageSize);
        int totalPage = pDao.getTotalPage(cateId, status, search, brandId, pageSize);

        //get categories Name
        CategoriesDAO cateDao = new CategoriesDAO();
        List<Categories> cateList = cateDao.getAll();
        
        
        request.setAttribute("search", search);
        request.setAttribute("cateID", cateId);
        request.setAttribute("status", status);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", pageNo);

        request.setAttribute("listCate", cateId);
        request.setAttribute("listProduct", listProducts);
        request.getRequestDispatcher("./marketing/marketing.jsp").forward(request, response);
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
        processRequest(request, response);
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
