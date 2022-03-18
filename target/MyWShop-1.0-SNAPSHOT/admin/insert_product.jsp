<%-- 
    Document   : insert
    Created on : Dec 19, 2020, 9:24:00 PM
    Author     : Vi Diep
--%>

<%@page import="model.Brand"%>
<%@page import="model.Category"%>
<%@page import="DAO.BrandGet"%>
<%@page import="DAO.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">  
        <title>MyW Admin</title>
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
        CategoryGet categoryget = new CategoryGet();
        BrandGet brandget = new BrandGet();

        String error = "";
        if (request.getParameter("error") != null) {
            error = (String) request.getParameter("error");
        }
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
                                            <h4 class="card-title">Thêm sản phẩm mới</h4>
                                            <p class="card-description"> Điền vào ô trống </p>
                                            <form method="post" action="${pageContext.request.contextPath}/InsertProductServletx" class="forms-sample" enctype="multipart/form-data">
                                                <div class="form-group row">
                                                    <input type="hidden" class="sedang" name="maSanPham"><%=error%>


                                            </div>

                                            <div class="form-group row">
                                                <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Loại danh mục </label>
                                                <div class="col-sm-9">
                                                    <div>
                                                        <span></span>
                                                        <select class="form-control" name="maloai">
                                                            <%
                                                                for (Category c : categoryget.getListCategory()) {
                                                            %>
                                                            <option value="<%=c.getCategoryID()%>"><%=c.getCategoryName()%></option>
                                                            <% }%>

                                                        </select>
                                                    </div>
                                                    <input type="hidden" class="form-control" name=""><%=error%>

                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="exampleInputMobile" class="col-sm-3 col-form-label">Tên sản phẩm</label>
                                                <div class="col-sm-9">

                                                    <input type="text" class="form-control" name="tenSanPham" placehoder="Tên sản phẩm"><%=error%>

                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Mã thương hiệu</label>
                                                <div class="col-sm-9">

                                                    <select class="form-control" name="mathuonghieu">
                                                        <%
                                                            for (Brand b : brandget.getListBrand()) {
                                                        %>
                                                        <option value="<%=b.getBrandID()%>"><%=b.getBrandName()%></option>
                                                        <% }%>

                                                    </select>
                                                </div>
                                                <input type="hidden" class="sedang" name=""><%=error%>
                                            </div>

                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Hình đại diện</label>
                                                <div class="col-sm-9">
                                                    <input type="file" placeholder="images/tênhình.jpg" class="form-control" name="daidien"><%=error%>

                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Hình mặt trước</label>
                                                <div class="col-sm-9">
                                                    <input type="file" placeholder="images/tênhình.jpg" class="form-control" name="mattruoc"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Hình mặt sau</label>
                                                <div class="col-sm-9">
                                                    <input type="file" placeholder="images/tênhình.jpg" class="form-control" name="matsau"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Gía sản phẩm</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="gia"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label"> Mô tả chi tiết </label>
                                                <div class="col-sm-9">
                                                    <input type="text"  class="form-control" placeholder="" name="mota"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label"> Số lượng </label>
                                                <div class="col-sm-9">
                                                    <input type="text"  class="form-control" placeholder="" name="soluong"><%=error%>
                                                </div>
                                            </div>




                                            <input type="submit" class="btn btn-gradient-primary mr-2" value="Thêm sản phẩm">





                                            <button class="btn btn-light">Cancel</button>
                                        </form>
                                        <form method="post" action="${pageContext.request.contextPath}/UploadProductServlet" enctype='multipart/form-data'>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label" > Up hình sản phẩm </label>

                                                <input type="file" class="form-control" name="uploadFile">
                                                <input type="file" class="form-control" name="uploadFile">
                                                <input type="file" class="form-control" name="uploadFile">


                                            </div>
                                            <input type="submit" class="btn btn-gradient-primary mr-2" value="Tải lên" />
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
