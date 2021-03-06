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
                                            <h4 class="card-title">Th??m s???n ph???m m???i</h4>
                                            <p class="card-description"> ??i???n v??o ?? tr???ng </p>
                                            <form method="post" action="${pageContext.request.contextPath}/InsertProductServletx" class="forms-sample" enctype="multipart/form-data">
                                                <div class="form-group row">
                                                    <input type="hidden" class="sedang" name="maSanPham"><%=error%>


                                            </div>

                                            <div class="form-group row">
                                                <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Lo???i danh m???c </label>
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
                                                <label for="exampleInputMobile" class="col-sm-3 col-form-label">T??n s???n ph???m</label>
                                                <div class="col-sm-9">

                                                    <input type="text" class="form-control" name="tenSanPham" placehoder="T??n s???n ph???m"><%=error%>

                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">M?? th????ng hi???u</label>
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
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">H??nh ?????i di???n</label>
                                                <div class="col-sm-9">
                                                    <input type="file" placeholder="images/t??nh??nh.jpg" class="form-control" name="daidien"><%=error%>

                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">H??nh m???t tr?????c</label>
                                                <div class="col-sm-9">
                                                    <input type="file" placeholder="images/t??nh??nh.jpg" class="form-control" name="mattruoc"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">H??nh m???t sau</label>
                                                <div class="col-sm-9">
                                                    <input type="file" placeholder="images/t??nh??nh.jpg" class="form-control" name="matsau"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label">G??a s???n ph???m</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" name="gia"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label"> M?? t??? chi ti???t </label>
                                                <div class="col-sm-9">
                                                    <input type="text"  class="form-control" placeholder="" name="mota"><%=error%>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label"> S??? l?????ng </label>
                                                <div class="col-sm-9">
                                                    <input type="text"  class="form-control" placeholder="" name="soluong"><%=error%>
                                                </div>
                                            </div>




                                            <input type="submit" class="btn btn-gradient-primary mr-2" value="Th??m s???n ph???m">





                                            <button class="btn btn-light">Cancel</button>
                                        </form>
                                        <form method="post" action="${pageContext.request.contextPath}/UploadProductServlet" enctype='multipart/form-data'>
                                            <div class="form-group row">
                                                <label for="exampleInputPassword2" class="col-sm-3 col-form-label" > Up h??nh s???n ph???m </label>

                                                <input type="file" class="form-control" name="uploadFile">
                                                <input type="file" class="form-control" name="uploadFile">
                                                <input type="file" class="form-control" name="uploadFile">


                                            </div>
                                            <input type="submit" class="btn btn-gradient-primary mr-2" value="T???i l??n" />
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
