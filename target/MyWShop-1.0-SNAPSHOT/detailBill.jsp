<%-- 
    Document   : DetailBill
    Created on : Dec 22, 2020, 12:54:31 PM
    Author     : Vi Diep
--%>

<%@page import="DAO.ProductGet"%>
<%@page import="model.Product"%>
<%@page import="DAO.BillGet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BillDetailGet"%>
<%@page import="model.BillDetail"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            String bill_id = "";
            if (request.getParameter("billid") != null) {
                bill_id = request.getParameter("billid");
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
                                <table class="table table-responsive">
                                    <thead>
                                        <tr>
                                            <th>Sản phẩm</th>
                                            <th>Gía</th>
                                            <th>Số lượng</th>
                                            <th>Tổng giá</th>
                                        </tr>
                                    </thead>

                                <%
                                    ProductGet p = new ProductGet();
                                    ArrayList<BillDetail> list = BillDetailGet.getProductNameByBillID(Long.parseLong(bill_id));
                                    for (BillDetail b : list) {
                                        
                                %>


                                <tr>
                                    <td class="cart_product_img d-flex align-items-center">
                                        <a href="single.jsp?productID=<%= b.getProductID()%>" class="at-in">
                                            <img src="<%=p.getProduct(b.getProductID()).getProductImage()%>" class="fashion-grid" alt="">
                                            <h6><%=p.getProduct(b.getProductID()).getProductName()%> </h6>
                                        </a>

                                    </td>

                                    <td class="price"><span><%= p.getProduct(b.getProductID()).getProductPrice()%> VNĐ</span></td>
                                    <td class="price"><span><%=b.getQuantity() %></span>

                                    </td>
                                    <td class="price"><span><%= b.getPrice()%></span></td>

                                </tr>
                                <% }%>

                            </table>

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
