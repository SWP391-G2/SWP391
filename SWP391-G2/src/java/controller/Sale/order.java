/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Sale;

import Dal.CartsDAO;
import Dal.OrderDAO;
import Dal.ProductDetailDAO;
import Models.Accounts;
import Models.Cart;
import Models.Carts;
import Models.Orders;
import Models.ProductDetail;
import Util.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.time.LocalDate;
import javax.mail.Session;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hatru
 */
public class order extends HttpServlet {

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
            out.println("<title>Servlet order</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet order at " + request.getContextPath() + "</h1>");
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
//        String firstName = request.getParameter("firstname");
//        String lastName = request.getParameter("lastname");
//        String phone = request.getParameter("phone");
        String total = request.getParameter("total");

        // Chuyển đổi giá trị từ String sang double
        double totalprice = Double.parseDouble(total);

        // Làm tròn số và chuyển đổi sang long
        long amount = Math.round(totalprice);
//        response.getWriter().print(firstName);
//        response.getWriter().print(lastName);
//        response.getWriter().print(phone);
        //response.getWriter().print(total);

//        if (validatePhone(phone) == false) {
//            request.setAttribute("errorphone", "Wrong format phone number");
//            request.getRequestDispatcher("checkout").forward(request, response);
//        }
//        if (validateUsername(firstName) == false) {
//            request.setAttribute("errorfisrtname", "Wrong frmat for firstname");
//            request.getRequestDispatcher("checkout").forward(request, response);
//        }
//        if (validateUsername(lastName) == false) {
//            request.setAttribute("errorlastname", "Wrong format for lastname");
//            request.getRequestDispatcher("checkout").forward(request, response);
//        }
        String payment = request.getParameter("payment");
        HttpSession session = request.getSession();
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String note = request.getParameter("note");
        String addressdetails = request.getParameter("addressDetails");
        String address = addressdetails + ward + district + city;
        String paymentMethod = "vnpay";
        int voucher = 1;
        Accounts accounts = (Accounts) session.getAttribute("account");
        int AccountID = 11;
        boolean check = session.getAttribute("account") != null ? true : false;
//        response.getWriter().print(email);
//        response.getWriter().print(phone);
//        response.getWriter().print(city);
        switch (payment) {
            case "vnpay":
                // Code xử lý cho "vnpay"
                request.setAttribute("total", amount);
                request.getRequestDispatcher("form.jsp").forward(request, response);
                break;
            case "direct":
                // Code xử lý cho "direct"
                OrderDAO dao = new OrderDAO();
                LocalDate currentDate = LocalDate.now();

                // Tạo các biến LocalDate cho ngày hiện tại
                LocalDate orderDate = currentDate;
                response.getWriter().print(AccountID);

                //Chuyển đổi LocalDate thành Date
                Date sqlOrderDate = Date.valueOf(orderDate);
                Orders order = new Orders(AccountID, sqlOrderDate, amount, fullName, phone, email, address, paymentMethod, note, 1, voucher);
                dao.insertOrder(order);
                int orderID = dao.getOrderID();
                request.setAttribute("fullname", fullName);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("note", note);
                request.setAttribute("accountID", AccountID);
                request.setAttribute("city", city);
                request.setAttribute("district", district);
                request.setAttribute("ward", ward);
                request.setAttribute("orderID", orderID);
                request.setAttribute("addressdetails", addressdetails);
                request.setAttribute("method", "Payment on delivery");
                CartsDAO cart = new CartsDAO();
                ProductDetailDAO productDAO = new ProductDetailDAO();
                List<ProductDetail> listProduct = new ArrayList<>();
                if (check) {
                    List<Carts> listCart = cart.getAllCart();
                    for (Carts carts : listCart) {
                        ProductDetail p = productDAO.getInforProductDetail(carts.getProductFullDetailID());
                        listProduct.add(p);
                        request.setAttribute("listcart", listCart);
                        request.setAttribute("total", amount);
                        request.setAttribute("listproduct", listProduct);
                        request.getRequestDispatcher("./common/order.jsp").forward(request, response);
                        break;
                    }
                } else {
                    Cart ca = new Cart();
                    ProductDetailDAO d = new ProductDetailDAO();
                    List<ProductDetail> list = d.getAll();
                    Cookie[] arr = request.getCookies();
                    String txt = "";
                    if (arr != null) {
                        for (Cookie o : arr) {
                            if (o.getName().equals("cart")) {
                                txt = URLDecoder.decode(o.getValue(), StandardCharsets.UTF_8.toString());
                                break;
                            }
                        }
                    }
                    ca = new Cart(txt, list);
                    if (!txt.isEmpty()) {
                        String[] s = txt.split(",");
                        for (String string : s) {
                            String[] i = string.split(":");
                            ProductDetail p = productDAO.getInforProductDetail(Integer.parseInt(i[0]));
                            listProduct.add(p);
                        }
                    }
                    request.setAttribute("cookieCart", ca);
                    request.setAttribute("total", amount);
                    request.setAttribute("listproduct", listProduct);
                    request.getRequestDispatcher("./common/order.jsp").forward(request, response);
                }
            //cart.deleteAllCart(AccountID);

            default:
                throw new AssertionError();
        }
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
