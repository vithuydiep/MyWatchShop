<%-- 
    Document   : footer
    Created on : Dec 17, 2020, 11:06:13 AM
    Author     : Vi Diep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <form action="ContactServlet" method="post" id="contact">
        <footer class="footer_area">
            <div class="container">
                <div class="row">

                    <!-- Single Footer Area Start -->
                    <div class="col-12 col-md-6 col-lg-3">
                        <div class="single_footer_area">
                            <div class="footer-logo">
                                <img src="images/logo.png" alt="">
                            </div>
                            <div class="copywrite_text d-flex align-items-center">
                                <p>The world of watch. Welcome!</p>
                            </div>
                        </div>
                    </div>

                    <!--
                    <div class="col-12 col-sm-6 col-md-3 col-lg-2">
                        <div class="single_footer_area">
                            <ul class="footer_widget_menu">
                                <li><a href="#">About</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Faq</a></li>
                                <li><a href="#">Returns</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="col-12 col-sm-6 col-md-3 col-lg-2">
                        <div class="single_footer_area">
                            <ul class="footer_widget_menu">
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Shipping</a></li>
                                <li><a href="#">Our Policies</a></li>
                                <li><a href="#">Afiliates</a></li>
                            </ul>
                        </div>col-12 col-lg-5
                    </div> --!> 
                    <!-- Single Footer Area Start -->
                    <div class="col-12 col-md-4 col-md-3 ">
                        <div class="single_footer_area">
                            <div class="footer_heading mb-6">
                                <h6>Your email</h6>
                            </div>
                            <div class="subscribtion_form">

                                <input type="email" name="mail" class="mail" placeholder="Your email here">



                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-md-3">
                        <div class="single_footer_area">
                            <div class="footer_heading col-md-6">
                                <h6>Your name</h6>
                            </div>
                            <div class="subscribtion_form">

                                <input type="text" name="name" class="mail" placeholder="Your name">

                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-3 col-md-3">
                        <div class="single_footer_area">
                            <div class="subscribtion_form">

                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-8 col-md-6" >
                        <div class="single_footer_area">
                            <div class="footer_heading col-md-6">
                                <h6>Message</h6>
                            </div>
                            <div class="subscribtion_form">

                                <input type="text" name="message" class="mail" placeholder="Message">
                                <input type="hidden" name="command" value="insert">
                                <button type="submit" class="submit">Send</button>

                            </div>
                        </div>
                    </div>

                </div>

                <div class="line"></div>
                <!-- Footer Bottom Area Start -->
                <div class="footer_bottom_area">
                    <div class="row">
                        <div class="col-12">
                            <div class="footer_social_area text-center">
                                <a href="https://www.youtube.com/channel/UCy_c6cBapGsmIXgRAyd2XtQ?view_as=subscriber"><i class="fa fa-youtube" aria-hidden="true"></i></a>
                                <a href="https://www.facebook.com/diep.vi.790"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="https://www.google.com"><i class="fa fa-google" aria-hidden="true"></i></a>
                                <a href="https://www.instagram.com/diepthuyvi/"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </form>
</html>
