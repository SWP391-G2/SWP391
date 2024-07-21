/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
<<<<<<<< HEAD:SWP391-G2/src/java/Controllers/marketing/feedback/UpdateFeedback.java
package Controllers.marketing.feedback;

import Dal.AccountsDAO;
import Dal.FeedbackDAO;
import Dal.ProductsDAO;
import Models.Accounts;
import Models.FeedBacks;
import Models.Products;
========

package Controllers.common;

import Dal.AddressDAO;
>>>>>>>> 8135334561a4d114a071d31d747f54ce797bdd28:SWP391-G2/src/java/Controllers/common/DeleteAddress.java
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
<<<<<<<< HEAD:SWP391-G2/src/java/Controllers/marketing/feedback/UpdateFeedback.java
public class UpdateFeedback extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
========
public class DeleteAddress extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
>>>>>>>> 8135334561a4d114a071d31d747f54ce797bdd28:SWP391-G2/src/java/Controllers/common/DeleteAddress.java
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
<<<<<<<< HEAD:SWP391-G2/src/java/Controllers/marketing/feedback/UpdateFeedback.java
            out.println("<title>Servlet UpdateFeedback</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateFeedback at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
========
            out.println("<title>Servlet DeleteAddress</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteAddress at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
>>>>>>>> 8135334561a4d114a071d31d747f54ce797bdd28:SWP391-G2/src/java/Controllers/common/DeleteAddress.java

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
<<<<<<<< HEAD:SWP391-G2/src/java/Controllers/marketing/feedback/UpdateFeedback.java
            throws ServletException, IOException {
        int feedbackID = -1;

        try {
            feedbackID = request.getParameter("id") == null ? -1 : Integer.parseInt(request.getParameter("id"));
        } catch (Exception e) {

        }

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        FeedBacks feedback = feedbackDAO.getFeedback(feedbackID);

        AccountsDAO accDAO = new AccountsDAO();
        Accounts acc = accDAO.getAccoutByID(feedback.getFbAccountID());

        ProductsDAO proDAO = new ProductsDAO();
        Products pro = proDAO.getProduct(feedback.getFbProductID());

        request.setAttribute("feedback", feedback);
        request.setAttribute("acc", acc);
        request.setAttribute("pro", pro);

        request.getRequestDispatcher("marketing/update-mange-feedback.jsp").forward(request, response);
    }
========
    throws ServletException, IOException {
        String addressid = request.getParameter("address_id");
        AddressDAO addressdao = new AddressDAO();
        addressdao.DeleteAddress(addressid);
        response.sendRedirect("./AddressMain");
    } 
>>>>>>>> 8135334561a4d114a071d31d747f54ce797bdd28:SWP391-G2/src/java/Controllers/common/DeleteAddress.java

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
<<<<<<<< HEAD:SWP391-G2/src/java/Controllers/marketing/feedback/UpdateFeedback.java
            throws ServletException, IOException {
        String reply = request.getParameter("reply");
        int id = Integer.parseInt(request.getParameter("feedbackId"));
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        feedbackDAO.updateReplyFeedback(reply, id);
        response.sendRedirect("feedback");
========
    throws ServletException, IOException {
        processRequest(request, response);
>>>>>>>> 8135334561a4d114a071d31d747f54ce797bdd28:SWP391-G2/src/java/Controllers/common/DeleteAddress.java
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
