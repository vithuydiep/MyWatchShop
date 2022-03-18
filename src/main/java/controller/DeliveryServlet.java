package controller;

import DAO.BillDetailGet;
import DAO.BillGet;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.BillDetail;
import model.Cart;
import model.Item;
import model.User;


public class DeliveryServlet extends HttpServlet {

    private final BillGet billGet = new BillGet();
    private final BillDetailGet billDetailGet = new BillDetailGet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String name = request.getParameter("first_name")+ request.getParameter("last_name");
        String phone = request.getParameter("phone");
        String userid = request.getParameter("userid");
                
        try {
            long ID = new Date().getTime();
            Bill bill = new Bill();
            bill.setBillID(ID);
            bill.setAddress(address);
            if (userid == null)
            {
            bill.setUserID(3);
            }else {
                bill.setUserID(Long.parseLong(userid));
            }
            bill.setDate(new Timestamp(new Date().getTime()));
            bill.setTotal(cart.totalCart());
            bill.setName(name);
            bill.setPhone(phone);
            billGet.insertBill(bill);
            for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {
                billDetailGet.insertBillDetail(new BillDetail(new Date().getTime(), ID,
                        list.getValue().getProduct().getProductID(),
                        list.getValue().getProduct().getProductPrice(),
                        list.getValue().getQuantity()));
            }
            cart = new Cart();
            session.setAttribute("cart", cart);
        } catch (Exception e) {
        }
        response.sendRedirect(request.getContextPath()+"/thankyoudelivery.jsp");
    }

}