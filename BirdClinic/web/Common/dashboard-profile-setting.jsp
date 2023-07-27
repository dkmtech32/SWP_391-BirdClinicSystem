<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <div class="col-md-8 col-lg-9 col-xl-10">
        <div class="card">
            <div class="card-body">
                <!-- Profile Settings Form -->
                <div class="rounded shadow mt-4">
                    <nav class="user-tabs mb-4">
                        <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab">Personal Information</a>
                            </li>

                        </ul>
                    </nav>

                    <div class="p-4">
                        <form class="" accept-charset="utf-8" method='POST' action="<c:url value="/Update/Profile"/>" enctype="multipart/form-data">
                            <input value="${sessionScope.service.currentUser.userRole}" name="userRole" hidden="hidden"/>
                            <div class="row align-items-center">
                                <div class="col-lg-2 col-md-4">
                                    <c:choose>
                                        <c:when test="${sessionScope.service.currentUser.userRole =='customer'}">
                                            <img src="<c:url value="/images/customer/${sessionScope.service.currentUser.image.imageURLName}"/>"
                                                 class="avatar avatar-md-md rounded-pill shadow mx-auto d-block"
                                                 alt />
                                        </c:when>
                                        <c:when test="${sessionScope.service.currentUser.userRole =='staff'}">
                                            <img src="<c:url value="/images/${sessionScope.service.currentUser.image.imageURLName}"/>"
                                                 class="avatar avatar-md-md rounded-pill shadow mx-auto d-block"
                                                 alt />
                                        </c:when>
                                        <c:when test="${sessionScope.service.currentUser.userRole =='doctor'}">
                                            <img src="<c:url value="/images/doctors/${sessionScope.service.currentUser.image.imageURLName}"/>"
                                                 class="avatar avatar-md-md rounded-pill shadow mx-auto d-block"
                                                 alt />
                                        </c:when>

                                    </c:choose>
                                </div>
                                <!--end col-->

                                <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                    <h6 class>Upload your picture</h6>
                                    <p class="text-muted mb-0">For best results, use an image at least 256px
                                        by 256px in either .jpg or .png format</p>
                                </div>
                                <!--end col-->

                                <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                    <input name="user-image" id="user-image" type="file" class="upload" />
                                </div>
                                <!--end col-->
                            </div>
                            <!--end row-->


                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Username</label>
                                        <input name="username" id="name" type="text" class="form-control"
                                               value="${sessionScope.service.currentUser.userName}" />
                                    </div>
                                </div>
                                <!--end col-->

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Full name</label>
                                        <input name="full-name" id="name2" type="text" class="form-control"
                                               value="${sessionScope.service.currentUser.fullName}" />
                                    </div>
                                </div>
                                <!--end col-->

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Email</label>
                                        <input name="email" id="email" type="email" class="form-control"
                                               value="${sessionScope.service.currentUser.email}" />
                                    </div>
                                </div>
                                <!--end col-->

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Phone</label>
                                        <input name="phone-number" id="number" type="text"
                                               class="form-control" value="${sessionScope.service.currentUser.phoneNumber}" />
                                    </div>
                                </div>
                                <!--end col-->

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Gender</label>
                                        <select name="gender" class="form-control time-during" >
                                            <option value="male" <c:if test="${sessionScope.service.currentUser.gender =='male'}"> selected</c:if>>Male</option>
                                            <option value="female" <c:if test="${sessionScope.service.currentUser.gender =='female'}"> selected</c:if>>Female</option>
                                            <option value="unknown" <c:if test="${sessionScope.service.currentUser.gender =='unknown'}"> selected</c:if>>Unknown</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- customer address -->
                                <c:if test="${sessionScope.service.currentUser.userRole =='customer'}">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Address</label>
                                            <input name="customer-address" id="text" type="text" class="form-control"
                                                   value="${sessionScope.service.currentUser.customerAddress}" />
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <!--end row-->

                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="submit" id="submit" name="send" class="btn btn-primary"
                                           value="Save changes" />
                                </div>
                                <!--end col-->
                            </div>
                            <!--end row-->
                        </form>
                        <!--end form-->
                    </div>
                </div>
                <!-- /Profile Settings Form -->
            </div>
        </div>
    </div>
</html>
