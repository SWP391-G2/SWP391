/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Dal.AccountsDAO;
import Models.Accounts;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ROG
 */
public class Profile extends HttpServlet {

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
            out.println("<title>Servlet Profile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Profile at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Accounts account = (Accounts) session.getAttribute("account");
        String emaill = account.getEmail();
        AccountsDAO Accdao = new AccountsDAO();
        Accounts acc = Accdao.getAccount(emaill);
        request.setAttribute("profile", acc);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Accounts account = (Accounts) session.getAttribute("account");
        String emaill = account.getEmail();
        AccountsDAO Accdao = new AccountsDAO();
        Accounts acc = Accdao.getAccount(emaill);

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birth");
        String button = request.getParameter("save");
        
        if(gender != null){
            System.out.println(gender.toString());
        }
        try {
            SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = formatdate.parse(birthday);
            Date dob = new Date(utilDate.getTime());
            if (button != null) {

                acc.setFirstName(firstName);
                acc.setLastName(lastName);
                if (isValidPhone(phone)) {
                    acc.setPhone(phone);
                } else {
                    request.setAttribute("mess", "invalid phone number ");
                }
                acc.setGender(Integer.parseInt(gender));
                acc.setBirthday(dob);
                acc.setEmail(emaill);
                Accdao.updateProfile(acc);
                request.setAttribute("profile", acc);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private static final String PHONE_REGEX = "^\\(?(\\+\\d{1,3})?\\)?[-.\\s]?\\d{3}[-.\\s]?\\d{3}[-.\\s]?\\d{4}$";
    public  boolean isValidPhone(String phone) {
        Pattern pattern = Pattern.compile(PHONE_REGEX);
        Matcher matcher = pattern.matcher(phone);
        return matcher.matches();
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
