/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.common;

import Dal.BrandsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Dal.CategoriesDAO;
import Dal.ProductsDAO;
import Dal.SliderDAO;
import Models.Brands;
import Models.Categories;
import Models.ProductsHome;
import Models.Sliders;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author pna29
 */
public class HomeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        ProductsDAO productsDAO = new ProductsDAO();
        BrandsDAO brandsDAO = new BrandsDAO();
        SliderDAO sliDAO = new SliderDAO();

        List<Sliders> sliders = sliDAO.getAll();
        List<ProductsHome> productsMen = productsDAO.getProductsByCategory(1);
        List<ProductsHome> productsWomen = productsDAO.getProductsByCategory(2);
        List<ProductsHome> productsUnisex = productsDAO.getProductsByCategory(3);
        List<ProductsHome> giftSet = productsDAO.getProductsByCategory(4);
        List<ProductsHome> productsTop5Sellers = productsDAO.getTopBestSellers("5");
        List<Categories> categories = categoriesDAO.loadCategory();
        List<Brands> brands = brandsDAO.getBrands();

        HttpSession session = request.getSession();
        session.setAttribute("sliders", sliders);
        request.setAttribute("categories", categories);
        request.setAttribute("productsMen", productsMen);
        request.setAttribute("productsWomen", productsWomen);
        request.setAttribute("productsUnisex", productsUnisex);
        request.setAttribute("productGiftset", giftSet);
        request.setAttribute("productsTopSellers", productsTop5Sellers);
        request.setAttribute("brands", brands);
        request.getRequestDispatcher("common/home.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("common/home.jsp").forward(request, response);
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
