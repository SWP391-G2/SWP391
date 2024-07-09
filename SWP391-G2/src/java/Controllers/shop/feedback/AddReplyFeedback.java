/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.shop.feedback;

import Controllers.marketing.UpdateStatusSlider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import Dal.SliderDAO;
import Models.Sliders;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
<<<<<<<< HEAD:SWP391-G2/src/java/Controllers/UpdateStatusSlider.java
@WebServlet(name="UpdateStatusSlider", urlPatterns={"/updateStatusSlider"})
public class UpdateStatusSlider extends HttpServlet {
========
public class AddReplyFeedback extends HttpServlet {
>>>>>>>> main:SWP391-G2/src/java/Controllers/shop/feedback/AddReplyFeedback.java
   
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
<<<<<<<< HEAD:SWP391-G2/src/java/Controllers/UpdateStatusSlider.java
            out.println("<title>Servlet UpdateStatusSlider</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStatusSlider at " + request.getContextPath () + "</h1>");
========
            out.println("<title>Servlet AddReplyFeedback</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddReplyFeedback at " + request.getContextPath () + "</h1>");
>>>>>>>> main:SWP391-G2/src/java/Controllers/shop/feedback/AddReplyFeedback.java
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
        String statusParam = request.getParameter("status");
        String sliderIdParam = request.getParameter("sliderId");
        int status = Integer.parseInt(statusParam);
        int sliderId = Integer.parseInt(sliderIdParam);       
        Sliders slider = new SliderDAO().getSliderById(sliderId);
        slider.setSliderStatus(status);
        new SliderDAO().updateSlider(slider);
        
        response.sendRedirect("manageSlider");
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
