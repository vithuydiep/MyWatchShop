<%-- 
    Document   : historycard
    Created on : Dec 18, 2020, 3:00:58 PM
    Author     : Vi Diep
--%>

<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Item"%>
<%@page import="model.Bill"%>
<%@page import="DAO.UserGet"%>
<%@page import="model.BillDetail"%>
<%@page import="DAO.ProductGet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BillGet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.User"%>
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
        <title>MyW | Home</title>

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
        if (users == null) {
            response.sendRedirect("${pageContext.request.contextPath}/login.jsp");
        }
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        long user_id = users.getUserID();

        BillGet billGet = new BillGet();
        ArrayList<Bill> listBillByUser = billGet.getListBillByUser(user_id);
        UserGet userGet = new UserGet();
        ProductGet productGet = new ProductGet();
        BillDetail billdetail = new BillDetail();

        User user = new UserGet().getUser(user_id);
    %>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <br>
            <h5 class="text-center">Lịch sử mua hàng</h5>
            <div class="cart_area section_padding_100 clearfix">
                <div class="container">
                    <div class="row">

                        <div class="col-12">
                            <div class="cart-table clearfix">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Mã Hóa Đơn</th>
                                            <th>Tổng Hóa Đơn</th>
                                            <th>Thanh Toán</th>
                                            <th>Địa Chỉ</th>
                                            <th>Ngày Mua</th>
                                            <th>Chi tiết</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        int count = 0;
                                        for (Bill bill : listBillByUser) {
                                            count++;
                                    %>

                                    <tr>
                                        <td><%=count%></td>
                                        <td><a href="" ></a><%=bill.getBillID()%></td>
                                        <td><%=formatter.format(bill.getTotal())%> VNĐ</td>
                                        <td><%=bill.getPayment()%></td>
                                        <td><%=bill.getAddress()%></td>
                                        <td><%=bill.getDate()%></td>
                                        <td><a href="detailBill.jsp?billid=<%=bill.getBillID()%>"> Xem chi tiết</a> </td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>

                        <div class="cart-footer d-flex mt-30">
                            <div class="back-to-shop w-50">
                                
                            </div>
                            <div class="update-checkout w-50 text-right">
                                <a href="CartServlet?command=delete&productID=0">clear cart</a>
                                <a href="index.jsp">Continue shooping</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>






















        <jsp:include page="footer.jsp"></jsp:include>
        <!-- ****** Footer Area End ****** -->

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
