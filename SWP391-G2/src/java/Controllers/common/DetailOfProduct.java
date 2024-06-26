/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.common;
import Dal.ProductDetailDAO;
import Dal.ProductsDAO;
import Models.Brands;
import Models.ImageDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import Models.ProductDetail;
import Models.Products;
/**
 *
 * @author admin
 */
public class DetailOfProduct extends HttpServlet {
   
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
            out.println("<title>Servlet ProductDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetail at " + request.getContextPath () + "</h1>");
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
        String id_raw = request.getParameter("product");
        int id = -1;
        try {
            id = 2;
        } catch (NumberFormatException e) {
            System.out.println("");
        }
        ProductDetailDAO pdtDAO = new ProductDetailDAO();

        //ProductsDAO pDAO = new ProductsDAO();
        //BrandsDAO bDAO = new BrandsDAO();
        //ProductDetailImagesDAO pdiDAO = new ProductDetailImagesDAO();

        ProductDetail pd = pdtDAO.getProductDetail(id);
        //Products p = pDAO.getProduct(id);
        //Brands brand = bDAO.getBrand(p.getBrandID());
        //List<ProductDetailImage> imgdt =pdiDAO.getListImageDetail(id);
        List<ProductDetail> priceandsize = pdtDAO.getPriceAllowSize(id);
        //request.setAttribute("psimilar", psimilar);
        request.setAttribute("priceandsize", priceandsize);
        //request.setAttribute("imgdt", imgdt);

        //request.setAttribute("b", brand);
        request.setAttribute("pd", pd);
        //request.setAttribute("p", p);



        request.getRequestDispatcher("productDetail.jsp").forward(request, response);
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
        processRequest(request, response);
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
