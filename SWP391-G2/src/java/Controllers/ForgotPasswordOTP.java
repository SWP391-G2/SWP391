/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import Dal.AccountsDAO;
import Models.Accounts;
import Util.Email;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import Dal.SliderDAO;
import Models.Sliders;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ROG
 */
<<<<<<<< HEAD:SWP391-G2/src/java/Controllers/ForgotPasswordOTP.java
public class ForgotPasswordOTP extends HttpServlet {
========
@WebServlet(name="UpdateStatusSlider", urlPatterns={"/updateStatusSlider"})
public class UpdateStatusSlider extends HttpServlet {
>>>>>>>> HaPN:SWP391-G2/src/java/Controllers/UpdateStatusSlider.java
   
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
<<<<<<<< HEAD:SWP391-G2/src/java/Controllers/ForgotPasswordOTP.java
            out.println("<title>Servlet ForgotPasswordOTP</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPasswordOTP at " + request.getContextPath () + "</h1>");
========
            out.println("<title>Servlet UpdateStatusSlider</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStatusSlider at " + request.getContextPath () + "</h1>");
>>>>>>>> HaPN:SWP391-G2/src/java/Controllers/UpdateStatusSlider.java
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
<<<<<<<< HEAD:SWP391-G2/src/java/Controllers/ForgotPasswordOTP.java
        AccountsDAO Adao = new AccountsDAO();
        HttpSession session = request.getSession();
        // get OTP from user
        String otp = request.getParameter("OTP");
        // get OTP send for user
        String ots = (String) session.getAttribute("otpmain");
        // Compare both OTP
        if (otp.equals(ots)) { 
            response.sendRedirect("forgotpassword.jsp");
        } else {
            request.setAttribute("err", "OTP is incorrect!!");
            request.getRequestDispatcher("forgotpasswordotp.jsp").forward(request, response);
        }
========
        String statusParam = request.getParameter("status");
        String sliderIdParam = request.getParameter("sliderId");
        int status = Integer.parseInt(statusParam);
        int sliderId = Integer.parseInt(sliderIdParam);       
        Sliders slider = new SliderDAO().getSliderById(sliderId);
        slider.setSliderStatus(status);
        new SliderDAO().updateSlider(slider);
        
        response.sendRedirect("manageSlider");
>>>>>>>> HaPN:SWP391-G2/src/java/Controllers/UpdateStatusSlider.java
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
         HttpSession session = request.getSession();
        String email = request.getParameter("email");
        Email e = new Email();
        String otps = String.valueOf(e.randomOTP());
        String sub = e.subjectEmail();
        session.setAttribute("otpmain", otps);
        String sendOTP = e.SendOTP(email, otps);
        e.sendEmail(sub, sendOTP, email);
        response.sendRedirect("forgotpasswordotp.jsp");
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
