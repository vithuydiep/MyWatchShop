<%-- 
    Document   : manager_product
    Created on : Dec 19, 2020, 1:38:07 PM
    Author     : Vi Diep
--%>

<%@page import="model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.ProductGet"%>
<%@page import="DAO.BrandGet"%>
<%@page import="DAO.CategoryGet"%>
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
                                <h3 class="page-title"> S???n ph???m </h3>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Trang ch???</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">S???n ph???m</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Striped Table</h4>
                                            <p class="card-description"> <a href="${pageContext.request.contextPath}/admin/insert_product.jsp">Th??m s???n ph???m</a>
                                            </p>
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>

                                                        <th> M?? s???n ph???m </th>
                                                        <th> T??n s???n ph???m </th>
                                                        <th> Th????ng hi???u </th>
                                                        <th> H??nh ?????i di???n </th>
                                                        <th> Gi?? </th>
                                                        <th> S??? l?????ng hi???n t???i</th>
                                                        <th> M?? t??? </th>
                                                        <th> T??y ch???n </th>
                                                        <th> </th>

                                                    </tr>
                                                </thead>
                                                <tbody>
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
                                                    <td><%=product.getCurrent() %></td>
                                                    <td><a href="${pageContext.request.contextPath}/admin/update_product.jsp?command=update&product_id=<%=product.getProductID()%>">Xem chi ti???t</a></td>
                                                    <td> 
                                                        <a href="${pageContext.request.contextPath}/admin/update_product.jsp?command=update&product_id=<%=product.getProductID()%>">S???a</a>&nbsp;| &nbsp;
                                                        <a href="${pageContext.request.contextPath}/ManagerProductServlet?command=delete&product_id=<%=product.getProductID()%>">X??a</a>
                                                    </td>


                                                </tr>
                                                <% }%>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>








                        </div>

                    </div>


                </div>
                <!-- page-body-wrapper ends -->
            </div>
            <!-- container-scroller -->

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

</html>
