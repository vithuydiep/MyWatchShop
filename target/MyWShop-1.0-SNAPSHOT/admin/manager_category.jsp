<%-- 
    Document   : manager_category
    Created on : Dec 19, 2020, 1:36:53 PM
    Author     : Vi Diep
--%>

<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%

        CategoryGet categoryGet = new CategoryGet();
        ArrayList<Category> listCategory = categoryGet.getListCategory();
    %>
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
                                <h3 class="page-title"> Danh mục </h3>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Danh mục</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="row">


                                <div class="col-lg-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Striped Table</h4>
                                            <p class="card-description"> <a href="${pageContext.request.contextPath}/admin/insert_category.jsp">Thêm danh mục</a>
                                            </p>
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th> STT </th>
                                                        <th> Mã danh mục </th>
                                                        <th> Tên danh mục </th>
                                                        <th> Tùy chọn </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                    int count = 0;
                                                    for (Category category : listCategory) {
                                                        count++;

                                                %>
                                                <tr>
                                                    <td >
                                                        <%=count%>
                                                    </td>
                                                    <td> <%=category.getCategoryID()%> </td>
                                                    <td>
                                                        <%=category.getCategoryName()%>
                                                    </td>
                                                    <td> 
                                                <a href="${pageContext.request.contextPath}/admin/update_category.jsp?command=update&category_id=<%=category.getCategoryID()%>">Sửa</a>&nbsp;&nbsp; | &nbsp;&nbsp;
                                                <a href="${pageContext.request.contextPath}/ManagerCategoryServlet?command=delete&category_id=<%=category.getCategoryID()%>">Xóa</a>
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
