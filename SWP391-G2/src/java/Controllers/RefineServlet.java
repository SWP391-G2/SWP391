/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Dal.BrandsDAO;
import Dal.CategoriesDAO;
import Dal.ProductsDAO;
import Models.Categories;
import Models.Brands;
import Models.Products;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author ROG
 */
public class RefineServlet extends HttpServlet {

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
            out.println("<title>Servlet RefineServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RefineServlet at " + request.getContextPath() + "</h1>");
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
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        ProductsDAO productsDAO = new ProductsDAO();
        BrandsDAO brandsDAO = new BrandsDAO();
        List<Categories> categories = categoriesDAO.loadCategory();
        List<Products> productsAll = productsDAO.loadProducts();
        List<Products> allproduct = productsDAO.loadProducts();
        List<Brands> brands = brandsDAO.getBrands();

        String nameSearch = request.getParameter("nameSearch");

        Boolean[] chid = new Boolean[categories.size() + 1];
        String cid_refine_raw = request.getParameter("cid_refine");

        String stringForLink = "";
        int cid_refine = 0;

        /*
         * **********************REFINE CATEGORIES********************
         */
        String[] cid_refinee_raw = request.getParameterValues("cid_refinee");
        int[] cid_refinee = null;
        if (cid_refine_raw != null) {
            cid_refine = Integer.parseInt(cid_refine_raw);
            productsAll = productsDAO.getProductsByCategory(cid_refine);
            if (cid_refine == 0) {
                chid[0] = true;
            }
        }

        if (cid_refinee_raw != null) {
            cid_refinee = new int[cid_refinee_raw.length];
            for (int i = 0; i < cid_refinee.length; i++) {
                cid_refinee[i] = Integer.parseInt(cid_refinee_raw[i]);
            }
            productsAll = productsDAO.searchByCheckbox(cid_refinee);
        }

        if ((cid_refinee_raw != null) && (cid_refinee[0] != 0)) {
            chid[0] = false;
            for (int i = 1; i < chid.length; i++) {
                if (isCheck(categories.get(i - 1).getCategoryID(), cid_refinee)) {
                    stringForLink += "cid_refinee=" + i + "&";
                    chid[i] = true;
                } else {
                    chid[i] = false;
                }
            }
        }
        if (stringForLink.endsWith("&")) {
            stringForLink = stringForLink.substring(0, stringForLink.length() - 1);
        } else if (stringForLink.isEmpty()) {
            stringForLink = "cid_refinee=0";
        }

        Categories ca = categoriesDAO.getCategoryById(cid_refine);

        /*
         * **********************REFINE BRANDS********************
         */
        Boolean[] bhid = new Boolean[brands.size() + 1];
        String bid_refine_raw = request.getParameter("bid_refine");
        String[] bid_refinee_raw = request.getParameterValues("bid_refinee");
        int bid_refine = 0;
        int[] bid_refinee = null;

        if (bid_refine_raw != null) {
            bid_refine = Integer.parseInt(bid_refine_raw);
            productsAll = productsDAO.getProductsByBrand(bid_refine);
            if (bid_refine == 0) {
                bhid[0] = true;
            }
        }

        if (bid_refinee_raw != null) {
            bid_refinee = new int[bid_refinee_raw.length];
            for (int i = 0; i < bid_refinee.length; i++) {
                bid_refinee[i] = Integer.parseInt(bid_refinee_raw[i]);
            }
            productsAll = productsDAO.searchByCheckboxBrand(bid_refinee);
        }

        if ((bid_refinee_raw != null) && (bid_refinee[0] != 0)) {
            bhid[0] = false;
            for (int i = 1; i < bhid.length; i++) {
                if (isCheck(brands.get(i - 1).getBrandID(), bid_refinee)) {
                    stringForLink += "bid_refinee=" + i + "&";
                    bhid[i] = true;
                } else {
                    bhid[i] = false;
                }
            }
        }

        if (stringForLink.endsWith("&")) {
            stringForLink = stringForLink.substring(0, stringForLink.length() - 1);
        } else if (stringForLink.isEmpty()) {
            stringForLink = "cid_refinee=0&bid_refinee=0";
        }
        Brands ba = brandsDAO.getBrandById(bid_refine);

        //Paging
        int page = 1, numPerPage = 12;
        int size = productsAll.size();
        int numberpage = ((size % numPerPage == 0) ? (size / 12) : (size / 12) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * 12;
        end = Math.min(page * numPerPage, size);

        int currentPage = 1;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        List<Products> listByPage = productsDAO.getListByPage(productsAll, start, end);

        if (nameSearch != null) {
            listByPage = productsDAO.searchByName(nameSearch);
        }
        request.setAttribute("stringForLink", stringForLink);

        request.setAttribute("searchAtHome", nameSearch);
        request.setAttribute("cat", ca);
        request.setAttribute("chid", chid);
        request.setAttribute("cid_refinee", cid_refinee);
        request.setAttribute("cid_refine", cid_refine);
        request.setAttribute("brand", ba);
        request.setAttribute("bhid", bhid);
        request.setAttribute("bid_refinee", bid_refinee);
        request.setAttribute("bid_refine", bid_refine);
        request.setAttribute("categories", categories);
        request.setAttribute("brands", brands);
        request.setAttribute("products", productsAll);
        request.setAttribute("productPage", listByPage);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("numberpage", numberpage);
        request.setAttribute("allproduct", allproduct);
        request.getRequestDispatcher("refine.jsp").forward(request, response);
    }

    private boolean isCheck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
        }
        return false;
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
        processRequest(request, response);
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
