<%-- 
    Document   : bookInfo-all
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../Common/head.jsp"/>
    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="../Common/header.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb --> 
            <div class="container-fluid p-5">
                <div class="row">
                    <c:if test="${not empty requestScope.blog}">
                        <c:set var="detail" value="${requestScope.blog}"/>
                        <div class="col-lg-9">
                            <div class="d-flex flex-column text-left mb-4">
                                <h4 class="text-secondary mb-3">Blog Detail</h4>
                                <h1 class="mb-3">${detail.title}</h1>
                                <div class="d-index-flex mb-2">
                                    <small class="mr-2"><i class="fa fa-folder text-muted"></i> ${blog.category}</small>
                                                <small class="mr-2"><i class="fa fa-calendar text-muted"></i> ${blog.uploadDatetime.toString().split(' ')[0]}</small>
                                    
                                </div>
                            </div>
                            <div class="mb-5">
                                <img class="img-fluid w-100 mb-4" src="<c:url value="/images/blog/${detail.thumbnail.imageURLName}"/>" alt="Image" />
                                <p class="mr-3 mb-3 text-muted" style="text-indent: 3rem">${detail.description}</p>
                                <p style="text-indent: 3rem">
                                    ${detail.blogContent}}
                                </p>
                            </div>
                        </div>
                    </c:if>
                    <div class="col-lg-3">
                        <h4 class="text-secondary mb-3">View more blogs</h4>
                        <div class="row pb-3">
                            <c:forEach items="${blogs}" var="blog">
                                <div class="col-lg-12 mb-4">
                                    <div class="card flex-row border rounded mb-2" >
                                        <img class="card-img-top" src="<c:url value="/images/blog/${blog.thumbnail.imageURLName}"/>" style="width: 40%; object-fit: cover" />
                                        <div class="card-body bg-light p-4">
                                            <h4 class="card-title h5">${blog.title}</h4>
                                            <div class="d-flex mb-3">
                                                <small class="mr-2"><i class="fa fa-folder text-muted"></i> ${blog.category}</small>
                                                <small class="mr-2"><i class="fa fa-calendar text-muted"></i> ${blog.uploadDatetime.toString().split(' ')[0]}</small>
                                            </div>
                                            <p class="small d-inline-block text-truncate" style="display: -webkit-box !important;
                                               -webkit-line-clamp: 3;
                                               -webkit-box-orient: vertical;
                                               white-space: normal;">${blog.description}</p>
                                            <a class="font-weight-bold" href="<c:url value="/Blog?blogID=${blog.blogID}"/>">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->                                         
        </div>
        <!-- /Main Wrapper -->
    </body>
    <!--trim title-->
    <!-- Script -->
    <jsp:include page="../Common/script.jsp"/>
    <!-- /Script -->
</body>
</html>
