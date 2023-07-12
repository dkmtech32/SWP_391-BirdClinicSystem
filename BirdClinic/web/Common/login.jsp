<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../Common/head.jsp"/>
    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="../Common/header.jsp"/>
            <!--/Header -->
            
            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8 offset-md-2">
                            <!-- Login Tab Content -->
                            <div class="account-content">
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-md-7 col-lg-6 login-left">
                                        <img src="../assets/img/bird-avatar.jpg" class="img-fluid" alt="Doccure Login" />
                                    </div>
                                    <div class="col-md-12 col-lg-6 login-right">
                                        <div class="login-header">
                                            <h3>Login <span>Birdlover</span></h3>
                                        </div>
                                        <form action="<c:url value="/Common/login"/>" method="POST">
                                            <div class="form-group form-focus">
                                                <input name ="username" class="form-control floating" />
                                                <label class="focus-label">User Name</label>
                                            </div>
                                            <div class="form-group form-focus">
                                                <input name ="password" type="password" class="form-control floating" />
                                                <label class="focus-label">Password</label>
                                            </div>
                                            <div class="text-right">
                                                <a class="forgot-link" href="forgot-password.jsp">Forgot Password ?</a>
                                            </div>
                                            <button class="btn btn-primary btn-block btn-lg login-btn" type="submit">Login</button>
<!--                                            <div class="login-or">
                                                <span class="or-line"></span>
                                                <span class="span-or">or</span>
                                            </div>
                                            <div class="row form-row social-login">
                                                <div class="col-6">
                                                    <a href="#" class="btn btn-facebook btn-block"><i class="fab fa-facebook-f mr-1"></i> Login</a>
                                                </div>
                                                <div class="col-6">
                                                    <a href="#" class="btn btn-google btn-block"><i class="fab fa-google mr-1"></i> Login</a>
                                                </div>
                                            </div>-->
                                            <div class="text-center dont-have">Don’t have an account? <a href="register.jsp">Register</a></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /Login Tab Content -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include page="../Common/footer.jsp"/>
            <!-- /Footer -->
        </div>
        <!-- /Main Wrapper -->

        <!-- Script -->
        <jsp:include page="../Common/script.jsp"/>
        <!-- /Script -->
    </body>
</html>
