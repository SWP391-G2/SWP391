/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.marketing;

import Dal.BrandsDAO;
import Dal.CategoriesDAO;
import Dal.ProductDetailDAO;
import Dal.ProductsDAO;
import Models.Brands;
import Models.Categories;
import Models.ProductDetail;
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
import java.util.List;

/**
 *
 * @author nguye
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class MarketingUpdateProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String s = request.getParameter("s");
        if (s != null) {
            request.setAttribute("success", "Update successfully");
        }
        String size = "";
        int proId = -1;
        int status = -1;
        int pageNo = 1;
        final int pageSize = 10;
        try {
            size = request.getParameter("size") == null ? "" : request.getParameter("size");
            proId = request.getParameter("proId") == null ? -1 : Integer.parseInt(request.getParameter("proId"));
            status = request.getParameter("status") == null ? -1 : Integer.parseInt(request.getParameter("status"));
            pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
        } catch (Exception e) {
        }

        ProductsDAO proDao = new ProductsDAO();
        Products product = proDao.getProductByProductID(proId);

        //get categories are active
        CategoriesDAO cateDao = new CategoriesDAO();
        List<Categories> cateList = cateDao.getAll();

        //get brands are active
        BrandsDAO brDao = new BrandsDAO();
        List<Brands> brList = brDao.getAll();

        request.setAttribute("size", size);

        request.setAttribute("product", product);
        request.setAttribute("status", status);

        request.setAttribute("listBrands", brList);
        request.setAttribute("listCate", cateList);
        response.getWriter().println(size);
        response.getWriter().println(pageNo);

        response.getWriter().println(product.getCategoryID());
        response.getWriter().println(status);
        response.getWriter().println(brList.size());
        response.getWriter().println(cateList.size());
        request.getRequestDispatcher("marketing/product-profile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductsDAO proDao = new ProductsDAO();
        int proId = -1;
        int newCateId = -1;
        int newBrandId = -1;
        int newStatus = -1;
        int pageNo = -1;
        String productName = "";

        try {
            productName = request.getParameter("productName") == null ? "" : request.getParameter("productName");
            proId = request.getParameter("productId") == null ? -1 : Integer.parseInt(request.getParameter("productId"));
            newCateId = request.getParameter("newcateId") == null ? -1 : Integer.parseInt(request.getParameter("newcateId"));
            newStatus = request.getParameter("newstatus") == null ? -1 : Integer.parseInt(request.getParameter("newstatus"));
            newBrandId = request.getParameter("newbrandId") == null ? -1 : Integer.parseInt(request.getParameter("newbrandId"));
            pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
        } catch (Exception e) {
        }

        //file upload
        CategoriesDAO cateDao = new CategoriesDAO();
        Categories cate = cateDao.getCategoryById(newCateId);
        String realPath = "../../web/images/Products/" + cate.getCategoryName() + "/";
        String uploadFolder = getServletContext().getRealPath("") + realPath;

        File folder = new File(uploadFolder);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        Part filePart = request.getPart("img");
        String fileName = String.valueOf(proId) + "_0.jpg";
        OutputStream out = null;
        InputStream fileContent = null;
        if (filePart != null) {
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
        }

        response.getWriter().println(proId);
        response.getWriter().println(fileName);
        response.getWriter().println(newBrandId);
        response.getWriter().println(newCateId);
        response.getWriter().println(newStatus);
        response.getWriter().print(productName);
        Products product = new Products(proId, productName, newStatus, fileName, newBrandId, newCateId);
        proDao.updateProduct(product);
        response.sendRedirect("update-product?proId=" + proId + "&s=");
        //insert product
//        var product = new Products(proId, productName, newStatus, fileName, newBrandId, newCateId);
//        proDao.updateProduct(product);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
