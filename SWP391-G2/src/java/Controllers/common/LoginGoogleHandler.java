package Controllers.common;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Constant.constant;
import Dal.AccountsDAO;
import Models.Accounts;
import Models.UserGoogleDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

/**
 * @author heaty566
 */
@WebServlet(urlPatterns = {"/LoginGoogleHandler"})
public class LoginGoogleHandler extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDto user = getUserInfo(accessToken);
        AccountsDAO Adao = new AccountsDAO();
        Accounts account = Adao.getAccount(user.getEmail());

        try {
            if (account != null) {
                if (account.getStatus() == 1) {
                    request.getRequestDispatcher("shop/home.jsp").forward(request, response);
                } else {
                    throw new Exception("Your account was ban please enter another account!!");
                }
            } else {
                throw new Exception("email is not exsit, please check agian!");
            }
        } catch (Exception e) {
            request.setAttribute("err", e.getMessage());
            request.getRequestDispatcher("login").forward(request, response);
        }

    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(constant.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", constant.GOOGLE_CLIENT_ID)
                        .add("client_secret", constant.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", constant.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", constant.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = constant.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

        return googlePojo;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String s = request.getParameter("error");

        if (s != null) {
            request.getRequestDispatcher("login").forward(request, response);
        } else {
            processRequest(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
