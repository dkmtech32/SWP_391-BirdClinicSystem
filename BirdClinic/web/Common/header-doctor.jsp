<%--
    Document   : header
    Created on : Jun 19, 2023, 3:20:27 PM
    Author     : Legion
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/jsp" pageEncoding="UTF-8"%>
<!DOCTYPE jsp>
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
            <a href="<c:url value='/intro' />" class="navbar-brand logo">
                <img src="<c:url value='/assets/img/logo.png' />" class="img-fluid" alt="Logo" />
            </a>
        </div>
        <div class="main-menu-wrapper">
                <div class="menu-header">
                    <a href="<c:url value="/intro"/>" class="menu-logo">
                        <img src="<c:url value="/assets/img/logo.png"/>" class="img-fluid" alt="Logo" />
                    </a>
                    <a id="menu_close" class="menu-close" href="javascript:void(0);">
                        <i class="fas fa-times"></i>
                    </a>
                </div>
                <ul class="main-nav">
                   
                    
                    <li>
                        <a href="<c:url value="/intro"/>">Home</a>
                    </li>
                    
                    <li>
                        <a href="<c:url value="/Dashboard/Appointments?filter=processing"/>">Dashboard</a>
                    </li>
                    
                    <li>
                        <a href="<c:url value="/Update/Profile"/>">Profile Settings</a>
                    </li>
                    
                    <li>
                        <a href="<c:url value="/logout"/>">Logout</a>
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

            <!-- User Menu -->
            <li class="nav-item dropdown has-arrow logged-item">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                    <span class="user-img">
                        <img class="rounded-circle" src="<c:url value='/images/doctors/${service.currentUser.image.imageURLName}' />" width="31" alt="Darren Elder" />
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <div class="user-header">
                        <div class="avatar avatar-sm">
                            <img src="<c:url value='/images/doctors/${service.currentUser.image.imageURLName}'/>" alt="User Image" class="avatar-img rounded-circle" />
                        </div>
                        <div class="user-text">
                            <h6>${service.currentUser.fullName}</h6>
                            <p class="text-muted mb-0" style="text-transform: capitalize;">${service.currentUser.userRole}</p>
                        </div>
                    </div>
                    <a class="dropdown-item" href="<c:url value='/Dashboard/Appointments' />">Dashboard</a>
                    <a class="dropdown-item" href="<c:url value='/Update/Profile'/>">Profile Settings</a>
                    <a class="dropdown-item" href="<c:url value='/logout'/>">Logout</a>
                </div>
            </li>
            <!-- /User Menu -->
        </ul>
    </nav>
</header>

</html>
