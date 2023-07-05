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
						<a href="landing/index-two.html">
							<!--<a href="index.html">-->
							<img src="../assets/images/logo-dark.png" height="24" class="logo-light-mode" alt />
							<img src="../assets/images/logo-light.png" height="24" class="logo-dark-mode" alt />
						</a>
					</div>

					<ul class="sidebar-menu pt-3">
						<li>
							<a href="index.html"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a>
						</li>
						<li>
							<a href="appointment.html"><i class="uil uil-stethoscope me-2 d-inline-block"></i>Appointment</a>
						</li>

						<li class="sidebar-dropdown">
							<a href="javascript:void(0)"><i class="uil fa-solid fa-user-doctor me-2 d-inline-block"></i>Doctors</a>
							<div class="sidebar-submenu">
								<ul>
									<li><a href="doctor-list.jsp">Doctors List</a></li>
									<li><a href="add-doctor.jsp">Add Doctor</a></li>
									<li><a href="dr-profile.jsp">Doctor Profile</a></li>
								</ul>
							</div>
						</li>

						<li class="sidebar-dropdown">
							<a href="javascript:void(0)"><i class="uil uil-user me-2 d-inline-block"></i>Staffs</a>
							<div class="sidebar-submenu">
								<ul>
									<li><a href="staff-list.jsp">Staffs List</a></li>
									<li><a href="add-staff.jsp">Add Staff</a></li>
									<li><a href="staff-profile.jsp">Staffs Profile</a></li>
								</ul>
							</div>
						</li>

						<li>
							<a href="customer-list.jsp"><i class="uil fa-solid fa-person me-2 d-inline-block"></i>Customers List</a>
						</li>

						<li>
							<a href="landing/index-two.html" target="_blank"><i class="uil uil-window me-2 d-inline-block"></i>Landing page</a>
						</li>
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
