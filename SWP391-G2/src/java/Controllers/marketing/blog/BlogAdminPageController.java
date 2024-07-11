/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.marketing.blog;

import static Constant.constant.RECORD_PER_PAGE;
import Dal.BlogDAO;
import Models.Accounts;
import Models.BlogResponseDTO;
import Models.PageControl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author TNO
 */
@WebServlet(name = "BlogAdminPageController", urlPatterns = {"/manageBlog"})
public class BlogAdminPageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Accounts account = (Accounts) session.getAttribute("account");

        if (account == null || account.getRoleID() != 3) {
            response.sendRedirect("login");
            return;
        }

        PageControl pageControl = new PageControl();
        List<BlogResponseDTO> blogList = pagination(request, pageControl);
        request.setAttribute("blogList", blogList);
        request.setAttribute("pageControl", pageControl);
        request.getRequestDispatcher("./blog/manageBlog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private List<BlogResponseDTO> pagination(HttpServletRequest request, PageControl pageControl) {
        //get page
        String pageRaw = request.getParameter("page");
        BlogDAO blogDAO = new BlogDAO();

        //valid page
        int page;
        try {
            page = Integer.parseInt(pageRaw);
        } catch (Exception e) {
            page = 1;
        }
        int totalRecord = 0;
        List<BlogResponseDTO> listBlog = null;

        String action = request.getParameter("action") == null
                ? "defaultFindAll"
                : request.getParameter("action");
        switch (action) {
            case "Search":
                break;
            case "category":
                break;
            default:
                totalRecord = blogDAO.findTotalRecord(1);
                listBlog = blogDAO.findBlogByPage(page, 1);

                pageControl.setUrlPattern("manageBlog?");

        }

        //tìm kiếm xem tổng có bao nhiêu page
        int totalPage = (totalRecord % RECORD_PER_PAGE) == 0
                ? (totalRecord / RECORD_PER_PAGE)
                : (totalRecord / RECORD_PER_PAGE) + 1;
        //set những giá trị vào pageControl
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);

        return listBlog;
    }

}
