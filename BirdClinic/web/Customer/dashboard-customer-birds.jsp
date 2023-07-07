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
                                        <a class="nav-link active" href="#pat_appointments" data-toggle="tab">My Birds</a>
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
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="doctor-profile.jsp" class="avatar avatar-sm mr-2">
                                                                        <img class="avatar-img rounded-circle" src="../assets/img/bird/bird-1.webp" alt="User Image" />
                                                                    </a>
                                                                    <a href="doctor-profile.jsp">Charlie</a>
                                                                </h2>
                                                            </td>
                                                            <td>Sparow</td>
                                                            <td>6 Nov 2023</td>
                                                            <td>Male</td>
                                                            <td>1kg</td>
                                                            <td><span class="badge badge-pill bg-danger-light">No</span></td>
                                                            <td class="text-right">
                                                                <div class="table-action">
                                                                    <a href="javascript:void(0);" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="doctor-profile.jsp" class="avatar avatar-sm mr-2">
                                                                        <img class="avatar-img rounded-circle" src="../assets/img/bird/bird-2.webp" alt="User Image" />
                                                                    </a>
                                                                    <a href="doctor-profile.jsp">Lucifer</a>
                                                                </h2>
                                                            </td>
                                                            <td>Cuckoo</td>
                                                            <td>7 Nov 2023</td>
                                                            <td>Female</td>
                                                            <td>1.5kg</td>
                                                            <td><span class="badge badge-pill bg-success-light">Yes</span></td>
                                                            <td class="text-right">
                                                                <div class="table-action">
                                                                    <a href="javascript:void(0);" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="doctor-profile.jsp" class="avatar avatar-sm mr-2">
                                                                        <img class="avatar-img rounded-circle" src="../assets/img/bird/bird-3.jpg" alt="User Image" />
                                                                    </a>
                                                                    <a href="doctor-profile.jsp">Luffy</a>
                                                                </h2>
                                                            </td>
                                                            <td>Red-whiskered</td>
                                                            <td>4 Jun 2023</td>
                                                            <td>Female</td>
                                                            <td>2.2kg</td>
                                                            <td><span class="badge badge-pill bg-success-light">Yes</span></td>
                                                            <td class="text-right">
                                                                <div class="table-action">
                                                                    <a href="invoice-view.jsp" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="doctor-profile.jsp" class="avatar avatar-sm mr-2">
                                                                        <img class="avatar-img rounded-circle" src="../assets/img/bird/bird-4.jpg" alt="User Image" />
                                                                    </a>
                                                                    <a href="doctor-profile.jsp">Jacky</a>
                                                                </h2>
                                                            </td>
                                                            <td>Parrot</td>
                                                            <td>1 Nov 2022</td>
                                                            <td>Male</td>
                                                            <td>3kg</td>
                                                            <td><span class="badge badge-pill bg-success-light">Yes</span></td>
                                                            <td class="text-right">
                                                                <div class="table-action">
                                                                    <a href="javascript:void(0);" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                </div>
                                                            </td>
                                                        </tr>
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
