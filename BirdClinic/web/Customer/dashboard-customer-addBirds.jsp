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
            <div class="card-body">
                <!-- Profile Settings Form -->
                <form method='POST' action="<c:url value='/Customer/Dashboard/Birds/Insert'/>">
                    <div class="row form-row">
                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <div class="change-avatar">
                                    <div class="profile-img">
                                        <img src="assets/img/bird/bird-1.webp" alt="Bird Image" />
                                    </div>
                                    <div class="upload-img">
                                        <div class="change-photo-btn">
                                            <span><i class="fa fa-upload"></i> Upload Photo</span>
                                            <input type="file" class="upload" />
                                        </div>
                                        <small class="form-text text-muted">Allowed JPG, GIF or PNG. Max size of 2MB</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Bird's Name</label>
                                <input type="text" class="form-control" name='bird-full-name' required />
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Hatching Date</label>
                                <div class="">
                                    <input type="date" class="form-control " name='hatching-date' required/>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Breed</label>
                                <input type="text" class="form-control" name='breed' required/>
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Sex</label>
                                <select class="form-control" name='bird-gender' required>
                                    <option value='male'>Male</option>
                                    <option value='female'>Female</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Weight (in grams)</label>
                                <input type="number" class="form-control" name="bird-weight" placeholder="Enter weight in grams" step="0.1" value="" required />
                            </div>
                        </div>
                        
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Color</label>
                                <input type="text" class="form-control" name='feather-color' required />
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label>Band/Microchip ID</label>
                                <input type="text" class="form-control" name="band_chip" value="" required/>
                            </div>
                        </div>

                        <div class="submit-section mt-4">
                            <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                        </div>
                </form>
                <!-- /Profile Settings Form -->
            </div>
        </div>
    </div>
</div>
</html>
