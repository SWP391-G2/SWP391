/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.marketing;

import Dal.CategoriesDAO;
import Dal.ProductDetailDAO;
import Dal.ProductsDAO;
import Models.Categories;
import Models.Products;
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
        try {
            proId = request.getParameter("proId") == null ? -1 : Integer.parseInt(request.getParameter("proId"));
        } catch (Exception e) {
        }
        ProductDetailDAO detailDAO = new ProductDetailDAO();
        int lastId = detailDAO.getLastProductDetailId(proId);
        int pdId = lastId == -1 ? 1 : lastId;

        request.setAttribute("lastId", pdId);
        request.setAttribute("lastId", pdId);
        request.getRequestDispatcher("marketing/add-new-product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductsDAO proDao = new ProductsDAO();
        int cateId = Integer.parseInt(request.getParameter("cateId"));
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        int status = Integer.parseInt(request.getParameter("status"));
        String productName = request.getParameter("productName");
        Date dateInit = new Date(System.currentTimeMillis());

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
        String fileName = String.valueOf(proDao.getLastProductId() + 1) + "_0.jpg";
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
        Products product = new Products(productName, dateInit, status, fileName, brandId, cateId);
        proDao.insertNewProduct(product);
        response.sendRedirect("../SWP391-G2/marketing-manager-products");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
