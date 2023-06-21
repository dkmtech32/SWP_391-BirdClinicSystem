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
                <a href="index.jsp" class="navbar-brand logo">
                    <img src="assets/img/logo.png" class="img-fluid" alt="Logo" />
                </a>
            </div>
            <div class="main-menu-wrapper">
                <div class="menu-header">
                    <a href="index.jsp" class="menu-logo">
                        <img src="assets/img/logo.png" class="img-fluid" alt="Logo" />
                    </a>
                    <a id="menu_close" class="menu-close" href="javascript:void(0);">
                        <i class="fas fa-times"></i>
                    </a>
                </div>
                <ul class="main-nav">
                    <li>
                        <a href="index.jsp">Home</a>
                    </li>
                    <li class="has-submenu">
                        <a href="#">Doctors <i class="fas fa-chevron-down"></i></a>
                        <ul class="submenu">
                            <li><a href="doctor-dashboard.jsp">Doctor Dashboard</a></li>
                            <li><a href="appointments.jsp">Appointments</a></li>
                            <li><a href="schedule-timings.jsp">Schedule Timing</a></li>
                            <li><a href="my-patients.jsp">Patients List</a></li>
                            <li><a href="patient-profile.jsp">Patients Profile</a></li>
                            <li><a href="chat-doctor.jsp">Chat</a></li>
                            <li><a href="invoices.jsp">Invoices</a></li>
                            <li><a href="doctor-profile-settings.jsp">Profile Settings</a></li>
                            <li><a href="reviews.jsp">Reviews</a></li>
                            <li><a href="doctor-register.jsp">Doctor Register</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu active">
                        <a href="#">Patients <i class="fas fa-chevron-down"></i></a>
                        <ul class="submenu">
                            <li><a href="search.jsp">Search Doctor</a></li>
                            <li class="active"><a href="doctor-profile.jsp">Doctor Profile</a></li>
                            <li><a href="booking.jsp">Booking</a></li>
                            <li><a href="checkout.jsp">Checkout</a></li>
                            <li><a href="booking-success.jsp">Booking Success</a></li>
                            <li><a href="patient-dashboard.jsp">Patient Dashboard</a></li>
                            <li><a href="favourites.jsp">Favourites</a></li>
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
                    <li>
                        <a href="admin/index.jsp" target="_blank">Admin</a>
                    </li>
                    <li class="login-link">
                        <a href="login.jsp">Login / Signup</a>
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
						<a href="booking-list.jsp" class="btn btn-lg btn-primary px-4">Book Now</a>
						<!-- <a class="nav-link header-login" href="login.jsp">login / Signup </a> -->
					</li>
                <li class="nav-item">
                    <a class="nav-link header-login" href="login.jsp">login / Signup </a>
                </li>
            </ul>
        </nav>
    </header>
</html>