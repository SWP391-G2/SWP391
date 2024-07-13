/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.marketing;

import Dal.CategoriesDAO;
import Dal.ProductDetailDAO;  
import Models.Categories;
import Models.ProductDetail;
import java.io.IOException;
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
import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author nguye
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class MarketingAddProductDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int proId = -1;
        int cateId = -1;
        try {
            proId = request.getParameter("proId") == null ? -1 : Integer.parseInt(request.getParameter("proId"));
            cateId = request.getParameter("cateId") == null ? -1 : Integer.parseInt(request.getParameter("cateId"));
        } catch (Exception e) {
        }
        //get number of product_detail_id of with product_id
        ProductDetailDAO detailDAO = new ProductDetailDAO();
        int lastId = detailDAO.getLastProductDetailIdByProductId(proId);
        int pdId = lastId == -1 ? 1 : lastId + 1;

        request.setAttribute("lastId", pdId);
        request.setAttribute("proId", proId);
        request.setAttribute("cateId", cateId);

        request.getRequestDispatcher("marketing/add-new-product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cateId = -1;
        int lastId = -1;
        int proId = -1;
        int quantity = -1;
        int status = -1;
        String size = "";
        String detail = "";
        BigDecimal price = BigDecimal.valueOf(-1);

        try {
            cateId = request.getParameter("cateId") == null ? -1 : Integer.parseInt(request.getParameter("cateId"));
            proId = request.getParameter("proId") == null ? -1 : Integer.parseInt(request.getParameter("proId"));
            quantity = request.getParameter("quantity") == null ? -1 : Integer.parseInt(request.getParameter("quantity"));
            status = request.getParameter("status") == null ? -1 : Integer.parseInt(request.getParameter("status"));
            lastId = request.getParameter("lastId") == null ? -1 : Integer.parseInt(request.getParameter("lastId"));
            size = request.getParameter("size") == null ? "" : request.getParameter("size");
            detail = request.getParameter("detail") == null ? "" : request.getParameter("detail");
            price = request.getParameter("price") == null ? BigDecimal.valueOf(-1) : new BigDecimal(request.getParameter("price"));
        } catch (Exception e) {
        }

        Date dateInit = new Date(System.currentTimeMillis());
        ProductDetailDAO pddao = new ProductDetailDAO();
        int lastPdId = pddao.getLastProductDetailId();
        //file upload
        CategoriesDAO cateDao = new CategoriesDAO();
        Categories cate = cateDao.getCategoryById(cateId);
        String realPath = "../../web/images/Products/" + cate.getCategoryName() + "/";
        String uploadFolder = getServletContext().getRealPath("") + realPath;

        File folder = new File(uploadFolder);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        Part filePart = request.getPart("img");
        String fileName = String.valueOf(lastPdId + 1) + "_" + lastId + ".jpg";
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

        //insert product
        ProductDetail details = new ProductDetail(proId, detail, dateInit, status, size, price, quantity, fileName);
        pddao.insertNewProductDetail(details);
        response.sendRedirect("../SWP391-G2/product-detail?proId=" + proId + "&cateId=" + cateId);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
