package controller;

import DAO.UserAdminGet;
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
import model.UserAdmin;




public class AdminUserServlet extends HttpServlet {

  UserAdminGet userAdminGet = new UserAdminGet();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String commandadmin = request.getParameter("commandadmin");
        String url = "";
        UserAdmin userAdmin = new UserAdmin();
        HttpSession session = request.getSession();
        
        switch (commandadmin) {
            
            case "login":
                userAdmin = userAdminGet.login(request.getParameter("emailadmin"), (request.getParameter("passadmin")));
                if (userAdmin != null) {
                    
                   session.setAttribute("useradmin", userAdmin);
                   url = request.getContextPath() +"/admin/home.jsp";
                }
                else{
                    session.setAttribute("error", "Lỗi tên đăng nhập hoặc mật khẩu");
                    url = request.getContextPath() +"/admin/index.jsp";
                }
                break;
        }
        response.sendRedirect(url);
       
    }
    
  
    

 }

