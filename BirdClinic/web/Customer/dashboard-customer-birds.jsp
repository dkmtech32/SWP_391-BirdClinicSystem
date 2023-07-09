<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <div class="col-md-7 col-lg-8 col-xl-9">
        <div class="card">
            <div class="card-body pt-0">
                <!-- Tab Menu -->
                <nav class="user-tabs mb-4">
                    <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                        <li class="nav-item">
                            <a class="nav-link active" href="<c:url value="/Dashboard/Appointments"/>" data-toggle="tab">Appointments</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/Dashboard/Birds"/>" data-toggle="tab">Birds</a>
                        </li>
                    </ul>
                </nav>
                <!-- /Tab Menu -->

                <!-- Tab Content -->
                <div class="tab-content pt-0">
                    <!-- Appointment Tab -->
                    <div id="pat_appointments" class="tab-pane fade show active">
                        <div class="card card-table mb-0">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover table-center mb-0">
                                        <thead>
                                            <tr>
                                                <th>Bird</th>
                                                <th>Breed</th>
                                                <th>Hatch Day</th>
                                                <th>Sex</th>
                                                <th>Weight</th>
                                                <th>Micro Chip</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="bird" items="requestScope.birds">
                                            <tr>
                                                <td>
                                                    <h2 class="table-avatar">
                                                        <a href="" class="avatar avatar-sm mr-2">
                                                            <img class="avatar-img rounded-circle" src="../assets/images/bird/${bird.image.imageURLName}" alt="User Image" />
                                                        </a>
                                                        <a href="">${bird.birdFullname}</a>
                                                    </h2>
                                                </td>
                                                <td>${bird.breed}</td>
                                                <td>${bird.hatchingDate}</td>
                                                <td>${bird.birdGender}</td>
                                                <td>${bird.birdWeight}</td>
                                                <td>${bird.band_chip}</td>
                                                <td class="text-right">
                                                    <div class="table-action">
                                                        <a href="javascript:void(0);" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Appointment Tab -->
                </div>
                <a href="assignBird.jsp" class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i></a>
                <!-- Tab Content -->
            </div>
        </div>
    </div>s
</html>
