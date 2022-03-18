<%-- 
    Document   : checkout
    Created on : Dec 17, 2020, 10:56:58 AM
    Author     : Vi Diep
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Cart"%>
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
        <title>Karl - Fashion Ecommerce Template | Cart</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">

        <!-- Responsive CSS -->
        <link href="css/responsive.css" rel="stylesheet">

    </head>

    <body>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            DecimalFormat formatter = new DecimalFormat("###,###,###");
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <!-- ****** Top Discount Area Start ****** -->

            <!-- ****** Top Discount Area End ****** -->

            <!-- ****** Cart Area Start ****** -->

            <div class="cart_area section_padding_100 clearfix">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="cart-table clearfix">
                                <form action="CartServlet" method="post">
                                    <table class="table table-responsive">
                                        <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th>Gía</th>
                                                <th>Số lượng</th>
                                                <th>Tổng giá</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>

                                        <tr>
                                            <td class="cart_product_img d-flex align-items-center">
                                                <a href="single.jsp?productID=<%=list.getValue().getProduct().getProductID()%>" class="at-in">
                                                    <img src="<%=list.getValue().getProduct().getProductImage()%>" class="fashion-grid" alt="">
                                                    <h6><%= list.getValue().getProduct().getProductName()%> </h6>
                                                </a>

                                            </td>

                                            <td  class="price"><span id="price"><%=list.getValue().getProduct().getProductPrice()%></span></td>
                                            <td class="qty">
                                                <div class="quantity">
                                                    <span class="qty-minus" onclick="myFunctionMinus(<%=list.getValue().getProduct().getProductPrice()%>,<%=list.hashCode()%>,<%=list.getKey()%>)"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                    <input type="number" class="qty-text" id="<%=list.hashCode()%>" step="1" min="1" max="99" name="quantity" value="<%=list.getValue().getQuantity()%>">
                                                    <span id="tang" class="qty-plus" onclick="myFunctionFlus(<%=list.getValue().getProduct().getCurrent()%>,<%=list.getValue().getProduct().getProductPrice()%>,<%=list.hashCode()%>,<%=list.getKey()%>)"><i class="fa fa-plus" aria-hidden="true"></i></span>

                                                </div>
                                            </td>
                                            <td class="total_price"><span id="<%=list.getKey()%>"><%=cart.totalProduct(list.getValue().getProduct().getProductID())%> </span></td>
                                            <td class="t-data"><a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>" ><input type="button" class="btn cart-submit d-block" value="Delete"></a></td>
                                            <input type="hidden" name="command" value="update">
                                            <input type="hidden" name="productID" value="<%=list.getValue().getProduct().getProductID()%>">
                                            <td><input type="submit" class="btn cart-submit d-block" value="Update"></td>    


                                    </tr>
                                    <% }%>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <script>
                            function myFunctionFlus(above, price, key, total) {
                                var i = document.getElementById(key).value;
                                if (i >= above)
                                {
                                    document.getElementById(key).value = above;
                                } else {

                                    var new_i = ++i;
                                    document.getElementById(key).value = new_i;
                                    var total1 = new_i * price;
                                    document.getElementById(total).innerHTML = total1;
                                }

                            }

                            function myFunctionMinus(price, key, total) {
                                var i = document.getElementById(key).value;
                                if (i <= 1)
                                {
                                    document.getElementById(key).value = 1;
                                } else
                                {
                                    var new_i = i - 1;
                                    document.getElementById(key).value = new_i;
                                    var total1 = new_i * price;
                                    document.getElementById(total).innerHTML = total1;
                                }
                            }
                        </script>
                        <form action="CartServlet" method="post">
                            <div class="cart-footer d-flex mt-30">
                                <div class="back-to-shop w-50">
                                    <a href="index.jsp">Continue shopping</a>
                                </div>

                                <div class="update-checkout w-50 text-right">
                                    <a href="CartServlet?command=delete&productID=0">clear cart</a>



                                </div>


                            </div>
                        </form>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-md-6 col-lg-4">

                    </div>
                    <div class="col-12 col-md-6 col-lg-4">

                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-total-area mt-70">
                            <div class="cart-page-heading">
                                <h5>Cart total</h5>
                                <p>Final info</p>
                            </div>

                            <ul class="cart-total-chart">
                                <li><span>Subtotal</span> <span><%=formatter.format(cart.totalCart())%> VNĐ</span></li>
                                <li><span>Shipping</span> <span>Free</span></li>
                                <li><span><strong>Total</strong></span> <span><strong><%=formatter.format(cart.totalCart())%> VNĐ</strong></span></li>
                            </ul>
                            <a href="delivery.jsp" class="btn karl-checkout-btn">Proceed to checkout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ****** Cart Area End ****** -->
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
</html>
