<%-- 
    Document   : index
    Created on : Dec 17, 2020, 10:53:41 AM
    Author     : Vi Diep
--%>

<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page import="model.User"%>
<%@page import="DAO.CategoryGet"%>
<%@page import="DAO.BrandGet"%>
<%@page import="DAO.ProductGet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!DOCTYPE html>
    <%
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        ProductGet productGet = new ProductGet();
        BrandGet brandget = new BrandGet();
        String category_id = "";
        String brand_id = "";
        if (request.getParameter("category") != null) {
            category_id = request.getParameter("category");
        }
        if (request.getParameter("brand") != null) {
            brand_id = request.getParameter("brand");
        }
        CategoryGet categoryget = new CategoryGet();


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

            <!-- ****** Welcome Slides Area Start ****** -->
            <section class="welcome_area">
                <div class="welcome_slides owl-carousel">
                    <!-- Single Slide Start -->
                    <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(images/1.jpg);">
                        <div class="container h-100">
                            <div class="row h-100 align-items-center">
                                <div class="col-12">
                                    <div class="welcome_slide_text">
                                        <h6 data-animation="bounceInDown" data-delay="0" data-duration="500ms">* Only today we offer free shipping</h6>
                                        <h2 data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">Fashion Trends</h2>
                                        <a href="products.jsp" class="btn karl-btn" data-animation="fadeInUp" data-delay="1s" data-duration="500ms">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Single Slide Start -->
                    <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(images/2.jpg);">
                        <div class="container h-100">
                            <div class="row h-100 align-items-center">
                                <div class="col-12">
                                    <div class="welcome_slide_text">
                                        <h6 data-animation="fadeInDown" data-delay="0" data-duration="500ms">* Only today we offer free shipping</h6>
                                        <h2 data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">Summer Collection</h2>
                                        <a href="products.jsp" class="btn karl-btn" data-animation="fadeInLeftBig" data-delay="1s" data-duration="500ms">Check Collection</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Single Slide Start -->
                    <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(images/3.jpg);">
                        <div class="container h-100">
                            <div class="row h-100 align-items-center">
                                <div class="col-12">
                                    <div class="welcome_slide_text">
                                        <h6 data-animation="fadeInDown" data-delay="0" data-duration="500ms">* Only today we offer free shipping</h6>
                                        <h2 data-animation="bounceInDown" data-delay="500ms" data-duration="500ms">Women Fashion</h2>
                                        <a href="products.jsp" class="btn karl-btn" data-animation="fadeInRightBig" data-delay="1s" data-duration="500ms">Check Collection</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ****** Welcome Slides Area End ****** -->

            <!-- ****** Top Catagory Area Start ****** -->
            <section class="top_catagory_area d-md-flex clearfix">
                <!-- Single Catagory -->
                <div class="single_catagory_area d-flex align-items-center bg-img" style="background-image: url(images/man.jpg);">
                    <div class="catagory-content">
                        <h6>Watch</h6>
                        <h2>MAN</h2>
                        <a href="products.jsp?category=1" class="btn karl-btn">SHOP NOW</a>
                    </div>
                </div>
                <!-- Single Catagory -->
                <div class="single_catagory_area d-flex align-items-center bg-img" style="background-image: url(images/women.jpg);">
                    <div class="catagory-content">
                        <h6>Women</h6>
                        <h2>Women</h2>
                        <a href="products.jsp?category=2" class="btn karl-btn">SHOP NOW</a>
                    </div>
                </div>
            </section>


            <!-- ****** New Arrivals Area Start ****** -->
            <section class="new_arrivals_area section_padding_100_0 clearfix">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="section_heading text-center">
                                <h2>New Arrivals</h2>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="karl-projects-menu mb-100">
                    <div class="text-center portfolio-menu">
                        <button class="btn active" data-filter="*">ALL</button>
                        <button class="btn" data-filter=".women">WOMAN</button>
                        <button class="btn" data-filter=".man">MAN</button>
                        <button class="btn" data-filter=".kids">KIDS</button>
                    </div>
                </div>

                <div class="container">
                    <div class="row karl-new-arrivals">
                    
                    <% for (Product p : productGet.getList3ProductByCategory(Long.parseLong("1"))) {
                    %>

                    <!-- Single gallery Item Start -->
                    <div class="col-12 col-sm-6 col-md-4 single_gallery_item man wow fadeInUpBig" data-wow-delay="0.2s">
                        <!-- Product Image -->
                        <div class="product-img">
                            <img src="<%=p.getProductImage()%>" alt="">
                            <div class="product-quicview">
                                <a href="single.jsp?productID=<%=p.getProductID()%>"></a>
                            </div>
                        </div>
                        <!-- Product Description -->
                        <div class="product-description">
                            <h4 class="product-price"><%=formatter.format(p.getProductPrice())%> VNĐ</h4>
                            <p><%=p.getProductName()%></p>
                            <!-- Add to Cart -->
                            <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>&quantity=1" class="add-to-cart-btn">ADD TO CART</a>
                        </div>
                    </div>
                    <% } %>
                     <% for (Product p : productGet.getList3ProductByCategory(Long.parseLong("2"))) {
                    %>

                    <!-- Single gallery Item Start -->
                    <div class="col-12 col-sm-6 col-md-4 single_gallery_item women wow fadeInUpBig" data-wow-delay="0.2s">
                        <!-- Product Image -->
                        <div class="product-img">
                            <img src="<%=p.getProductImage()%>" alt="">
                            <div class="product-quicview">
                                <a href="single.jsp?productID=<%=p.getProductID()%>"></a>
                            </div>
                        </div>
                        <!-- Product Description -->
                        <div class="product-description">
                            <h4 class="product-price"><%=formatter.format(p.getProductPrice())%> VNĐ</h4>
                            <p><%=p.getProductName()%></p>
                            <!-- Add to Cart -->
                            <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>&quantity=1" class="add-to-cart-btn">ADD TO CART</a>
                        </div>
                    </div>
                    <% } %>
                     <% for (Product p : productGet.getList3ProductByCategory(Long.parseLong("3"))) {
                    %>

                    <!-- Single gallery Item Start -->
                    <div class="col-12 col-sm-6 col-md-4 single_gallery_item kids wow fadeInUpBig" data-wow-delay="0.2s">
                        <!-- Product Image -->
                        <div class="product-img">
                            <img src="<%=p.getProductImage()%>" alt="">
                            <div class="product-quicview">
                                <a href="single.jsp?productID=<%=p.getProductID()%>"></a>
                            </div>
                        </div>
                        <!-- Product Description -->
                        <div class="product-description">
                            <h4 class="product-price"><%=formatter.format(p.getProductPrice())%> VNĐ</h4>
                            <p><%=p.getProductName()%></p>
                            <!-- Add to Cart -->
                            <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>&quantity=1" class="add-to-cart-btn">ADD TO CART</a>
                        </div>
                    </div>
                    <% } %>



                </div>
            </div>
        </section>
        <!-- ****** New Arrivals Area End ****** -->

        <!-- ****** Offer Area Start ****** -->
        <section class="offer_area height-700 section_padding_100 bg-img" style="background-image: url(images/dh.jfif);">
            <div class="container h-100">
                <div class="row h-100 align-items-end justify-content-end">
                    <div class="col-12 col-md-8 col-lg-6">
                        <div class="offer-content-area wow fadeInUp" data-wow-delay="1s">
                            <h2>Đồng hồ cơ mới <span class="karl-level">Hot</span></h2>
                            <p>* Free shipping until 25 Dec 2020</p>
                            <div class="offer-product-price">
                                <h3><span class="regular-price"><%= formatter.format(18999000)%></span><%= formatter.format(14999000)%> VN</h3>
                            </div>
                            <a href="#" class="btn karl-btn mt-30">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ****** Offer Area End ****** -->

        <!-- ****** Popular Brands Area Start ****** -->
        <section class="karl-testimonials-area section_padding_100">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_heading text-center">
                            <h2>Testimonials</h2>
                        </div>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col-12 col-md-8">
                        <div class="karl-testimonials-slides owl-carousel">

                            <!-- Single Testimonial Area -->
                            <div class="single-testimonial-area text-center">
                                <span class="quote">"</span>
                                <h6>Thiết kế sang trọng, hàng chất lượng! Mãi ủng hộ shop <3 </h6>
                                <div class="testimonial-info d-flex align-items-center justify-content-center">
                                    <div class="tes-thumbnail">
                                        <img src="images/nx1.jpg" alt="">
                                    </div>
                                    <div class="testi-data">
                                        <p>Diệp Thúy Vi</p>
                                        <span>Tp Hồ Chí Minh</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Testimonial Area -->
                            <div class="single-testimonial-area text-center">
                                <span class="quote">"</span>
                                <h6>Thiết kế sang trọng, hàng chất lượng! Mãi ủng hộ shop <3 </h6>
                                <div class="testimonial-info d-flex align-items-center justify-content-center">
                                    <div class="tes-thumbnail">
                                        <img src="images/nx1.jpg" alt="">
                                    </div>
                                    <div class="testi-data">
                                        <p>Diệp Thúy Vi</p>
                                        <span>Tp Hồ Chí Minh</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Testimonial Area -->
                            <div class="single-testimonial-area text-center">
                                <span class="quote">"</span>
                                <h6>Thiết kế sang trọng, hàng chất lượng! Mãi ủng hộ shop <3 </h6>
                                <div class="testimonial-info d-flex align-items-center justify-content-center">
                                    <div class="tes-thumbnail">
                                        <img src="images/nx1.jpg" alt="">
                                    </div>
                                    <div class="testi-data">
                                        <p>Diệp Thúy Vi</p>
                                        <span>Tp Hồ Chí Minh</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- ****** Popular Brands Area End ****** -->

        <!-- ****** Footer Area Start ****** -->
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

