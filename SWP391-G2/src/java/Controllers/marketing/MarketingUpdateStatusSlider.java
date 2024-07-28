/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
<<<<<<< HEAD
package Controllers;
=======

package Controllers.marketing;
>>>>>>> fix_all

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
<<<<<<< HEAD
import jakarta.servlet.annotation.WebServlet;
import Dal.SliderDAO;
import Models.Sliders;
=======
>>>>>>> fix_all
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
<<<<<<< HEAD
 * @author pna29
 */
@WebServlet(name = "MarketingUpdateStatusSlider", urlPatterns = {"/updateStatusSlider"})
public class MarketingUpdateStatusSlider extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
=======
 * @author nguye
 */
public class MarketingUpdateStatusSlider extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
>>>>>>> fix_all
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
<<<<<<< HEAD
            throws ServletException, IOException {
=======
    throws ServletException, IOException {
>>>>>>> fix_all
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
<<<<<<< HEAD
            out.println("<title>Servlet UpdateStatusSlider</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStatusSlider at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
=======
            out.println("<title>Servlet MarketingUpdateStatusSlider</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarketingUpdateStatusSlider at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
>>>>>>> fix_all
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
<<<<<<< HEAD
            throws ServletException, IOException {
        String statusParam = request.getParameter("status");
        String sliderIdParam = request.getParameter("sliderId");

        try {
            int status = Integer.parseInt(statusParam);
            int sliderId = Integer.parseInt(sliderIdParam);

            SliderDAO sliderDAO = new SliderDAO();
            boolean isUpdated = sliderDAO.updateSliderStatus(sliderId, status);

            if (isUpdated) {
                request.setAttribute("message", "Update Status Successed !");
            }

            // Chuyển hướng đến trang quản lý slider với thông báo
            request.getRequestDispatcher("manageSlider").forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("message", "Invalid slider ID or status.");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
=======
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
>>>>>>> fix_all
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
<<<<<<< HEAD
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
=======
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
>>>>>>> fix_all
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
