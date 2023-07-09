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
            <a href="<c:url value='/Common/index.jsp' />" class="navbar-brand logo">
                <img src="<c:url value='/assets/img/logo.png' />" class="img-fluid" alt="Logo" />
            </a>
        </div>
        <div class="main-menu-wrapper">
            <div class="menu-header">
                <a href="<c:url value='index.jsp' />" class="menu-logo">
                    <img src="<c:url value='/assets/img/logo.png' />" class="img-fluid" alt="Logo" />
                </a>
                <a id="menu_close" class="menu-close" href="javascript:void(0);">
                    <i class="fas fa-times"></i>
                </a>
            </div>
            <ul class="main-nav">
                <li>
                    <a href="<c:url value='index.jsp' />">Home</a>
                </li>
                <li class="has-submenu active">
                    <a href="#">Doctors <i class="fas fa-chevron-down"></i></a>
                    <ul class="submenu">
                        <li class="active"><a href="<c:url value='doctor-dashboard.jsp' />">Doctor Dashboard</a></li>
                        <li><a href="<c:url value='appointments.jsp' />">Appointments</a></li>
                        <li><a href="<c:url value='schedule-timings.jsp' />">Schedule Timing</a></li>
                        <li><a href="<c:url value='my-patients.jsp' />">Patients List</a></li>
                        <li><a href="<c:url value='patient-profile.jsp' />">Patients Profile</a></li>
                        <li><a href="<c:url value='chat-doctor.jsp' />">Chat</a></li>
                        <li><a href="<c:url value='invoices.jsp' />">Invoices</a></li>
                        <li><a href="<c:url value='doctor-profile-settings.jsp' />">Profile Settings</a></li>
                        <li><a href="<c:url value='reviews.jsp' />">Reviews</a></li>
                        <li><a href="<c:url value='doctor-register.jsp' />">Doctor Register</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#">Pages <i class="fas fa-chevron-down"></i></a>
                    <ul class="submenu">
                        <li><a href="<c:url value='voice-call.jsp' />">Voice Call</a></li>
                        <li><a href="<c:url value='video-call.jsp' />">Video Call</a></li>
                        <li><a href="<c:url value='search.jsp' />">Search Doctors</a></li>
                        <li><a href="<c:url value='calendar.jsp' />">Calendar</a></li>
                        <li><a href="<c:url value='components.jsp' />">Components</a></li>
                        <li class="has-submenu">
                            <a href="<c:url value='invoices.jsp' />">Invoices</a>
                            <ul class="submenu">
                                <li><a href="<c:url value='invoices.jsp' />">Invoices</a></li>
                                <li><a href="<c:url value='invoice-view.jsp' />">Invoice View</a></li>
                            </ul>
                        </li>
                        <li><a href="<c:url value='blank-page.jsp' />">Starter Page</a></li>
                        <li><a href="<c:url value='login.jsp' />">Login</a></li>
                        <li><a href="<c:url value='register.jsp' />">Register</a></li>
                        <li><a href="<c:url value='forgot-password.jsp' />">Forgot Password</a
                                            </ul>
                </li>
                <li class="login-link">
                    <a href="<c:url value='login.jsp' />">Login / Signup</a>
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

            <!-- User Menu -->
            <li class="nav-item dropdown has-arrow logged-item">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                    <span class="user-img">
                        <img class="rounded-circle" src="<c:url value='/assets/img/doctors/doctor-thumb-02.jpg' />" width="31" alt="Darren Elder" />
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <div class="user-header">
                        <div class="avatar avatar-sm">
                            <img src="<c:url value='/assets/img/doctors/doctor-thumb-02.jpg' />" alt="User Image" class="avatar-img rounded-circle" />
                        </div>
                        <div class="user-text">
                            <h6>Darren Elder</h6>
                            <p class="text-muted mb-0">Doctor</p>
                        </div>
                    </div>
                    <a class="dropdown-item" href="<c:url value='/Dashboard/Appointments' />">Dashboard</a>
                    <a class="dropdown-item" href="<c:url value='doctor-profile-settings.jsp' />">Profile Settings</a>
                    <a class="dropdown-item" href="<c:url value='login.jsp' />">Logout</a>
                </div>
            </li>
            <!-- /User Menu -->
        </ul>
    </nav>
</header>

</html>
