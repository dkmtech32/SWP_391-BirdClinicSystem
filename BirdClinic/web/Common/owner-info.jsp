<%-- 
    Document   : owner-info
    Created on : Jul 7, 2023, 8:23:17 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="col-md-6 col-lg-7 col-xl-8">
            <div class="card">
                <div class="card-body">
                    <div class="row form-row">
                        <div class="col-6 col-md-6">
                            <div class="form-group">
                                <div class="change-avatar">
                                    <div class="profile-img">
                                        <img src="../assets/images/client/${appointment.bird.customer.image.imageURLName}" alt="User Image" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Full Name</label>
                                <div class="form-control">${appointment.bird.customer.fullName}</div>
                            </div>
                        </div>
                        
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Date of Birth</label>
                                <div class="cal-icon">
                                    <div class="form-control datetimepicker">${appointment.bird.customer.dob}</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Address</label>
                                <div class="form-control">${appointment.bird.customer.customerAddress}</div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Email</label>
                                <div class="form-control">${appointment.bird.customer.email}</div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Mobile</label>
                                <div class="form-control">${appointment.bird.customer.phoneNumber}</div> 
                            </div>
                        </div>
                            
                           
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
