<%-- 
    Document   : booking-list
    Created on : Jun 20, 2023, 12:12:36 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="Common/head.jsp"/>
    <body>
        <section class="main-wrapper">
            <jsp:include page="Common/header-guest.jsp"/>
            <jsp:include page="Common/breadcrumb.jsp.jsp"/>
            <!-- Page Content -->
            <div class="text-center fw-bold" id="title">
                <h1 class="mt-3">Prescription</h1>

                <hr>
            </div>
            <div class="container-fluid p-5 mt-4" id="prescriptionForm">
                <div class="row">
                    <div class="col-md-4 ">
                        <h3 class="text-center">Details :</h3>
                        <div class="form-group">
                            <label for="name">Customer Name :</label>
                            <input type="text" class="form-control" id="name" value="Nguyen Van G" readonly>
                        </div>

                        <div class="form-group mt-3">
                            <label for="age">Bird name :</label>
                            <input type="text" class="form-control" id="bird-name" value="Chó" readonly>
                        </div>

                        <div class="form-group mt-3">
                            <label for="address">Breed :</label>
                            <input class="form-control" id="breed" value="Sparrow" readonly>
                        </div>

                        <div class="form-group mt-3">
                            <label for="gender">Gender :</label>
                            <select class="form-select" aria-label="Default select example" id="gender" disabled>
                                <option value="">Select Gender</option>
                                <option value="Male" selected>Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>

                        <div class="form-group mt-3">
                            <label for="date">Date :</label>
                            <input type="date" class="form-control" value="2023-06-16" id="date" readonly>
                        </div>

                    </div>

                    <div class="col-md-8">
                        <h3 class="text-center prescription">Prescription :</h3>
                        <div id="indays">
                            <div class="btn-group" role="group" aria-label="Basic example">

                                <button type="button" class="btn btn-primary" disabled>3 Days</button>

                            </div>

                        </div>
                        <!-- <div class="form-group mt-3" id="mn">
                                <label for="medicalNotes">Medical Notes :</label>
                                <textarea class="form-control note-field" id="medicalNotes" rows='2'></textarea>
                                <div class="gap-2 d-flex justify-content-end mt-2 ms-auto">
                                        <button onclick="addNewMNField()" class="btn btn-success" id="mnAdd"
                                                type="button">Add</button>
                                        <button onclick="delNewMNField()" class="btn btn-danger" id="mnDel" type="button">
                                                Delete
                                        </button>
                                </div>
                        </div>

                        

                        <div class="form-group mt-3" id="md">
                                <label for="medicineDetails">Medicine Details :</label>
                                <textarea class="form-control detail-field" id="medicineDetails" rows='2'></textarea>
                                <div class="gap-2 d-flex justify-content-end mt-2 ms-auto">
                                        <button onclick="addNewMDField()" class="btn btn-success" id="mdAdd"
                                                type="button">Add</button>
                                        <button onclick="delNewMDField()" class="btn btn-danger" id="mdDel" type="button">
                                                Delete
                                        </button>
                                </div>
                        </div> -->
                        <!-- <div id="tags">
                                <p id="center">
                                  <select class="search" id="search">
                                        <option value="">Select a tag...</option>
                                        <option value="dt-dd">&#60;dt&#62; &amp; &#60;dd&#62;</option>
                                        <option value="det-sum">&#60;details&#62; &amp; &#60;summary&#62;</option>
                                        <option value="sub-sup">&#60;sub&#62; &amp; &#60;sup&#62;</option>
                                        <option value="del-ins">&#60;del&#62; &amp; &#60;ins&#62;</option>
                                        <option value="a">&#60;a&#62;</option>
                                        <option value="b-i">&#60;b&#62; &amp; &#60;i&#62;</option>
                                  </select>
                                </p>
                          </div>
                        -->
                        <div class="container">

                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-bordered" >
                                        <thead>
                                            <tr>
                                                <th>Medicine</th>
                                                <th>Quantity</th>
                                                <th>Unit</th>
                                                <th>Description</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <tr >
                                                <td >ibuprofen</td>
                                                <td >24</td>
                                                <td >pills</td>
                                                <td >1 tablet every 6 hours as needed for pain</td>

                                            </tr>

                                            <tr >
                                                <td >omeprazole</td>
                                                <td>30</td>
                                                <td >capsules</td>
                                                <td >1 capsule before breakfast for 14 days</td>											
                                            </tr>

                                            <tr >
                                                <td >loratadine</td>
                                                <td >10</td>
                                                <td >mg</td>
                                                <td >1 tablet daily for allergies</td>											
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="info-widget">
                            <h4 class="card-title">Notes</h4>						
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">													
                                    <textarea class="form-control" rows="4" placeholder="Note for bird" readonly >Upon examination, the bird appears weak and is exhibiting signs of weight loss. The mucous membranes appear pale, and there is evidence of dehydration. No obvious abnormalities were detected upon physical examination.</textarea>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>


            </div>

            <!-- /Page Content -->
            <jsp:include page="Common/footer.jsp"/>
        </section>
    </body>
</html>
