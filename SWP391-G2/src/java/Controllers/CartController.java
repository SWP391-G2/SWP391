/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Dal.ProductDetailDAO;
import Dal.ProductsDAO;
import Models.Cart;
import Models.Item;
import Models.ProductDetail;
import Models.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import org.apache.tomcat.jni.SSLContext;

/**
 *
 * @author hatru
 */
public class CartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final DecimalFormat decfor = new DecimalFormat("0.00");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        //window.location.href = "/SWP391-G2/cart?productID=" + productID + "&&quantity=" + quantity + "&&price=" + price;
        //window.location.href = "/SWP391-G2/cart?productID=" + productID + "&&quantity=" + quantity + "&&price=" + price+"&&size=" + size;
        //window.location.href = "/SWP391-G2/cart?productID=" + productID + "&&quantity=" + quantity + "&&price=" + price+ "&&size=" + size;

        HttpSession sesion = request.getSession(true);
        Cart cart = null;
        Object o = sesion.getAttribute("cart");
        //if exist
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String productID_raw = request.getParameter("productID");
        String mil_raw = request.getParameter("size");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantity");
        ProductsDAO dao = new ProductsDAO();
        ProductDetailDAO daoDetail = new ProductDetailDAO();
        int productID = 0;
        float price = -1;
        int quantity = 0;
        try {
            productID = Integer.parseInt(productID_raw);
            price = Float.parseFloat(price_raw);
            quantity = Integer.parseInt(quantity_raw);
        } catch (Exception e) {
            quantity = 1;
        }
        ProductDetail productDetail = daoDetail.getProductDetail(productID);
        Products product = dao.getProductByProductID(productID);
        Item t = new Item(productDetail, quantity, mil_raw, price);
        cart.add(t);
        List<Products> listProduct = new ArrayList<>();
        String name = dao.getProductByProductID(productID).getProductName();
        String image = dao.getProductByProductID(productID).getProductImageUrl();
        List<Item> list = cart.getItems();
        sesion.setAttribute("cart", cart);
        sesion.setAttribute("size", list.size());
        sesion.setAttribute("list", listProduct);
        
        request.getRequestDispatcher("cart.jsp").forward(request, response);
        // Đặt các thuộc tính vào request
        /*equest.setAttribute("name", name);
        request.setAttribute("image", image);
        request.setAttribute("productID", productID);
        request.setAttribute("price", price);
        request.setAttribute("mil", mil_raw);
        request.setAttribute("quantity", quantity);*/

 /*Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr!=null){
            for(Cookie o:arr){
                if(o.getName().equals("cart")){
                    txt+=o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, list);*/
        // Chuyển tiếp request và response tới cart.jsp
        
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
