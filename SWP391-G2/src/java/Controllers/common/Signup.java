/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.common;

import Dal.AccountsDAO;
import Models.Accounts;
import Util.Security;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import Util.Validation;

/**
 *
 * @author nguye
 */
public class Signup extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("common/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountsDAO Adao = new AccountsDAO();
        Validation validation = new Validation();
        String email = request.getParameter("email");
        Accounts account = Adao.getAccount(email);
        try {
            if (account == null) {
                String password = request.getParameter("password");
                if (validation.CheckPass(password)) {
                    String passConfirm = request.getParameter("confirmpassword");
                    if (password.equalsIgnoreCase(passConfirm)) {
                        String firstname = request.getParameter("firstname");
                        String lastname = request.getParameter("lastname");
                        String datebirthday = request.getParameter("brithday");
                        int gender = Integer.parseInt(request.getParameter("gender"));
                        HttpSession session = request.getSession();
                        //get time in current
                        Date date = new Date(System.currentTimeMillis());
                        //get time and convert string to date 
                        SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
                        Security security = new Security();
                        java.util.Date utilDate = formatdate.parse(datebirthday);
                        Date birthday = new Date(utilDate.getTime());

                        Accounts a = new Accounts(
                                firstname,
                                lastname,
                                security.getPasswordSecurity(password),
                                "",
                                gender,
                                birthday,
                                email,
                                1,
                                date,
                                4);
                        session.setAttribute("accountForSign", a);
                        request.getRequestDispatcher("email").forward(request, response);
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
            request.getRequestDispatcher("common/signup.jsp").forward(request, response);
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
