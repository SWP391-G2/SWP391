/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.customer;

import Dal.ProductDetailDAO;
import Models.Cart;
import Models.Item;
import Models.ProductDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author hatru
 */
public class ShopServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ShopServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopServlet at " + request.getContextPath () + "</h1>");
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
         ProductDetailDAO d = new ProductDetailDAO();
        List<ProductDetail> list = d.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr!=null){
            for (Cookie o : arr) {
                if(o.getName().equals("cart")){
                    txt+=o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Cart cart = new Cart(txt, list);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("mycart.jsp").forward(request, response);
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
        ProductDetailDAO d = new ProductDetailDAO();
        List<ProductDetail> list = d.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr!=null){
            for (Cookie o : arr) {
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Cart cart = new Cart(txt, list);
//         <input type ="hidden"  value="${i.product.getProductFullDetailID()}" name="pdID"/>
//                                                <input type ="hidden" value="${i.product.getQuantity()}" name="quantity"/>
//                                                <input type ="hidden" value="${i.product.getProductAvaiable()}" name="avaiable"/> 
//                                                <input type ="hidden" value="" id="newquantity${loop.index}" name="newquantity"/>
        String quantity_raw = request.getParameter("num");
        String id_raw = request.getParameter("pdID");
        int id, quantity = 0;
        try {
            id = Integer.parseInt(id_raw);
            ProductDetail p = d.getProductDetail(id);
            int numStock = p.getProductAvaiable();
            quantity = Integer.parseInt(quantity_raw);
            if(quantity == -1 && cart.getQuantityById(id)<= 1){
                cart.removeItem(id);
            }
            else{
                if(quantity ==1 && cart.getQuantityById(id) >= numStock){
                    quantity = 0;
                }
                BigDecimal price = p.getProductPrice();
                Item t = new Item(p, quantity, p.getProductSize(), p.getProductPrice());
                cart.addItem(t);
            }
        } catch (NumberFormatException e) {
        }
        
        List<Item> items = cart.getItems();
        txt = "";
        if(items.size()>0){
            txt=items.get(0).getProduct().getProductFullDetailID()+":"+items.get(0).getQuantity();
            for (int i = 1; i < items.size(); i++) {
                txt+=","+items.get(i).getProduct().getProductFullDetailID()+":"+items.get(i).getQuantity();
            }
        }
        
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(15*24*60*60);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("mycart").forward(request, response);
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
