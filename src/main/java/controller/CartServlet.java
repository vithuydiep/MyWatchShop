package controller;

import DAO.ProductGet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;


public class CartServlet extends HttpServlet {
    
    private final ProductGet productGet = new ProductGet();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String command = request.getParameter("command");
        String productID = request.getParameter("productID");
        Cart cart = (Cart) session.getAttribute("cart");
        

        
        try {
            Long idProduct = Long.parseLong(productID);
            Product product = productGet.getProduct(idProduct);
            switch (command) {
                case "plus":
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    if (cart.getCartItems().containsKey(idProduct)) {
                        cart.plusToCart(idProduct, new Item(product,cart.getCartItems().get(idProduct).getQuantity()),quantity);
                    } else {
                        cart.plusToCart(idProduct, new Item(product, quantity),quantity);
                    }
                    break;
                case "remove":
                    cart.removeToCart(idProduct);
                    break;
                case "delete":
                    cart.clearCart(idProduct);
                    break;
                case "update":
                    int quantity1 = Integer.parseInt(request.getParameter("quantity"));
                    cart.updateCart(idProduct, new Item(product,quantity1),quantity1);
                    break;
                
            }
        } catch (NumberFormatException | SQLException e) {
            response.sendRedirect(request.getContextPath()+"/checkout.jsp");
        }
        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath()+"/checkout.jsp");
        
    }
    
}
