/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Dal.AccountsDAO;
import Models.Accounts;
import Util.Security;
import java.io.IOException;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        if (email != null) {
            request.setAttribute("err", "hoang");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        HttpSession session = request.getSession();
        Cookie arrayCookie[] = request.getCookies();
        for (Cookie cookie : arrayCookie) {
            if (cookie.getName().equals("em")) {
                request.setAttribute("email", cookie.getValue());
                continue;
            }
            if (cookie.getName().equals("cp")) {
                if (session.getAttribute("save") != null) {
                    request.setAttribute("password", cookie.getValue());
                } else {
                    cookie.setMaxAge(0);
                }
            }
        }

        session.invalidate();
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountsDAO Adao = new AccountsDAO();
        Security security = new Security();
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean remember = request.getParameter("remember") != null;
        Accounts account = Adao.getAccount(email);

        try {
            if (account != null) {
                if (account.isStatus()) {
                    if (account.getPassword().equals(security.getPasswordSecurity(password))) {
                        session.setAttribute("account", account);
                        Cookie cookieEmail = new Cookie("em", email);
                        cookieEmail.setMaxAge(30);
                        cookieEmail.setSecure(true);
                        response.addCookie(cookieEmail);
                        if (remember) {

                            Cookie cookiePassword = new Cookie("cp", password);
                            cookiePassword.setMaxAge(30);
                            cookiePassword.setSecure(true);
                            response.addCookie(cookiePassword);
                            session.setAttribute("save", "1");
                        }
                        switch (account.getRole()) {
                            case 4 ->
                                request.getRequestDispatcher("home.jsp").forward(request, response);
                            case 3 ->
                                request.getRequestDispatcher("marketing.jsp").forward(request, response);
                            case 2 ->
                                request.getRequestDispatcher("sale.jsp").forward(request, response);
                            case 1 ->
                                request.getRequestDispatcher("admin.jsp").forward(request, response);
                        }
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
