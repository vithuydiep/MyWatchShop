package controller;

import DAO.ContactGet;
import DAO.ReviewGet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contact;
import model.Product;
import model.Review;

public class ContactServlet extends HttpServlet {

    ContactGet contactGet = new ContactGet();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");

        String name = request.getParameter("name");

        String url = "", error = "";
        if (name.equals("")) {
            error = "Vui lòng nhập tên sản phẩm!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        String email = request.getParameter("mail");
                        String message = request.getParameter("message");
                        contactGet.insertContact(new Contact(new Date().getTime(), name, email, message, new Timestamp(new Date().getTime())));
                        url = "/index.jsp";
                        break;

                }
            } else {
                url = "/index.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

}
