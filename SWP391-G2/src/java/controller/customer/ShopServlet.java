/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import Dal.CategoriesDAO;
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
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 *
 * @author hatru
 */
public class ShopServlet extends HttpServlet {

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
            out.println("<title>Servlet ShopServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopServlet at " + request.getContextPath() + "</h1>");
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
        ProductDetailDAO d = new ProductDetailDAO();
        List<ProductDetail> list = d.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt = URLDecoder.decode(o.getValue(), StandardCharsets.UTF_8.toString());
                }
            }
        }

        Cart cart = new Cart(txt, list);
       
        //response.getWriter().print(cart.getItems().get(0).getName());
        
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("common/cartcookie.jsp").forward(request, response);
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
        ProductDetailDAO dao = new ProductDetailDAO();
        List<ProductDetail> list = dao.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Cart cart = new Cart(txt, list);
        String add = request.getParameter("add");
        String minus = request.getParameter("minus");
        String id_raw = request.getParameter("pdID");
        String deletecard = request.getParameter("deletecard");
//        response.getWriter().print(num_raw);
//        response.getWriter().print(id_raw);
        String name = request.getParameter("name");
        int id, addnum,minusnum = -2;
        try {
            id = Integer.parseInt(id_raw);
            ProductDetail p = dao.getProductDetail(id);
            int numstock = p.getProductAvaiable();
            addnum = Integer.parseInt(add);
            minusnum = Integer.parseInt(minus);
            if (minusnum == -1 && (cart.getQuantityById(id) <= 1)) {
                cart.removeItem(id);
            } 
            if(deletecard != null){
                cart.removeItem(id);
            }
            else {
                if (addnum == 1 && cart.getQuantityById(id) >= numstock) {
                    addnum = 0;
                }
                //BigDecimal price = p.getProductPrice();
                Item t = new Item(p, addnum, name);
                cart.addItem(t);
            }
        } catch (NumberFormatException e) {

        }
        List<Item> items = cart.getItems();
        txt = "";
        if (items.size() > 0) {
            txt = items.get(0).getProduct().getProductFullDetailID()+ ":"
                    + items.get(0).getQuantity()+ ":"
                     + items.get(0).getName();
            for (int i = 1; i < items.size(); i++) {
                txt += "," + items.get(i).getProduct().getProductFullDetailID() + ":"
                        + items.get(i).getQuantity() + ":" + items.get(i).getName();
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(15 * 24 * 60 * 60);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("common/cartcookie.jsp").forward(request, response);
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
