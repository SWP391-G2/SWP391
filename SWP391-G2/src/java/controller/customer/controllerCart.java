/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import Dal.CartsDAO;
import Dal.ProductDetailDAO;
import Models.Carts;
import Models.ProductDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.nio.file.Files.list;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hatru
 */
public class controllerCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *

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
            out.println("<title>Servlet controllerCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controllerCart at " + request.getContextPath() + "</h1>");

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
// 
//               ProductDetailDAO pdDao = new ProductDetailDAO();
//        Cookie[] arr = request.getCookies();
//        String txt = "";
//        if(arr != null){
//            for (Cookie o : arr) {
//                if(o.getName().equals("cart")){
//                    txt+=o.getValue();
//                }
//            }
//        }
//       String pdID = request.getParameter("productID");
//       String quantity = request.getParameter("Quantity");
//        String price = request.getParameter("Price");
//        String size = request.getParameter("size");
//      int productID = 3;
//
//        double price = 100.5;
//        int accountID = 9;
//        int quantity1 = 10;
//       double totalPrice = quantity1 * price;
//       ProductDetailDAO pdDAO = new ProductDetailDAO();
//       pdDAO.insetCart(productID, accountID, quantity1, totalPrice);

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
