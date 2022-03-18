<%-- 
    Document   : myaccount
    Created on : Dec 18, 2020, 2:53:50 PM
    Author     : Vi Diep
--%>

<%@page import="model.BillDetail"%>
<%@page import="DAO.ProductGet"%>
<%@page import="model.Bill"%>
<%@page import="DAO.UserGet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BillGet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="checkout_area section_padding_100">
                <div class="container">
                    <form action="UserServlet" method="POST"> 
                        <div class="row">
                            <div class="col-12 col-md-6  ml-lg-5 ">
                                <input type="hidden"/>
                            </div>
                            <div class="col-12 col-md-6  ml-lg-5 ">
                                <div class="order-details-confirmation">

                                    <div class="cart-page-heading">
                                        <h5>Thay đổi thông tin</h5>
                                        <p>Điền vào chỗ trống</p>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <label for="first_name">User Name <span>*</span></label>
                                            <input type="hidden" name="user_id" id="name" value="<%=user.getUserID()%>">

                                        <input type="text" class="form-control" name="username" value="<%=user.getUserName()%>" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <label for="street_address">Email <span>*</span></label>
                                        <input type="text" class="form-control mb-3" name="useremail" id="email" value="<%=user.getUserEmail()%>" >
                                        <input type="hidden" name="role"  value="0">
                                    </div>

                                    <div class="col-12 mb-3">
                                        <label for="phone_number">Phone No <span>*</span></label>
                                        <input type="number" class="form-control" name="phone" min="0" id="phone" value="<%=user.getUserPhone()%>">     
                                    </div>

                                    <div class="col-12 mb-3">
                                        <label for="password">Password <span>*</span></label>
                                        <input type="password" class="form-control" name="confirm_pass" id="confirm_pass" value="<%=user.getUserPass()%>">     
                                    </div>

                                    <div class="col-12 mb-3">
                                        <label for="password">Confirm Password <span>*</span></label>
                                        <input type="password" class="form-control" name="pass" id="pass" value="<%=user.getUserPass()%>">
                                        <script>$('#pass, #confirm_pass').on('keyup', function () {
                                                if ($('#pass').val() == $('#confirm_pass').val()) {
                                                    $('#message').html('Trùng khớp').css('color', 'green');
                                                } else
                                                    $('#message').html('Không trùng khớp').css('color', 'red');
                                            });

                                        </script>
                                        <span></span><span id='message'></span>

                                    </div>
                                    <input type="hidden" value="update" name="command">
                                    <input type="submit" class="btn karl-checkout-btn" value="Chỉnh sửa thông tin">
                                </div>

                            </div>
                        </div>








                    </div>
                </form>

            </div>
        </div>
        <!-- ****** Popular Brands Area End ****** -->

        <!-- ****** Footer Area Start ****** -->

        <!-- ****** Footer Area End ****** -->


        <jsp:include page="footer.jsp"></jsp:include>
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
