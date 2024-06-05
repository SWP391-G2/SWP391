/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Dal.AccountsDAO;
import Models.Accounts;
import Util.Security;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.Random;


/**
 *
 * @author nguye
 */
public class Signup extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        AccountsDAO Adao = new AccountsDAO();
        String email = request.getParameter("email");
        Accounts account = Adao.getAccount(email);
        try {
            if (account == null) {
                String password = request.getParameter("password");
                if (CheckPass(password)) {
                    String passConfirm = request.getParameter("confirmpassword");
                    if (password.equalsIgnoreCase(passConfirm)) {
                        String firstname = request.getParameter("firstname");
                        String lastname = request.getParameter("lastname");
                        HttpSession session = request.getSession();
                        Date date = new Date(System.currentTimeMillis());
                        Security security = new Security();
                        Accounts a = new Accounts(firstname, lastname, security.getPasswordSecurity(password), "", true, date, "", email, "", true, date, 4);
                        session.setAttribute("accountForSign", a);
                         request.getRequestDispatcher("/email").forward(request, response);
                    } else {
                        throw new Exception("Password and Confirm password is not equals!!");
                    }
                } else {
                    throw new Exception("Password must contain the format below please!!");
                }
            } else {
                throw new Exception("email is exist, please enter another email or login!!");
            }
        } catch (Exception e) {
            request.setAttribute("err", e.getMessage());
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }

    }

    public boolean CheckPass(String password) {
        boolean islower = false;
        boolean isupper = false;
        boolean isNumber = false;
        boolean isspecital = false;
        if (password.length() < 8) {
            return false;
        }
        for (char p : password.toCharArray()) {
            if (Character.isUpperCase(p)) {
                islower = true;
            } else if (Character.isLowerCase(p)) {
                isupper = true;
            } else if (Character.isDigit(p)) {
                isNumber = true;
            } else {
                isspecital = true;
            }
        }
        if (password.contains(" ")) {
            return false;
        }
        return isNumber && islower && isspecital && isupper;
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
