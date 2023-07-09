<%-- 
    Document   : bolg-detail
    Created on : Jul 9, 2023, 5:18:15 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <jsp:useBean id="blog" class="" scope="request"></jsp:useBean>
                <div class="container-fluid">
                    <div class="row flex-nowrap">
                        <div id="containerPage" class="col-md-8 col-lg-10 min-vh-100 p-0" style="flex-grow: 1; width: unset">
                            <c:if test="${not empty sessionScope.BLOG_DETAIL}">
                            <c:set var="detail" value="${sessionScope.BLOG_DETAIL}"/>
                            <div class="body-container">
                                <section class="section-head">
                                    <img src="data:images/jpg;base64,${detail.thumbnail}" draggable="false"/>
                                    <div class="desc-container">
                                        <div class="date-time">
                                            <span>${detail.date}</span>
                                            <span>${detail.author}</span>
                                            <span>10 minutes reading</span>
                                        </div>
                                        <h1>
                                            ${detail.title}
                                        </h1>
                                    </div>
                                </section>
                                <section class="section-body">
                                    <div class="upvote">
                                        <a href="#" class="triangle-up"></a>
                                        <span class="vote-count">+15</span>
                                        <a href="#" class="triangle-down"></a>
                                    </div>
                                    <div class="content">
                                        <div>
                                            <!-- hard code -->
                                            <h5>Introduction:</h5>
                                            <!--------------->
                                            ${detail.introduction}
                                        </div>
                                        <div>
                                            <!-- hard code -->
                                            <br />
                                            <b>1. Understanding of the post Blog Detail</b>
                                            <!--------------->
                                            ${detail.content1}
                                            <!-- hard code -->
                                            <div class="img-container">
                                                <img src="data:images/jpg;base64,${detail.contentIMG}" draggable="false"/>
                                            </div>
                                            <!--------------->
                                        </div>
                                        <div>
                                            <!-- hard code -->
                                            <b>2. Building Trust and Partnership:</b>
                                            <!--------------->
                                            ${detail.content2}
                                        </div>
                                        <div>
                                            <!-- hard code -->
                                            <br />
                                            <h5>Conclusion</h5>
                                            <!--------------->
                                            ${detail.inconclusion}
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Main Wrapper -->
        <script>
            window.addEventListener('DOMContentLoaded', function () {
                var headerWidth = document.getElementById('headerPage').offsetWidth;
                var container = document.getElementById('containerPage');
                container.style.maxWidth = 'calc(100% - ' + headerWidth + 'px)';
            });
        </script>
        <!--bs5-->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"
        ></script>
        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
