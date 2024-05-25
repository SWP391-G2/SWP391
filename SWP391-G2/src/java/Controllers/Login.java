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
import jakarta.servlet.http.Cookie;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author nguye
 */
public class Login extends HttpServlet {

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        Cookie arrayCookie[] = request.getCookies();
        for(Cookie cookie : arrayCookie){
            if(cookie.getName().equals("em")){
                request.setAttribute("email", cookie.getValue());
                continue;
            }
            if(session.getAttribute("save") != null){
                if(cookie.getName().equals("pa")){
                    request.setAttribute("password", cookie.getValue());
                }
            }
        }
        String logout = request.getParameter("logOut");
        if(logout != null){
            session.invalidate();
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        AccountsDAO Adao = new AccountsDAO();
        Security security = new Security();
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        Accounts account = Adao.getAccount(email);
        
        try {
            if (account != null) {
                if (account.getStatus() == 1) {
                    if (account.getPassword().equals(security.PasswordSecurity(password))) {
                        session.setAttribute("account", account.getAccountID());
                        session.setAttribute("role", account.getRole());
                        Cookie cookieEmail = new Cookie("em", email);
                        cookieEmail.setMaxAge(30);
                        response.addCookie(cookieEmail);
                        if (remember != null) {
                            Cookie cookiePassword = new Cookie("cp", password);
                            cookiePassword.setMaxAge(30);
                            response.addCookie(cookiePassword);
                            session.setAttribute("save", "1");
                        }
                        request.setAttribute("email", email);
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    } else {
                        throw new Exception("Password is incorrect, please check again!!");
                    }
                } else {
                    throw new Exception("Your account has been banned");
                }
            } else {
                throw new Exception("email is not exsit, please check agian!");
            }
        } catch (Exception e) {
            request.setAttribute("err", e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        }
        
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
