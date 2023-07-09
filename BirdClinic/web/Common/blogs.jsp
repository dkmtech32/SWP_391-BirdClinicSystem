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
            <div class="container-fluid">
                <section class="blogs-body">
                    <div class="blogs-container row">
                        <!-- start of card -->
                        <c:forEach var="card" items="${blog.getLisofBlog('available')}">
                            <div class="blog-container">
                                <img src="data:images/jpg;base64,${card.thumbnail}" draggable="false"/>
                                <div class="desc-container">
                                    <h5 class="blog-title">${card.title}</h5>
                                    <div class="date-write">
                                        <span>${card.date}</span>
                                        <span style="float: right">${card.author}</span>
                                    </div>
                                    <div class="blog-description">
                                        ${card.briefinfo}
                                    </div>
                                </div>
                                <div class="button-container">
                                    <a href="MainController?action=view_blog_detail&blog_id=${card.blogid}">
                                        <button>Read more</button>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- end of card -->
                    </div>
                </section>
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
        <jsp:include page="Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
