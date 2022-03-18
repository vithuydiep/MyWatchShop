<%-- 
    Document   : home
    Created on : Dec 19, 2020, 12:58:00 PM
    Author     : Vi Diep
--%>

<%@page import="model.Product"%>
<%@page import="DAO.ProductGet"%>
<%@page import="DAO.BrandGet"%>
<%@page import="DAO.CategoryGet"%>
<%@page import="model.Bill"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.UserGet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BillGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Purple Admin</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <!-- endinject -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="assets/css/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="assets/images/favicon.ico" />
    </head>
    <%
        CategoryGet categoryGet = new CategoryGet();
        BrandGet brandGet = new BrandGet();
        ProductGet productGet = new ProductGet();
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        long productID;
        ArrayList<Product> listProduct = productGet.getListProduct();
        BillGet billGet = new BillGet();
        ArrayList<Bill> listBill = billGet.getListBill();

        UserGet userGet = new UserGet();
        
    %>
    <body>
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <jsp:include page="narbar.jsp"></jsp:include>
                <!-- partial -->
                <div class="container-fluid page-body-wrapper">
                    <!-- partial:partials/_sidebar.html -->
                <jsp:include page="menu.jsp"></jsp:include>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">

                        <div class="page-header">
                            <h3 class="page-title">
                                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                                    <i class="mdi mdi-home"></i>
                                </span> Dashboard
                            </h3>
                            <nav aria-label="breadcrumb">
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item active" aria-current="page">
                                        <span></span>Overview <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="row">
                            <div class="col-md-4 stretch-card grid-margin">
                                <div class="card bg-gradient-danger card-img-holder text-white">
                                    <div class="card-body">
                                        <a href="manager_user.jsp">
                                        <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                        <h4 class="font-weight-normal mb-3">Manager User <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                                        </h4>
                                        <h2 class="mb-5"><%=userGet.countUser()%></h2>
                                        
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 stretch-card grid-margin">
                                <div class="card bg-gradient-info card-img-holder text-white">
                                    <div class="card-body">
                                        <a href="manager_product.jsp">
                                        <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                        <h4 class="font-weight-normal mb-3">Manager Product <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                        </h4>
                                        <h2 class="mb-5"><%=productGet.countProduct() %></h2>
                                        
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 stretch-card grid-margin">
                                <div class="card bg-gradient-success card-img-holder text-white">
                                    <div class="card-body">
                                        <a href="manager_brand.jsp">
                                        <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                        <h4 class="font-weight-normal mb-3">Manager brand <i class="mdi mdi-diamond mdi-24px float-right"></i>
                                        </h4>
                                        <h2 class="mb-5"><%=brandGet.countBrand() %></h2>
                                       
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Danh sách sản phẩm</h4>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th> Mã sản phẩm </th>
                                                        <th> Tên sản phẩm </th>
                                                        <th> Thương hiệu </th>
                                                        <th> Hình đại diện </th>
                                                        <th> Giá </th>
                                                        <th> Mô tả </th>
                                                        
                                                    </tr>
                                                </thead>
                                                 <%                                                            int count = 0;
                                                    for (Product product : listProduct) {
                                                        count++;

                                                %>
                                                <tr>

                                                    <td> <%=product.getProductID()%> </td>
                                                    <td>
                                                        <%=categoryGet.getCategory(product.getCategoryID()).getCategoryName()%>
                                                    </td>
                                                    <td><%=brandGet.getBrand(product.getBrandID()).getBrandName()%></td>
                                                    <td><img class="hinhql" src="${pageContext.request.contextPath}/<%=product.getProductImage()%>"/></td>

                                                    <td><%=formatter.format(product.getProductPrice())%></td>

                                                    <td><a href="${pageContext.request.contextPath}/admin/update_product.jsp?command=update&product_id=<%=product.getProductID()%>">Xem chi tiết</a></td>
                                                   


                                                </tr>
                                                <% }%>

                                            </tbody>
                                               
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">


                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Striped Table</h4>


                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>

                                                        <th> Mã hóa đơn </th>
                                                        <th> Khách hàng </th>
                                                        <th> Tổng hóa đơn </th>
                                                        <th> Thanh toán </th>
                                                        <th> Địa chỉ giao hàng </th>
                                                        <th> Ngày mua </th>

                                                        


                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <%for (Bill bill : listBill) {%>
                                                <tr>

                                                    <td> <%=bill.getBillID()%> </td>
                                                    <td>
                                                        <%=userGet.getUser(bill.getUserID()).getUserName()%>
                                                    </td>
                                                    <td><%=formatter.format(bill.getTotal())%></td>
                                                    <td><%=bill.getPayment()%></td>
                                                    <td><%=bill.getAddress()%></td>
                                                    <td><%=bill.getDate()%></td>
                                                    

                                                </tr>
                                                <% }%>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>





                            <!-- content-wrapper ends -->
                            <!-- partial:partials/_footer.html -->
                            <footer class="footer">
                                <div class="container-fluid clearfix">
                                    <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>
                                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin templates </a> from Bootstrapdash.com</span>
                                </div>
                            </footer>
                            <!-- partial -->
                        </div>
                        <!-- main-panel ends -->
                    </div>
                    <!-- page-body-wrapper ends -->
                </div>
                <!-- container-scroller -->
            </div>
            <!-- plugins:js -->
            <script src="assets/vendors/js/vendor.bundle.base.js"></script>
            <!-- endinject -->
            <!-- Plugin js for this page -->
            <script src="assets/vendors/chart.js/Chart.min.js"></script>
            <!-- End plugin js for this page -->
            <!-- inject:js -->
            <script src="assets/js/off-canvas.js"></script>
            <script src="assets/js/hoverable-collapse.js"></script>
            <script src="assets/js/misc.js"></script>
            <!-- endinject -->
            <!-- Custom js for this page -->
            <script src="assets/js/dashboard.js"></script>
            <script src="assets/js/todolist.js"></script>
            <!-- End custom js for this page -->
    </body>
</html>
