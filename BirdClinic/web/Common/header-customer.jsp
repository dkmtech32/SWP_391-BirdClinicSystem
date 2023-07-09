<%-- 
    Document   : header
    Created on : Jun 19, 2023, 3:20:27 PM
    Author     : Legion
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <a href="<c:url value='/Common/index.jsp'/>" class="navbar-brand logo">
                    <img src="<c:url value='/assets/img/logo.png'/>" class="img-fluid" alt="Logo" />
                </a>
            </div>
            <div class="main-menu-wrapper">
                <div class="menu-header">
                    <a href="index.jsp" class="menu-logo">
                        <img src="../assets/img/logo.png" class="img-fluid" alt="Logo" />
                    </a>
                    <a id="menu_close" class="menu-close" href="javascript:void(0);">
                        <i class="fas fa-times"></i>
                    </a>
                </div>
                <ul class="main-nav">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li class="has-submenu active">
                        <a href="#">Owner<i class="fas fa-chevron-down"></i></a>
                        <ul class="submenu">
                            <li><a href="search.jsp">Search Doctor</a></li>
                            <li><a href="doctor-profile.jsp">Doctor Profile</a></li>
                            <li><a href="<c:url value="/Customer/prepareDocs"/>">Booking</a></li>
                            <li><a href="checkout.jsp">Checkout</a></li>
                            <li><a href="booking-success.jsp">Booking Success</a></li>
                            <li><a href="patient-dashboard.jsp">Patient Dashboard</a></li>
                            <li><a href="favourites.jsp">Favorites</a></li>
                            <li><a href="chat.jsp">Chat</a></li>
                            <li><a href="profile-settings.jsp">Profile Settings</a></li>
                            <li><a href="change-password.jsp">Change Password</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="#">Pages <i class="fas fa-chevron-down"></i></a>
                        <ul class="submenu">
                            <li><a href="voice-call.jsp">Voice Call</a></li>
                            <li><a href="video-call.jsp">Video Call</a></li>
                            <li><a href="search.jsp">Search Doctors</a></li>
                            <li><a href="calendar.jsp">Calendar</a></li>
                            <li><a href="components.jsp">Components</a></li>
                            <li class="has-submenu">
                                <a href="invoices.jsp">Invoices</a>
                                <ul class="submenu">
                                    <li><a href="invoices.jsp">Invoices</a></li>
                                    <li><a href="invoice-view.jsp">Invoice View</a></li>
                                </ul>
                            </li>
                            <li><a href="blank-page.jsp">Starter Page</a></li>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="register.jsp">Register</a></li>
                            <li><a href="forgot-password.jsp">Forgot Password</a></li>
                        </ul>
                    </li>
                    <li class="login-link">
                        <a href="login.jsp">Login /Signup</a>
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
                        <p class="contact-info-header">+1 315 369 5943</p>
                    </div>
                </li>

                <li class="nav-item">
                    <a href="<c:url value="/Customer/prepareDocs"/>" class="btn btn-lg btn-primary px-4">Book Now</a>
                    <!-- <a class="nav-link header-login" href="login.jsp">login / Signup </a> -->
                </li>

                <!-- User Menu -->
                <li class="nav-item dropdown has-arrow logged-item">
                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                        <span class="user-img">
                            <img class="rounded-circle" src="<c:url value='/assets/images/client/${sessionScope.service.currentUser.image.imageURLName}'/>" width="31" alt="${sessionScope.service.currentUser.fullName}" />
                        </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="user-header">
                            <div class="avatar avatar-sm">
                                <img src="<c:url value='/assets/images/client/${sessionScope.service.currentUser.image.imageURLName}'/>" alt="User Image" class="avatar-img rounded-circle" />
                            </div>
                            <div class="user-text">
                                <h6>${sessionScope.service.currentUser.fullName}</h6>
                                <p class="text-muted mb-0">${sessionScope.service.currentUser.displayRole}</p>
                            </div>
                        </div>
                        <a class="dropdown-item" href="<c:url value="/Dashboard/Appointments"/>">Dashboard</a>
                        <a class="dropdown-item" href="<c:url value="/Customer/custAccountInfo"/>">Profile Settings</a>
                        <a class="dropdown-item" href="<c:url value="/logout"/>">Logout</a>
                    </div>
                </li>
                <!-- /User Menu -->
            </ul>
        </nav>
    </header>
    <jsp:include page="../Common/script.jsp"/>
</html>
