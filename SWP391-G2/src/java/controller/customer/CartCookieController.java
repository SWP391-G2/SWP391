/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import Dal.ProductDetailDAO;
import Models.Cart;
import Models.ProductDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.lang.IllegalArgumentException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 *
 * @author hatru
 */
public class CartCookieController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

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

        /*
        ProductDetailDAO d = new ProductDetailDAO();
        List<ProductDetail> list = d.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        HttpSession session = request.getSession();
        int totalQuantity = 0;

// Retrieve the current cart content from cookies
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        
        Cart cart = new Cart(txt, list);
        List<Item> listItem = cart.getItems();
        int n;
        if(listItem != null){
            n = listItem.size();
        }
        else{
            n=0;
        }
        
        
        
          String pdtID_raw = request.getParameter("pdtID");
        String addquantity_raw = request.getParameter("quantity");
        String productName_raw = request.getParameter("name");
        String deletecart_raw = request.getParameter("deletecard");
         */
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt = URLDecoder.decode(o.getValue(), StandardCharsets.UTF_8.toString());
                    o.setMaxAge(0);
                }
            }
        }
        String quantity_raw = request.getParameter("quantity");
        String pdID = request.getParameter("productfulldetailid");
        String name = request.getParameter("productname");
        if (txt.isEmpty()) {
            txt = pdID + ":" + quantity_raw + ":" + name;
        } else {
            txt += "," + pdID + ":" + quantity_raw + ":" + name;
        }
        txt = URLEncoder.encode(txt, StandardCharsets.UTF_8.toString());
        Cookie cookie = new Cookie("cart", txt);
        cookie.setMaxAge(60000);
        response.addCookie(cookie);
        request.getRequestDispatcher("shop").forward(request, response);
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
