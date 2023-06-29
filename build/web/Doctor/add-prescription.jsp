<%-- 
    Document   : bookInfo-all
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
            <jsp:include page="../Common/header-guest.jsp"/>
            <!--/Header -->

            <!-- Breadcrumb -->
            <jsp:include page="../Common/breadcrumb.jsp"/>
            <!-- /Breadcrumb -->

            <!-- Page Content -->
            <div class="text-center fw-bold" id="title">
                <h1 class="mt-3">Prescription Tool for Doctors</h1>

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
                        <div class="form-group mt-3">
                            <label for="address">Diagnosis :</label>
                            <input class="form-control" id="diagnosis" placeholder="" >
                        </div>

                    </div>

                    <div class="col-md-8">
                        <h3 class="text-center prescription">Prescription :</h3>


                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                            <label class="btn btn btn-primary" for="btnradio1">1 Day</label>

                            <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                            <label class="btn btn btn-primary" for="btnradio2">2 Days</label>

                            <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                            <label class="btn btn btn-primary" for="btnradio3">3 Days</label>

                            <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
                            <label class="btn btn btn-primary" for="btnradio4"><input type="text" size="1"> Days</label>
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
                                    <br>
                                    <button class="btn btn-default pull-right add-row"><i
                                            class="fa fa-plus"></i>&nbsp;&nbsp; Add Row</button>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-bordered" id="editableTable">
                                        <thead>
                                            <tr>
                                                <th>Medicine</th>
                                                <th>Quantity</th>
                                                <th>Unit</th>
                                                <th>Description</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr data-id="1">
                                                <td data-field="medicine">
                                                    <input type="text" id="medicine-input" name="medicine-input"
                                                           style="border: 0;">
                                                    <div id="results-container"></div>
                                                </td>
                                                <td data-field="quantity">30</td>
                                                <td data-field="unit">pills</td>
                                                <td data-field="description">1-morning, 2-night</td>
                                                <td>
                                                    <a class="button button-small edit" title="Edit">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>

                                                    <a class="button button-small edit" title="Delete">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr data-id="2">
                                                <td data-field="medicine">ibuprofen</td>
                                                <td data-field="quantity">24</td>
                                                <td data-field="unit">pills</td>
                                                <td data-field="description">1 tablet every 6 hours as needed for pain</td>
                                                <td>
                                                    <a class="button button-small edit" title="Edit">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>

                                                    <a class="button button-small edit" title="Delete">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>

                                            <tr data-id="3">
                                                <td data-field="medicine">omeprazole</td>
                                                <td data-field="quantity">30</td>
                                                <td data-field="unit">capsules</td>
                                                <td data-field="description">1 capsule before breakfast for 14 days</td>
                                                <td>
                                                    <a class="button button-small edit" title="Edit">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>

                                                    <a class="button button-small edit" title="Delete">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>

                                            <tr data-id="4">
                                                <td data-field="medicine">loratadine</td>
                                                <td data-field="quantity">10</td>
                                                <td data-field="unit">mg</td>
                                                <td data-field="description">1 tablet daily for allergies</td>
                                                <td>
                                                    <a class="button button-small edit" title="Edit">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>

                                                    <a class="button button-small edit" title="Delete">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                </td>
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
                                    <textarea class="form-control" rows="4" placeholder="Note for bird" ></textarea>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <button onclick="" class="btn btn-dark d-flex justify-content-center mx-auto mt-2">
                    Submit
                </button>
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
