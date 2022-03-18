<%-- 
    Document   : update_product
    Created on : Dec 19, 2020, 8:14:25 PM
    Author     : Vi Diep
--%>

<%@page import="DAO.ProductGet"%>
<%@page import="model.Product"%>
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

        String productID = "";
        String error = "";
        if (request.getParameter("error") != null) {
            error = (String) request.getParameter("error");
        }
        Product product = new ProductGet().getProduct(Long.parseLong(request.getParameter("product_id")));

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
                                <h3 class="page-title"> Form elements </h3>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Forms</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Form elements</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="row">

                                <div class="col-md-12 grid-margin stretch-card ">
                                    <div class="card ">
                                        <div class="card-body" >
                                            <h4 class="card-title">Danh sách sản phẩm</h4>
                                            <p class="card-description"> Điền vào ô trống </p>
                                            <h6 style="color:red"> ${error}</h6>
                                            <form action="${pageContext.request.contextPath}/ManagerProductServlet" method="post" class="forms-sample">
                                                <div class="form-group row">
                                                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Mã sản phẩm</label>
                                                    <div class="col-sm-9">

                                                        <td><input type="text" class="form-control" name="maSanPham" value="<%=product.getProductID()%>"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Tên sản phẩm</label>
                                                <div class="col-sm-9">

                                                    <input type="text" class="form-control" name="tenSanPham" value="<%=product.getProductName()%>"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputMobile" class="col-sm-3 col-form-label">Loại sản phẩm</label>
                                                <div class="col-sm-9">

                                                    <input type="text" class="form-control" name="maloai" value="<%=product.getCategoryID()%>"><%=error%>

                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Mã thương hiệu</label>
                                                <div class="col-sm-9">

                                                    <input type="text" class="form-control" name="mathuonghieu" value="<%=product.getBrandID()%>">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Hình đại diện</label>
                                                <div class="col-sm-9">

                                                    <input type="text" class="form-control" name="daidien" value="<%=product.getProductImage()%>"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Hình mặt trước</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="mattruoc" value="<%=product.getProductImageForward()%>"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Hình mặt sau</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="matsau" value="<%=product.getProductImageBack()%>"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Gía sản phẩm</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="gia" value="<%=product.getProductPrice()%> VNĐ"><%=error%> 
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Mô tả chi tiết</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="mota" value="<%=product.getProductDescription()%>"><%=error%>
                                                </div>
                                            </div>





                                            <input type="hidden" name="command" value="update">
                                            
                                            <input type="submit" class="btn btn-gradient-primary mr-2" value="Lưu">
                                            
                                        </form>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>

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
