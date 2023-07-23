<%--
    Document   : blogs
    Created on : Jun 23, 2023, 11:37:59 PM
    Author     : thang
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            <div class="container pt-5">
                <div class="d-flex flex-column text-center mb-5">
                    <h4 class="text-secondary mb-3">Bird Blog</h4>
                    <h1 class="display-4 m-0"><span class="text-primary">Updates</span> From Blog</h1>
                </div>
                <div class="row pb-3">
                    <c:forEach var="card" items="${blogs}">
                        <div class="col-lg-4 mb-4">
                            <div class="card border rounded mb-2" style="min-height: 450px">
                                <img class="card-img-top" src="<c:url value="/images/blog/${card.thumbnail.imageURLName}"/>" style="height: 200px; object-fit: cover" />
                                <div class="card-body p-3" style="background-color: #eaeaea ">
                                    <h4 class="card-title h5">${card.title}</h4>
                                    <div class=" m-3">
                                        <small class="mr-2"><i class="fa fa-folder text-muted"></i> ${card.category}</small>
                                        <small class="mr-2"><i class="fa fa-calendar text-muted"></i> ${card.uploadDatetime.toString().split(' ')[0]}</small>
                                    </div>
                                    <p class="small d-inline-block text-truncate" style="display: -webkit-box !important;
                                       -webkit-line-clamp: 3;
                                       -webkit-box-orient: vertical;
                                       white-space: normal;">${card.description}</p>
                                    <a class="font-weight-bold" href="<c:url value="/Blog?blogID=${card.blogID}"/>">Read More</a>
                                    <c:if test="${sessionScope.service.currentUser.userRole=='staff'}">
                                        <a class="font-weight-bold float-right" href="<c:url value="/Blog/Update?blogID=${card.blogID}"/>">Edit</a>
                                    </c:if>
                                </div>
                            </div>
                            
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!--trim title-->
        <script>
            // Get all question message elements
            var blogTitle = document.getElementsByClassName("blog-title");

            // Loop through each question message element
            for (var i = 0; i < blogTitle.length; i++) {
                var title = blogTitle[i].textContent.trim();

                // Remove any leading or trailing spaces and invisible characters
                title = title.replace(/^\s+|\s+$/g, "");

                // Remove non-printable characters using regular expression
                title = title.replace(/[^ -~]+/g, "");

                const titleLength = 30;

                // Check if the title length is greater than 10
                if (title.length > titleLength) {
                    // Truncate the title and append "..."
                    var truncatedMessage = title.substring(0, titleLength) + "...";
                    blogTitle[i].textContent = truncatedMessage;
                }
            }
        </script>
        <!--        trim description-->
        <script>
            // Get all question message elements
            var blogDescription = document.getElementsByClassName("blog-description");

            // Loop through each question message element
            for (var i = 0; i < blogDescription.length; i++) {
                var description = blogDescription[i].textContent.trim();

                // Remove any leading or trailing spaces and invisible characters
                description = description.replace(/^\s+|\s+$/g, "");

                // Remove non-printable characters using regular expression
                description = description.replace(/[^ -~]+/g, "");

                const descriptionLength = 200;

                // Check if the description length is greater than 10
                if (description.length > descriptionLength) {
                    // Truncate the description and append "..."
                    var truncatedMessage = description.substring(0, descriptionLength) + "...";
                    blogDescription[i].textContent = truncatedMessage;
                }
            }
        </script>
        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
