<%-- 
    Document   : checkout
    Created on : Dec 17, 2020, 10:55:41 AM
    Author     : Vi Diep
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Cart"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!DOCTYPE html>


    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Karl - Fashion Ecommerce Template | Checkout</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">

        <!-- Responsive CSS -->
        <link href="css/responsive.css" rel="stylesheet">

    </head>
    <%
        User users = (User) session.getAttribute("user");

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        DecimalFormat formatter = new DecimalFormat("###,###,###");

    %>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <!-- ****** Checkout Area Start ****** -->
            <div class="checkout_area section_padding_100">
                <div class="container">
                    <form action="DeliveryServlet" method="POST"> 
                        <div class="row">

                            <div class="col-12 col-md-6">
                                <div class="checkout_details_area mt-50 clearfix">

                                    <div class="cart-page-heading">
                                        <h5>Billing Address</h5>
                                        <p>Điền vào chỗ trống</p>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                        <%                                        if (users != null) {
                                        %>
                                        <input type="hidden" name="userid" value="<%=users.getUserID() %>">
                                        <%} %>
                                        <label for="first_name">First Name <span>*</span></label>
                                        <input type="text" class="form-control" name="first_name" value="" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="last_name">Last Name <span>*</span></label>
                                        <input type="text" class="form-control" name="last_name" value="" required>
                                    </div>

                                    <div class="col-12 mb-3">
                                        <label for="street_address">Address <span>*</span></label>
                                        <input type="text" class="form-control mb-3" name="address" value="" >
                                    </div>

                                    <div class="col-12 mb-3">
                                        <label for="phone_number">Phone No <span>*</span></label>
                                        <input type="number" class="form-control" name="phone" min="0" value="">
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-5 ml-lg-auto">
                            <div class="order-details-confirmation">

                                <div class="cart-page-heading">
                                    <h5>Your Order</h5>
                                    <p>The Details</p>
                                </div>

                                <ul class="order-details-form mb-4">
                                    <li><span>Sản phẩm</span> <span>Gía</span></li>
                                        <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
                                    <li><span><%= list.getValue().getProduct().getProductName()%></span> <span><%=cart.totalProduct(list.getValue().getProduct().getProductID())%></span></li>
                                            <% }%>
                                    <li><span>Shipping</span> <span>Free</span></li>
                                    <li><span>Total</span> <span><%=formatter.format(cart.totalCart())%> VNĐ </span></li>
                                </ul>
                                <input type="submit" class="btn karl-checkout-btn" value="Place Order">
                            </div>
                        </div>
                    </div>
                </form>            

            </div>
            <!-- ****** Checkout Area End ****** -->
            <br>
            <br>

            <jsp:include page="footer.jsp"></jsp:include>
            <!-- ****** Footer Area End ****** -->
        </div>
        <!-- /.wrapper end -->

        <!-- jQuery (Necessary for All JavaScript Plugins) -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="js/plugins.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>

    </body>

</html>
