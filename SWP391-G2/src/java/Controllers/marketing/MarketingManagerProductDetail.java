/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.marketing;

import Dal.CategoriesDAO;
import Dal.ProductDetailDAO;
import Dal.ProductsDAO;
import Models.ProductDetail;
import Models.Products;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author nguye
 */
public class MarketingManagerProductDetail extends HttpServlet {

    protected void changeStatus(int detailId, int status) {
        ProductDetailDAO detailDAO = new ProductDetailDAO();
        detailDAO.updateStatus(detailId, status);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String s = "";
        String r = "";
        String search = "";
        String size = "";
        int detailId = -1;
        int newStatus = -1;
        int proId = -1;
        int cateId = -1;
        int status = -1;
        int pageNo = 1;
        final int pageSize = 10;
        try {
            s = request.getParameter("s") == null ? "" : request.getParameter("s");
            r = request.getParameter("r") == null ? "" : request.getParameter("r");
            detailId = request.getParameter("detailId") == null ? -1 : Integer.parseInt(request.getParameter("detailId"));
            newStatus = request.getParameter("newstatus") == null ? -1 : Integer.parseInt(request.getParameter("newstatus"));
            search = request.getParameter("search") == null ? "" : request.getParameter("search");
            size = request.getParameter("size") == null ? "" : request.getParameter("size");
            proId = request.getParameter("proId") == null ? -1 : Integer.parseInt(request.getParameter("proId"));
            cateId = request.getParameter("cateId") == null ? -1 : Integer.parseInt(request.getParameter("cateId"));
            status = request.getParameter("status") == null ? -1 : Integer.parseInt(request.getParameter("status"));
            pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
        } catch (Exception e) {
        }

        if (detailId != -1 && newStatus != -1) {
            changeStatus(detailId, newStatus);
            request.setAttribute("success", "Status changed");
        }
        ProductsDAO proDao = new ProductsDAO();
        Products product = proDao.getProductByProductID(proId);

        ProductDetailDAO detailDAO = new ProductDetailDAO();
        List<ProductDetail> details = detailDAO.getListProductByFilter(proId, status, size, pageNo, pageSize);
        int totalPage = detailDAO.getTotalPage(proId, status, size, pageSize);
        List<String> listSize = detailDAO.getSize(proId);

        CategoriesDAO cateDao = new CategoriesDAO();
        String cateName = cateDao.getCategoryById(cateId).getCategoryName();

        request.setAttribute("cateName", cateName);
        request.setAttribute("size", size);
        request.setAttribute("cateId", cateId);
        request.setAttribute("proId", proId);
        request.setAttribute("search", search);
        request.setAttribute("product", product);
        request.setAttribute("status", status);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", pageNo);

        request.setAttribute("listSize", listSize);
        request.setAttribute("listDetail", details);

//        response.getWriter().println(size);
//        response.getWriter().println(cateId);
//        response.getWriter().println(proId);
//        response.getWriter().println(search);
//        response.getWriter().println(product.getProductID());
//        response.getWriter().println(status);
//        response.getWriter().println(totalPage);
//        response.getWriter().println(pageNo);
//        response.getWriter().println(listSize.get(1));
//        response.getWriter().println(details.get(1).toString());
        request.getRequestDispatcher("./marketing/product-detail.jsp").forward(request, response);

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
