<%-- 
    Document   : 
    Created on : Jun 20, 2023, 11:06:50 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <div class="col-md-8 col-lg-9 col-xl-10">
        <div class="card">
            <div class="card-body">
                <!-- Profile Settings Form -->
                <form method='POST' action="<c:url value='/Customer/Dashboard/Birds/Insert'/>" enctype="multipart/form-data">
                    <div class="row form-row">
                        <div class="col-12 col-md-12">
                            <div class="form-group">
                                <div class="change-avatar">
                                    <!--                                    <div class="profile-img">
                                                                             Add this image element after the existing profile image 
                                                                        </div>-->
                                    <!-- Add this container to display the selected bird image -->
                                    <div id="bird-image-preview-container">
                                        <img id="bird-image-preview" alt="Selected Bird Image" style="width: 1500px; height: 150px; margin-top: 10px; margin-right: 1rem; display: none; border-radius: 50%">
                                    </div>

                                    <div class="upload-img">
                                        <div class="change-photo-btn">
                                            <span><i class="fa fa-upload"></i> Upload Photo</span>
                                            <!-- Add an onchange attribute to the input file element -->
                                            <input name="bird-image" id="bird-image" type="file" class="upload" onchange="previewImage(event)" />
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
                                <input type="number" 
                                       class="form-control"
                                       name="bird-weight" 
                                       placeholder="Enter weight in grams" 
                                       step="10" value="200" required="required" 
                                       onblur="validateQuantity(this)"
                                       />
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
                    </div>
                </form>
                <!-- /Profile Settings Form -->
            </div>
        </div>
    </div>
    <script>
        function previewImage() {
            var input = document.getElementById("bird-image");
            var container = document.getElementById("bird-image-preview-container");

            // Remove any existing preview image
            var existingPreview = document.getElementById("bird-image-preview");
            if (existingPreview) {
                container.removeChild(existingPreview);
            }

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var previewImage = document.createElement("img");
                    previewImage.id = "bird-image-preview";
                    previewImage.src = e.target.result;
                    previewImage.alt = "Selected Bird Image";
                    previewImage.style.maxWidth = "200px";
                    previewImage.style.marginTop = "10px";

                    // Append the preview image to the container
                    container.appendChild(previewImage);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <script>
        function validateQuantity(input) {
            if (input.value < 200) {
                input.setCustomValidity("Weight must be 200 grams or more.");
            } else {
                input.setCustomValidity("");
            }
        }
    </script>

</html>
