<%-- 
    Document   : header
    Created on : Jun 19, 2023, 3:20:27 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <header class="header">
        <nav class="navbar navbar-expand-lg header-nav">
            <div class="navbar-header">
                <a id="mobile_btn" href="javascript:void(0);">
                    <span class="bar-icon">
                        <span></span>
                        <span></span>
                        <span></span>
                    </span>
                </a>
                <a href="<c:url value='/intro'/>" class="navbar-brand logo">
                    <img src="<c:url value='/assets/img/logo.png'/>" class="img-fluid" alt="Logo" />
                </a>
            </div>
            <div class="main-menu-wrapper">
                <div class="menu-header">
                    <a href="<c:url value='/intro'/>" class="menu-logo">
                        <img src="<c:url value='/assets/img/logo.png'/>" class="img-fluid" alt="Logo" />
                    </a>
                    <a id="menu_close" class="menu-close" href="javascript:void(0);">
                        <i class="fas fa-times"></i>
                    </a>
                </div>
                <ul class="main-nav">
                    <li>
                        <a href="<c:url value='/intro' />">Home</a>
                    </li>
                    <li>
                        <a href="<c:url value='/Blog/All' />">Blogs</a>
                    </li>
                    
                </ul>
            </div>
            <ul class="nav header-navbar-rht">
                <li class="nav-item contact-item">
                    <div class="header-contact-img">
                        <i class="far fa-hospital"></i>
                    </div>
                    <div class="header-contact-detail">
                        <p class="contact-header">Contact</p>
                        <p class="contact-info-header">+84 093 388 8555</p>
                    </div>
                </li>
                <li class="nav-item">
                    <a href="../Customer/booking-list.jsp" class="btn btn-lg btn-primary px-4">Book Now</a>
                    <!-- <a class="nav-link header-login" href="login.jsp">login / Signup </a> -->
                </li>
                <li class="nav-item">
                    <a class="nav-link header-login" href="<c:url value="/Common/login"/>">login / Signup </a>
                </li>
            </ul>
        </nav>
    </header>
</html>