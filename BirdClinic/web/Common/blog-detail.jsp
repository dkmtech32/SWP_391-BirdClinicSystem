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
            <div class="container pt-5">
                <jsp:useBean id="blog" class="" scope="request"></jsp:useBean>
                <c:if test="${not empty sessionScope.BLOG_DETAIL}">
                    <c:set var="detail" value="${sessionScope.BLOG_DETAIL}"/>
                    <div class="d-flex flex-column text-left mb-4">
                        <h4 class="text-secondary mb-3">Blog Detail</h4>
                        <h1 class="mb-3">${detail.title}</h1>
                        <div class="d-index-flex mb-2">
                            <span>${detail.date}</span>
                            <span class="mr-3"></i> ${detail.author}</span>
                        </div>
                    </div>
                    <div class="mb-5">
                        <img class="img-fluid w-100 mb-4" src="data:images/jpg;base64,${detail.thumbnail}" alt="Image" />
                        <p>${detail.introduction}</p>
                        <div>
                            <br />
                            <b>1. Understanding of the post Blog Detail</b> <!-- you can modify this heading if needed -->
                            ${detail.content1}
                            <div class="img-container">
                                <img src="data:images/jpg;base64,${detail.contentIMG}" draggable="false"/>
                            </div>
                        </div>
                        <div>
                            <b>2. Building Trust and Partnership:</b> <!-- you can modify this heading if needed -->
                            ${detail.content2}
                        </div>
                        <div>
                            <br />
                            <h5>Conclusion</h5> <!-- you can modify this heading if needed -->
                            ${detail.inconclusion}
                        </div>
                    </div>
                    <div class="container pt-5">
                        <div class="heading"> 
                            <h2>MORE BLOGS & TIPS</h2>
                            <div>
                                <h1>Discover more valuable insights!</h1>
                            </div>
                        </div>
                        <div class="row pb-3">
                            <c:forEach var="card" items="${blog.getLisofBlog('available')}">
                                <div class="col-lg-4 mb-4">
                                    <div class="card border-0 mb-2">
                                        <img class="card-img-top" src="data:images/jpg;base64,${card.thumbnail}" alt="" />
                                        <div class="card-body bg-light p-4">
                                            <h4 class="card-title text-truncate">${card.title}</h4>
                                            <div class="d-flex mb-3">
                                                <small class="mr-2">${card.date}</small>
                                                <small class="mr-2">${card.author}</small>
                                            </div>
                                            <p>${card.briefinfo}</p>
                                            <a class="font-weight-bold" href="MainController?action=view_blog_detail&blog_id=${card.blogid}">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </div>

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->                                         
        </div>
        <!-- /Main Wrapper -->
    </body>
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
    <!--    drag scroll-->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const ele = document.getElementById('blogs-slider');
            ele.style.cursor = 'grab';

            let pos = {top: 0, left: 0, x: 0, y: 0};

            const mouseDownHandler = function (e) {
                ele.style.cursor = 'grabbing';
                ele.style.userSelect = 'none';

                pos = {
                    left: ele.scrollLeft,
                    top: ele.scrollTop,
                    // Get the current mouse position
                    x: e.clientX,
                    y: e.clientY
                };

                document.addEventListener('mousemove', mouseMoveHandler);
                document.addEventListener('mouseup', mouseUpHandler);
            };

            const mouseMoveHandler = function (e) {
                // How far the mouse has been moved
                const dx = e.clientX - pos.x;
                const dy = e.clientY - pos.y;

                // Scroll the element
                ele.scrollTop = pos.top - dy;
                ele.scrollLeft = pos.left - dx;
            };

            const mouseUpHandler = function () {
                ele.style.cursor = 'grab';
                ele.style.removeProperty('user-select');

                document.removeEventListener('mousemove', mouseMoveHandler);
                document.removeEventListener('mouseup', mouseUpHandler);
            };

            // Attach the handler
            ele.addEventListener('mousedown', mouseDownHandler);
        });
    </script>
    <!-- Script -->
    <jsp:include page="../Common/script.jsp"/>
    <!-- /Script -->
</body>
</html>
