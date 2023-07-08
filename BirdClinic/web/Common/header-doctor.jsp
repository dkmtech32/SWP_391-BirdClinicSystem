<%-- 
    Document   : header
    Created on : Jun 19, 2023, 3:20:27 PM
    Author     : Legion
--%>

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
                <a href="../Common/index.jsp" class="navbar-brand logo">
                    <img src="../assets/img/logo.png" class="img-fluid" alt="Logo" />
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
                        <a href="#">Doctors <i class="fas fa-chevron-down"></i></a>
                        <ul class="submenu">
                            <li class="active"><a href="doctor-dashboard.jsp">Doctor Dashboard</a></li>
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

                <!-- User Menu -->
                <li class="nav-item dropdown has-arrow logged-item">
                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                        <span class="user-img">
                            <img class="rounded-circle" src="../assets/img/doctors/doctor-thumb-02.jpg" width="31" alt="Darren Elder" />
                        </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="user-header">
                            <div class="avatar avatar-sm">
                                <img src="../assets/img/doctors/doctor-thumb-02.jpg" alt="User Image" class="avatar-img rounded-circle" />
                            </div>
                            <div class="user-text">
                                <h6>Darren Elder</h6>
                                <p class="text-muted mb-0">Doctor</p>
                            </div>
                        </div>
                        <a class="dropdown-item" href="../Doctor/doctor-dashboard.jsp">Dashboard</a>
                        <a class="dropdown-item" href="doctor-profile-settings.jsp">Profile Settings</a>
                        <a class="dropdown-item" href="login.jsp">Logout</a>
                    </div>
                </li>
                <!-- /User Menu -->
            </ul>
        </nav>
    </header>

</html>
