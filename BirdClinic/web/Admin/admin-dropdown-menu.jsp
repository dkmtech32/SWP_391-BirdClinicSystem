<%-- 
    Document   : admin-dropdown-menu
    Created on : Jul 12, 2023, 5:47:52 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <body>
        <div class="top-header">
            <div class="header-bar d-flex justify-content-between border-bottom">
                <div class="d-flex align-items-center">
                    <a href="#" class="logo-icon">
                        <img src="${user.image}" height="30" class="small" alt /> 
                        <span class="big">
                            <img src="assets/images/logo-dark.png" height="24" class="logo-light-mode" alt />
                            <img src="assets/images/logo-light.png" height="24" class="logo-dark-mode" alt />
                        </span>
                    </a>
                </div>

                <ul class="list-unstyled mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <div class="dropdown dropdown-primary">
                            <button
                                type="button"
                                class="btn btn-pills btn-soft-primary dropdown-toggle p-0"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                                >
                                <img src="assets/images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt />
                            </button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px">
                                <a class="dropdown-item d-flex align-items-center text-dark" href="https://shreethemes.in/doctris/layouts/admin/profile.html">
                                    <img src="assets/images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt />
                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1">${user.fullName}</span> <!-- tên thằng admin -->
                                        <small class="text-muted">Admin</small>
                                    </div>
                                </a>
                                <a class="dropdown-item text-dark" href="<c:url value="/admin-home-page-accounts.jsp"/>"
                                   ><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a
                                >
                                <a class="dropdown-item text-dark" href="<c:url value="/admin-profile.jsp.jsp"/>"
                                   ><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a
                                >
                                <div class="dropdown-divider border-top"></div>
                                <a class="dropdown-item text-dark" href="<c:url value="/logout"/>"
                                   ><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a
                                >
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </body>
</html>
