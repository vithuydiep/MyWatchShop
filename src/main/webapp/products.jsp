<%-- 
    Document   : products
    Created on : Dec 17, 2020, 12:05:47 PM
    Author     : Vi Diep
--%>

<%@page import="model.Brand"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="DAO.CategoryGet"%>
<%@page import="DAO.BrandGet"%>
<%@page import="DAO.ProductGet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Karl - Fashion Ecommerce Template | Home</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">

        <!-- Responsive CSS -->
        <link href="css/responsive.css" rel="stylesheet">


    </head>
    <%
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        ProductGet productGet = new ProductGet();
        BrandGet brandget = new BrandGet();
        String category_id = "0";
        String brand_id = "";
        if (request.getParameter("category") != null) {
            category_id = request.getParameter("category");
        }
        if (request.getParameter("brand") != null) {
            brand_id = request.getParameter("brand");
        }
        CategoryGet categoryget = new CategoryGet();
        String category_id_1 = "1";


    %>

    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <section class="shop_grid_area section_padding_100">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-4 col-lg-3">
                            <div class="shop_sidebar_area">

                                <div class="widget catagory mb-50">
                                    <!--  Side Nav  -->
                                    <div class="nav-side-menu">
                                        <h6 class="mb-0">Catagories</h6>
                                        <div class="menu-list">
                                            <ul id="menu-content2" class="menu-content collapse out">
                                                <!-- Single Item -->
                                            <%   for (Category c : categoryget.getListCategory()) {
                                            %>
                                            <li data-toggle="collapse" data-target="#women2">
                                                <a href="products.jsp?category=<%=c.getCategoryID()%>"><%=c.getCategoryName()%></a>
                                            </li>
                                            <% } %>

                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="widget catagory mb-50">
                                <!--  Side Nav  -->
                                <div class="nav-side-menu">
                                    <h6 class="mb-0">Brand</h6>
                                    <div class="menu-list">
                                        <ul id="menu-content2" class="menu-content collapse out">
                                            <!-- Single Item -->
                                            <%   for (Brand b : brandget.getListBrand()) {
                                            %>
                                            <li data-toggle="collapse" data-target="#women2">
                                                <a href="products.jsp?brand=<%=b.getBrandID()%>"><%=b.getBrandName()%></a>
                                            </li>
                                            <% } %>

                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="widget price mb-50">
                                <h6 class="widget-title mb-30">Filter by Price</h6>
                                <div class="widget-desc">
                                    <div class="slider-range">
                                        <div data-min="0" data-max="3000" data-unit ="VND" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="0" data-value-max="1350" data-label-result="Price:">
                                            <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                            <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                            <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                        </div>
                                        <div class="range-price">Price: 0 - 1350</div>
                                    </div>
                                </div>
                            </div>





                            <div class="widget recommended">
                                <h6 class="widget-title mb-30">Recommended</h6>

                                <div class="widget-desc">
                                    <%
                                        for (Product p : productGet.getList3ProductByCategory(Long.parseLong(category_id_1))) {
                                    %>
                                    <!-- Single Recommended Product -->
                                    <div class="single-recommended-product d-flex mb-30">
                                        <div class="single-recommended-thumb mr-3">
                                            <a href="single.jsp?productID=<%=p.getProductID()%>"><img class="img-responsive " src="<%=p.getProductImageForward()%>" alt=""></a>
                                        </div>
                                        <div class="single-recommended-desc">
                                            <h6><%=p.getProductName()%></h6>
                                            <p><%=formatter.format(p.getProductPrice())%> VNĐ</p>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-8 col-lg-9">
                        <div class="shop_grid_product_area">
                            <div class="row">
                                <%
                                    if (brand_id == "") {
                                        for (Product p : productGet.getListProductByCategory(Long.parseLong(category_id))) {
                                %>

                                <!-- Single gallery Item Start -->
                                <div class="col-12 col-sm-6 col-md-4 single_gallery_item women wow fadeInUpBig" data-wow-delay="0.2s">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="single.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt=""></a>

                                    </div>
                                    <!-- Product Description -->
                                    <div class="product-description">
                                        <h4 class="product-price"><%=formatter.format(p.getProductPrice())%> VNĐ</h4>
                                        <p><%=p.getProductName()%></p>
                                        <!-- Add to Cart -->
                                        <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>&quantity=1" class="add-to-cart-btn">ADD TO CART</a>
                                    </div>
                                </div>
                                <%}
                                } else {
                                    for (Product p : productGet.getListProductByBrand(Long.parseLong(brand_id))) {%>
                                <div class="col-12 col-sm-6 col-md-4 single_gallery_item women wow fadeInUpBig" data-wow-delay="0.2s">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <a href="single.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt=""></a>

                                    </div>
                                    <!-- Product Description -->
                                    <div class="product-description">
                                        <h4 class="product-price"><%=formatter.format(p.getProductPrice())%> VNĐ</h4>
                                        <p><%=p.getProductName()%></p>
                                        <!-- Add to Cart -->
                                        <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>&quantity=1" class="add-to-cart-btn">ADD TO CART</a>
                                    </div>
                                </div>

                                <%}
                                    }%>

                            </div>
                        </div>

                        <div class="shop_pagination_area wow fadeInUp" data-wow-delay="1.1s">
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-sm">
                                    <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp"></jsp:include>


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
