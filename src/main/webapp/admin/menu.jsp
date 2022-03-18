<%-- 
    Document   : menu
    Created on : Dec 19, 2020, 1:03:10 PM
    Author     : Vi Diep
--%>

<%@page import="model.UserAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%
        UserAdmin useradmin = null;
        if(session.getAttribute("useradmin") != null){
            useradmin = (UserAdmin) session.getAttribute("useradmin");
        }
        %>
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <ul class="nav">
                        <li class="nav-item nav-profile">
                            <a href="#" class="nav-link">
                                <div class="nav-profile-image">
                                    <img src="assets/images/faces/face1.jpg" alt="profile">
                                    <span class="login-status online"></span>
                                    <!--change to offline or busy as needed-->
                                </div>
                                <div class="nav-profile-text d-flex flex-column">
                                    <span class="font-weight-bold mb-2"><%=useradmin.getUseradminEmail()%></span>
                                    <span class="text-secondary text-small">Admin</span>
                                </div>
                                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/home.jsp">
                                <span class="menu-title">Home</span>
                                <i class="mdi mdi-home menu-icon"></i>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/manager_category.jsp">
                                <span class="menu-title">Danh mục</span>
                                <i class="mdi mdi-home menu-icon"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/manager_brand.jsp">
                                <span class="menu-title">Nhãn hiệu</span>
                                <i class="mdi mdi-contacts menu-icon"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/manager_product.jsp">
                                <span class="menu-title">Sản phẩm</span>
                                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/manager_bill.jsp">
                                <span class="menu-title">Hóa đơn</span>
                                <i class="mdi mdi-chart-bar menu-icon"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/manager_user.jsp">
                                <span class="menu-title">Người dùng</span>
                                <i class="mdi mdi-table-large menu-icon"></i>
                            </a>
                        </li>
                        
                      
                    </ul>
                </nav>
</html>
