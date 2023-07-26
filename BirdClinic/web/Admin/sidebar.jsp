<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px)">
            <div class="sidebar-brand">
                <a href="<c:url value="/Admin/Accounts"/>">
                    <img src="<c:url value="/images/logo-dark.png"/>" height="24" class="logo-light-mode" alt />
                </a>
            </div>

            <ul class="sidebar-menu pt-3">
                <li>
                    <a href="<c:url value="/Admin/Accounts"/>"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a>
                </li>

                <li >
                    <a href="<c:url value="/Admin/Accounts/Create?userRole=doctor"/>"><i class="uil fa-solid fa-user-doctor me-2 d-inline-block"></i>Add Doctor</a>                    <div class="sidebar-submenu">

                </li>

                <li >
                    <a href="<c:url value="/Admin/Accounts/Create?userRole=staff"/>"><i class="uil uil-user me-2 d-inline-block"></i>Add Staff</a>
                </li>

<!--                <li>
                    <a href=""><i class="uil fa-solid fa-person me-2 d-inline-block"></i>Customers List</a>
                </li>-->
            </ul>
            <!-- sidebar-menu  -->
        </div>
        <!-- sidebar-content  -->
        <ul class="sidebar-footer list-unstyled mb-0">
            <li class="list-inline-item mb-0 ms-1">
                <a href="#" class="btn btn-icon btn-pills btn-soft-primary">
                    <i class="uil uil-comment icons"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- sidebar-wrapper  -->
</html>
