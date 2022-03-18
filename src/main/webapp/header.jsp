<%-- 
    Document   : header
    Created on : Dec 17, 2020, 11:09:29 AM
    Author     : Vi Diep
--%>

<%@page import="model.Brand"%>
<%@page import="model.Category"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.User"%>
<%@page import="DAO.BrandGet"%>
<%@page import="DAO.CategoryGet"%>
<%@page import="model.Cart"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%

        CategoryGet categoryget = new CategoryGet();
        BrandGet brandget = new BrandGet();

        User user = null;
        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
        }

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        DecimalFormat formatter = new DecimalFormat("###,###,###");
    %>
    <div class="catagories-side-menu">
        <!-- Close Icon -->
        <div id="sideMenuClose">
            <i class="ti-close"></i>
        </div>
        <!--  Side Nav  -->
        <div class="nav-side-menu">
            <div class="menu-list">
                <h6>Categories</h6>
                <ul id="menu-content" class="menu-content collapse out">
                    <!-- Single Item -->
                    <li data-toggle="collapse" data-target="#women" class="collapsed active">
                        <%
                            for (Category c : categoryget.getListCategory()) {
                        %>
                    <li data-toggle="collapse" data-target="#women2">
                        <a href="products.jsp?category=<%=c.getCategoryID()%>"><%=c.getCategoryName()%></a>
                    </li>
                    <% }%>

                    <ul class="sub-menu collapse" id="women">
                        <li><a href="#">Midi Dresses</a></li>
                        <li><a href="#">Maxi Dresses</a></li>
                        <li><a href="#">Prom Dresses</a></li>
                        <li><a href="#">Little Black Dresses</a></li>
                        <li><a href="#">Mini Dresses</a></li>
                    </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div id="wrapper">

        <!-- ****** Header Area Start ****** -->
        <header class="header_area">
            <!-- Top Header Area Start -->
            <div class="top_header_area">
                <div class="container h-100">
                    <div class="row h-100 align-items-center justify-content-end">

                        <div class="col-12 col-lg-7">
                            <div class="top_single_area d-flex align-items-center">
                                <!-- Logo Area -->
                                <div class="top_logo">
                                    <a href="index.jsp"><img src="images/logo.png" alt=""></a>
                                </div>
                                <!-- Cart & Menu Area -->
                                <div class="header-cart-menu d-flex align-items-center ml-auto">
                                    <!-- Cart Area -->
                                    <div class="cart">
                                        <a href="#" id="header-cart-btn" target="_blank"><span class="cart_quantity"><%=cart.countItem()%></span> <i class="ti-bag"></i> Your Bag</a>
                                        <!-- Cart List Area Start -->
                                        <ul class="cart-list">
                                            <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {
                                            %>
                                            <li>
                                                <a href="#" class="image"><img src="<%=list.getValue().getProduct().getProductImage()%>" class="cart-thumb" alt=""></a>
                                                <div class="cart-item-desc">
                                                    <h6><a href="#"><%=list.getValue().getProduct().getProductName()%></a></h6>
                                                    <p><%=list.getValue().getQuantity()%>x - <span class="price"><%=formatter.format(list.getValue().getProduct().getProductPrice())%> VNĐ</span></p>
                                                </div>
                                                <span class="dropdown-product-remove"><i class="icon-cross"></i></span>
                                            </li>
                                            <%}%>
                                            <li class="total">
                                                <span class="pull-right">Total:<%=formatter.format(cart.totalCart())%></span>
                                                <a href="checkout.jsp" class="btn btn-sm btn-cart">Cart</a>
                                                <a href="delivery.jsp" class="btn btn-sm btn-checkout">Checkout</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="header-right-side-menu ml-15">
                                        <a href="#" id="sideMenuBtn"><i class="ti-menu" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Top Header Area End -->
            <div class="main_header_area">
                <div class="container h-100">
                    <div class="row h-100">
                        <div class="col-12 d-md-flex justify-content-between">
                            <!-- Header Social Area -->
                            <div class="header-social-area">
                                <a href="https://www.youtube.com/channel/UCy_c6cBapGsmIXgRAyd2XtQ?view_as=subscriber"><span class="karl-level">Share</span> <i class="fa fa-youtube" aria-hidden="true"></i></a>
                                <a href="https://www.facebook.com/diep.vi.790"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="https://www.google.com"><i class="fa fa-google" aria-hidden="true"></i></a>
                                <a href="https://www.instagram.com/diepthuyvi/"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            </div>
                            <!-- Menu Area -->
                            <div class="main-menu-area">
                                <nav class="navbar navbar-expand-lg align-items-start">

                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#karl-navbar" aria-controls="karl-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><i class="ti-menu"></i></span></button>

                                    <div class="collapse navbar-collapse align-items-start collapse" id="karl-navbar">
                                        <ul class="navbar-nav animated" id="nav">
                                            <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="karlDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Brand</a>

                                                <div class="dropdown-menu" aria-labelledby="karlDropdown">
                                                    <%
                                                        for (Brand b : brandget.getListBrand()) {
                                                    %>
                                                    <a class="dropdown-item" href="products.jsp?brand=<%=b.getBrandID()%>"><%=b.getBrandName()%></a>
                                                    <%}%>
                                                </div>
                                            </li>

                                            <li class="nav-item"><a class="nav-link" href="products.jsp"><span class="karl-level">hot</span> Watch</a></li>
                                            <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                            <!-- Help Line -->
                            <div class="help-line">
                                <%if (user != null) {%>
                                <!--a href="#"><i class="ti-user"></i> Chào <%=user.getUserName()%> </a> -->
                                <div class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="karlDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="ti-user"></i> Chào <%=user.getUserName()%> </a>
                                    <div class="dropdown-menu" aria-labelledby="karlDropdown">
                                        <a class="dropdown-item" href="myaccount.jsp">Thông tin</a>
                                        <a class="dropdown-item" href="historycard.jsp">Lịch sử giao dịch</a>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/LogoutServlet">Đăng xuất</a>
                                    </div>
                                </div>
                                <% } %>
                                <%if (user == null) {%>
                                <a href="login.jsp"><i class="ti-user"></i> Login</a>
                                <% }%>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
      

</html>
