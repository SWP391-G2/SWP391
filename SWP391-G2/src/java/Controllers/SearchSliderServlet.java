/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import Dal.SliderDAO;
import Models.Sliders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author pna29
 */
@WebServlet(name="SearchSliderServlet", urlPatterns={"/searchSlider"})
public class SearchSliderServlet extends HttpServlet {
   
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
            out.println("<title>Servlet SearchSliderByTitle</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchSliderByTitle at " + request.getContextPath () + "</h1>");
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
        String textSearch = request.getParameter("text");
        SliderDAO sliDAO = new SliderDAO();
        List<Sliders> slidersList = sliDAO.searchSlidersByTitle(textSearch);
        List<Sliders> slider = sliDAO.getAllActiveStatus();

        //Paging
        int page =1 , numberPage =5;
        int size = slider.size();
        int numberpage = ((size % numberPage == 0) ? (size / 5) : (size / 5) + 1); 
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * 5;
        end = Math.min(page * numberPage, size);
        List<Sliders> listByPage = sliDAO.getListByPage(slidersList, start, end);
        
        request.setAttribute("listByPage", listByPage);
        request.setAttribute("page", page);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("numberpage", numberpage);
        request.setAttribute("sliderList", slider);
        request.setAttribute("slidersList", slidersList);
        request.setAttribute("searchValue", textSearch);
        request.getRequestDispatcher("ajax/search_slider_ajax.jsp").forward(request, response);
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
        processRequest(request, response);
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
