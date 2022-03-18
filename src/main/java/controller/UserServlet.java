package controller;

import DAO.UserGet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.User;

/**
 *
 * @author NguyenDang
 */
public class UserServlet extends HttpServlet {

    UserGet userGet = new UserGet();
    Cart cart = new Cart();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");

        String url = "";
        User users = new User();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
                if(request.getParameter("name")=="")
                {
                    session.setAttribute("error1", "Vui lòng nhập tên! ");
                    url = request.getContextPath()+"/register.jsp";
                }
                else if(request.getParameter("email")=="")
                {
                    session.setAttribute("error1", "Vui lòng nhập email! ");
                    url = request.getContextPath()+"/register.jsp";
                }
                else if(request.getParameter("pass")=="")
                {
                    session.setAttribute("error1", "Vui lòng nhập pass! ");
                    url = request.getContextPath()+"/register.jsp";
                }
                else if(request.getParameter("pass").equals(request.getParameter("confirm_pass")) == false)
                {
                    session.setAttribute("error1", "Mật khẩu không trùng khớp ");
                    url = request.getContextPath()+"/register.jsp";
                }else if(request.getParameter("agree-term")== null) 
                {
                    session.setAttribute("error1", "Vui lòng đồng ý với điều khoản của chúng tôi! ");
                    url = request.getContextPath()+"/register.jsp";
                }else
                {
                users.setUserID(new java.util.Date().getTime());
                users.setUserName(request.getParameter("name"));
                users.setUserEmail(request.getParameter("email"));
                users.setUserPass(request.getParameter(("pass")));
                users.setUserRole(false);
                users.setUserPhone(request.getParameter("phone"));
                userGet.insertUser(users);
                if (users.getUserName() == null)
                {
                    session.setAttribute("error1", "Tên đăng nhập đã tồn tại!");
                    url = request.getContextPath()+"/register.jsp";
                }
                if (users.getUserName()!=null)
                {
                session.setAttribute("user", users);
                url = request.getContextPath()+"/index.jsp";
                }
                }
                break;
            case "update":
                long user_id = Long.parseLong(request.getParameter("user_id"));
                String username = request.getParameter("username");
                String useremail = request.getParameter("useremail");
                String password = request.getParameter("pass");
                boolean role = Boolean.parseBoolean(request.getParameter("role"));
                String phone = request.getParameter("phone");
                userGet.updateUser(new User(user_id, username, useremail, password, role, phone));
                url = request.getContextPath()+"/myaccount.jsp";
                break;
            case "logindeal":
                users = userGet.login(request.getParameter("name"), (request.getParameter("pass")));
                if (users != null) {
                    session.setAttribute("user", users);
                    url = request.getContextPath()+"/delivery.jsp";
                }
                break;

            case "login":
                users = userGet.login(request.getParameter("name"), (request.getParameter("pass")));
                if (users != null) {
                    session.setAttribute("user", users);
                    url = request.getContextPath()+"/index.jsp";
                } else {
                    session.setAttribute("error", "Lỗi tên đăng nhập hoặc mật khẩu");
                    url = request.getContextPath()+"/login.jsp";
                }
                break;

        }
        response.sendRedirect(url);

    }

}
