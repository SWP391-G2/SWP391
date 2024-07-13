/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.admin;

import Dal.AccountsDAO;
import Dal.RoleDAO;
import Models.Accounts;
import Models.AccountsEmployee;
import Models.Role;
import Util.Security;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hatru
 */
public class AdminControlAccount extends HttpServlet {

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
            out.println("<title>Servlet AdminControlAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminControlAccount at " + request.getContextPath() + "</h1>");
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

        //processRequest(request, response);
        //String status_raw = request.getParameter("statusnew");
        //String accountID_raw = request.getParameter("accountID");
        int status_new = -1;
        int accountID = -1;
        try {
            status_new = request.getParameter("statusnew") == null ? -1 : Integer.parseInt(request.getParameter("statusnew"));
            accountID = request.getParameter("accountID") == null ? -1 : Integer.parseInt(request.getParameter("accountID"));
        } catch (Exception e) {
        }

        if (status_new != -1) {
            AccountsDAO dao = new AccountsDAO();
            dao.updateStatusAccount(status_new, accountID);
        }

        String search = "";
        int roleId = -1;
        int status = -1;
        int pageNo = 1;
        final int pageSize = 10;
        try {

            search = request.getParameter("search") == null ? "" : request.getParameter("search");
            roleId = request.getParameter("roleId") == null ? -1 : Integer.parseInt(request.getParameter("roleId"));
            status = request.getParameter("status") == null ? -1 : Integer.parseInt(request.getParameter("status"));
            pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));

        } catch (Exception e) {
        }
        AccountsDAO daoAccount = new AccountsDAO();
        List<AccountsEmployee> listAccount = daoAccount.getListAdminByFilter(roleId, status, search, pageNo, pageSize);
        int totalPage = daoAccount.getTotalPage(roleId, status, search, pageSize);
        RoleDAO daoRole = new RoleDAO();
        List<Role> listRole = daoRole.getAllRoles();

        request.setAttribute("search", search);
        request.setAttribute("roleId", roleId);
        request.setAttribute("status", status);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", pageNo);

        request.setAttribute("listUser", listAccount);
        request.setAttribute("listRole", listRole);
        request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
            //response.getWriter().print(listAccount.get(0).toString());
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
        PrintWriter out = response.getWriter();
        AccountsDAO dao = new AccountsDAO();

        String search = "";
        int roleId = -1;
        int status = -1;
        int pageNo = 1;
        final int pageSize = 10;
        try {

            search = request.getParameter("search") == null ? "" : request.getParameter("search");
            roleId = request.getParameter("roleId") == null ? -1 : Integer.parseInt(request.getParameter("roleId"));
            status = request.getParameter("status") == null ? -1 : Integer.parseInt(request.getParameter("status"));
            pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));

        } catch (Exception e) {
        }

        String password = request.getParameter("password");
        String email = request.getParameter("email");

        try {

            Accounts account = dao.getAccount(email);
            if (account == null) {
                String firstName = request.getParameter("firstname");
                String lastName = request.getParameter("lastname");
                String image = request.getParameter("image");
// Removed unnecessary parts for brevity

                String gender1 = request.getParameter("gender");

                String address = request.getParameter("address");

                String roleID1 = request.getParameter("roleID");

                int roleID = -1;
                int gender = -1;
                Date birthday = null;

                try {

                    roleID = Integer.parseInt(roleID1);
                    gender = Integer.parseInt(gender1);
                } catch (NumberFormatException e) {
                    System.out.println(e);
                }
                out.print(gender1);

                out.print(roleID1);
                String datebirthday = request.getParameter("birthday");
                Date createdate = new Date(System.currentTimeMillis());

// Add debugging information
                SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    java.util.Date utilDate = formatdate.parse(datebirthday);
                    birthday = new Date(utilDate.getTime());
                } catch (ParseException e) {
                    System.out.println("Error parsing date: " + e.getMessage());
                    e.printStackTrace();
                }
                Security security = new Security();
                String p = null;
                try {
                    p = security.getPasswordSecurity(password);
                } catch (Exception ex) {

                }

                Accounts a = new Accounts(firstName, lastName, p, image, gender, birthday, email, 1, createdate, roleID);

                dao.setInsertAccount(a);
                request.setAttribute("success", "Create successfully!");

            } else {
                throw new Exception("Email is esixt!!");
            }

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());

        }
        List<AccountsEmployee> listAccount = dao.getListAdminByFilter(roleId, status, search, pageNo, pageSize);
        int totalPage = dao.getTotalPage(roleId, status, search, pageSize);
        RoleDAO daoRole = new RoleDAO();
        List<Role> listRole = daoRole.getAllRoles();

        request.setAttribute("search", search);
        request.setAttribute("roleId", roleId);
        request.setAttribute("status", status);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("currentPage", pageNo);

        request.setAttribute("listUser", listAccount);
        request.setAttribute("listRole", listRole);
        request.getRequestDispatcher("admin/admin.jsp").forward(request, response);

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
