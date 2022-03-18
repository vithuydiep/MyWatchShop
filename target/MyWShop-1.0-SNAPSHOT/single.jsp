<%-- 
    Document   : single
    Created on : Dec 17, 2020, 10:58:21 AM
    Author     : Vi Diep
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.CategoryGet"%>
<%@page import="model.Review"%>
<%@page import="DAO.ReviewGet"%>
<%@page import="model.Product"%>
<%@page import="DAO.BrandGet"%>
<%@page import="DAO.ProductGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

</script>
<%
    ProductGet productGet = new ProductGet();

    BrandGet brandget = new BrandGet();
    Product product = new Product();
    String productID = "";
    if (request.getParameter("productID") != null) {
        productID = request.getParameter("productID");
        product = productGet.getProduct(Long.parseLong(productID));
    }
    ReviewGet reviewGet = new ReviewGet();
    long category_id = product.getCategoryID();
    Review review = new Review();
    CategoryGet categoryget = new CategoryGet();
    String category_id_1 = "1";
    DecimalFormat formatter = new DecimalFormat("###,###,###");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <!DOCTYPE html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Karl - Fashion Ecommerce Template | Product Details</title>

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
            <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area Start <<<<<<<<<<<<<<<<<<<< -->
            <div class="breadcumb_area">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <ol class="breadcrumb d-flex align-items-center">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Dresses</a></li>
                                <li class="breadcrumb-item active">Long Dress</li>
                            </ol>
                            <!-- btn -->
                            <a href="#" class="backToHome d-block"><i class="fa fa-angle-double-left"></i> Back to Category</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area End <<<<<<<<<<<<<<<<<<<< -->

            <!-- <<<<<<<<<<<<<<<<<<<< Single Product Details Area Start >>>>>>>>>>>>>>>>>>>>>>>>> -->
            <section class="single_product_details_area section_padding_0_100">
                <div class="container">
                    <div class="row">


                        <div class="col-12 col-md-6">
                            <div class="single_product_thumb">
                                <div id="product_details_slider" class="carousel slide" data-ride="carousel">

                                    <ol class="carousel-indicators">
                                        <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(<%=product.getProductImageForward()%>)">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(<%=product.getProductImageBack()%>)">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(<%=product.getProductImageForward()%>)">
                                    </li>

                                </ol>

                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="<%=product.getProductImageForward()%>">
                                            <img class="d-block w-100" src="<%=product.getProductImageForward()%>" alt="First slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="<%=product.getProductImageBack()%>">
                                            <img class="d-block w-100" src="<%=product.getProductImageBack()%>" alt="Second slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="<%=product.getProductImageForward()%>">
                                            <img class="d-block w-100" src="<%=product.getProductImageForward()%>" alt="Third slide">
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="single_product_desc">

                            <h4 class="title"><a href="#"><%=product.getProductName()%></a></h4>

                            <h4 class="price"><%=formatter.format(product.getProductPrice())%> VNĐ</h4>

                            <p class="available">Available: <span class="text-muted">In Stock</span></p>

                            <!--div class="single_product_ratings mb-15">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                            </div-->



                            <!-- Add to Cart Form -->
                            <form class="cart clearfix mb-50 d-flex" method="post" action="CartServlet">
                                <div class="quantity">
                                    <span class="qty-minus" onclick="myFunctionMinus()"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                    <input type="number" class="qty-text" id="qty" step="1" min="1" max="20" name="quantity" value="1">
                                    <span class="qty-plus" onclick="myFunctionFlus(<%=product.getCurrent()%>)"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                </div>
                                <script>
                                    function myFunctionFlus(above) {
                                        var i = document.getElementById("qty").value;
                                        if (i >= above)
                                        {
                                            document.getElementById("qty").value = above;
                                        } else {

                                            var new_i = ++i;
                                            document.getElementById("qty").value = new_i;

                                        }
                                    }
                                    function myFunctionMinus() {
                                        var i = document.getElementById("qty").value;
                                        if (i <= 1)
                                        {
                                            document.getElementById("qty").value = 1;
                                        } else
                                        {
                                            var new_i = i - 1;
                                            document.getElementById("qty").value = new_i;
                                           
                                        }
                                    }
                                </script>
                                <input type="hidden" name="command" value="plus">
                                <input type="hidden" name="productID" value="<%=product.getProductID()%>">
                                <input type="submit" class="btn cart-submit d-block" value="Add to cart">
                            </form>

                            <div id="accordion" role="tablist">
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingOne">
                                        <h6 class="mb-0">
                                            <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Information</a>
                                        </h6>
                                    </div>

                                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                        <div class="card-body">
                                            <p> <%= product.getProductDescription()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingTwo">
                                        <h6 class="mb-0">
                                            <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Cart Details</a>
                                        </h6>
                                    </div>
                                    <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo quis in veritatis officia inventore, tempore provident dignissimos nemo, nulla quaerat. Quibusdam non, eos, voluptatem reprehenderit hic nam! Laboriosam, sapiente! Praesentium.</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia magnam laborum eaque.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingThree">
                                        <h6 class="mb-0">
                                            <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">shipping &amp; Returns</a>
                                        </h6>
                                    </div>
                                    <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse quo sint repudiandae suscipit ab soluta delectus voluptate, vero vitae, tempore maxime rerum iste dolorem mollitia perferendis distinctio. Quibusdam laboriosam rerum distinctio. Repudiandae fugit odit, sequi id!</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae qui maxime consequatur laudantium temporibus ad et. A optio inventore deleniti ipsa.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- <<<<<<<<<<<<<<<<<<<< Single Product Details Area End >>>>>>>>>>>>>>>>>>>>>>>>> -->

        <section class="you_may_like_area clearfix">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_heading text-center">
                            <h2>related Products</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="you_make_like_slider owl-carousel">
                            <%
                                for (Product p : productGet.getListProductByCategory(product.getCategoryID())) {
                            %>

                            <!-- Single gallery Item -->
                            <div class="single_gallery_item">
                                <!-- Product Image -->
                                <div class="product-img">
                                    <a href="single.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt=""></a>

                                </div>
                                <!-- Product Description -->
                                <div class="product-description">
                                    <h4 class="product-price"><%=formatter.format(p.getProductPrice())%> VNĐ</h4>
                                    <p><%=p.getProductName()%></p>
                                    <!-- Add to Cart -->
                                    <a href="CartServlet?command=plus&productID=<%=product.getProductID()%>&quantity=1" class="add-to-cart-btn">ADD TO CART</a>
                                </div>
                            </div>
                            <%}%>

                        </div>
                    </div>
                </div>
            </div>

        </section>

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

