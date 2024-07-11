/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.marketing.blog;

import Dal.BlogDAO;
import Models.Accounts;
import Models.BlogResponseDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author TNO
 */
@WebServlet(name = "FormInforBlog", urlPatterns = {"/formInforBlog"})
public class FormInforBlog extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Accounts account = (Accounts) session.getAttribute("account");

        if (account == null || account.getRoleID() != 3) {
            response.sendRedirect("login");
            return;
        }

        int idBlog = Integer.parseInt(request.getParameter("id"));
        BlogDAO blogDAO = new BlogDAO();
        BlogResponseDTO blog = blogDAO.findBlogById(idBlog);
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("./blog/formInforBlog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
