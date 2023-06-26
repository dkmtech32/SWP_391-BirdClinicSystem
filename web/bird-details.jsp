<%-- 
    Document   : bird-details
    Created on : Jun 24, 2023, 3:31:50 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="common/header-guest.jsp"/>
    <body>
        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Header -->
            <jsp:include page="Common/header-guest.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="bird-detail-page-container">
                <div class="bird-detail-page">  
                    <div class="bird-general-info">
                        <div class="avatar-image">
                            <img src="assets/img/about-1.jpg" class="bird-avatar"/>
                            <h2>Andy</h2>
                        </div>
                        <div class="bird-information-boxes">
                            <div class="bird-information-box">
                                <p class="header">Bird's name</p>
                                <p class="information">${bird.birdFullname}</p>
                            </div>
                            <div class="bird-information-box">
                                <p class="header">Hatching Day</p>
                                <p class="information">${bird.hatchingDate}</p>
                            </div>
                            <div class="bird-information-box">
                                <p class="header">Breed</p>
                                <p class="information">${bird.breed}</p>
                            </div>
                            <div class="bird-information-box">
                                <p class="header">Sex</p>
                                <p class="information">${bird.birdGender}</p>
                            </div>
                            <div class="bird-information-box">
                                <p class="header">Weigth</p>
                                <p class="information">${bird.birdWeight}</p>
                            </div>
                            <div class="bird-information-box">
                                <p class="header">Microchip</p>
                                <p class="information">${bird.microchip}</p>
                            </div>
                            <div class="bird-information-box">
                                <p class="header">Sex Method</p>
                                <p class="information">${bird.sexingMethod}</p>
                            </div>
                            <div class="bird-information-box">
                                <p class="header">Feather Color</p>
                                <p class="information">${bird.featherColor}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 col-lg-8 col-xl-9">
                        <div class="card">
                            <div class="card-body pt-0">
                                <!-- Tab Menu -->
                                <nav class="user-tabs mb-4">
                                    <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="#pat_appointments" data-toggle="tab">Medical Record</a>
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
                                                                <th class="text-center">Appointment Time</th>
                                                                <th></th>
                                                                <th class="text-center">Diagnosis</th>
                                                                <th></th>
                                                                <th class="text-center">Doctor</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr> <!-- làm vòng lặp xổ tất cả danh sách medical record của con chim này -->
                                                                <td class="text-center">${medicalRecord.recordTime}</td>
                                                                <td></td>
                                                                <td class="text-center">${medicalRecord.diagnosis}</td>
                                                                <td></td>
                                                                <td class="text-center">${medicalRecord.doctor}</td>
                                                                <td></td>
                                                                <td class="text-right">
                                                                    <div class="table-action">
                                                                        <a href="client-appointments-details.html" class="btn btn-sm bg-info-light"> <i class="far fa-eye"></i> View </a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<!-- /Page Content -->

<!-- Footer -->
<jsp:include page="Common/footer.jsp"/>
<!-- /Footer -->
</div>
<!-- /Main Wrapper -->

<!-- Script -->
<jsp:include page="Common/script.jsp"/>
<!-- /Script -->
</body>
</html>
