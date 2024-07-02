/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.shop.feedback;

import Dal.AccountsDAO;
import Dal.FeedbackDAO;
import Models.Accounts;
import Models.FeedBacks;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
@MultipartConfig
public class FeedbackProduct extends HttpServlet {

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
            out.println("<title>Servlet FeedbackProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackProduct at " + request.getContextPath() + "</h1>");
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
        int status_new = -1;
        int feedbackID = -1;

        try {
            status_new = request.getParameter("statusnew") == null ? -1 : Integer.parseInt(request.getParameter("statusnew"));
            feedbackID = request.getParameter("feedbackID") == null ? -1 : Integer.parseInt(request.getParameter("feedbackID"));
        } catch (Exception e) {

        }
        if (status_new != -1) {
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            feedbackDAO.updateStatusFeedback(status_new, feedbackID);
        }
        String search = "";
        int status = -1;
        int pageNo = 1;
        final int pageSize = 10;
        try {
            search = request.getParameter("search") == null ? "" : request.getParameter("search");
            status = request.getParameter("status") == null ? -1 : Integer.parseInt(request.getParameter("status"));
            pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
        } catch (Exception e) {

        }
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        List<FeedBacks> listfeedback = feedbackDAO.getFeedbacksByFilter(status, search, pageNo, pageSize);
        int totalPage = feedbackDAO.getTotalPage(status, search, pageSize);
        List<Accounts> listAccount = new ArrayList<>();
        AccountsDAO accDAO = new AccountsDAO();
        for (FeedBacks listfb : listfeedback) {
            Accounts a = accDAO.getAccoutByID(listfb.getFbAccountID());

            listAccount.add(a);
        }
        request.setAttribute("search", search);
        request.setAttribute("status", status);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", pageNo);
        request.setAttribute("listfeedback", listfeedback);
        request.setAttribute("listAccount", listAccount);
       request.getRequestDispatcher("feedbacks/manageFeedback.jsp").forward(request, response);
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
//        String idAccount = request.getParameter("idAccount");
//        String idProduct = request.getParameter("idProduct");
        String idProduct = "10";
        String idAccount = "4";
        String idRating = request.getParameter("rating");
        String content = request.getParameter("content");
        Date date = new Date(System.currentTimeMillis());
        int rating = Integer.parseInt(idRating);
        //upload

        String uploadFolder = getServletContext().getRealPath("") + "../../web/images/Feedback/";

        File folder = new File(uploadFolder);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        Part filePart = request.getPart("photo");
        String fileName = idAccount + "_" + idProduct + ".jpg";
        OutputStream out = null;
        InputStream fileContent = null;

        try {
            out = new FileOutputStream(new File(uploadFolder + File.separator + fileName));
            fileContent = filePart.getInputStream();
            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = fileContent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
        } catch (FileNotFoundException fne) {
            fne.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
            if (fileContent != null) {
                fileContent.close();
            }
        }
        //end
        try {
            FeedbackDAO fbDAO = new FeedbackDAO();
            fbDAO.insertFeedback(10, 4, rating, content, fileName, date, 1, null);
        } catch (Exception e) {

        }
        response.sendRedirect("home.jsp");
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
