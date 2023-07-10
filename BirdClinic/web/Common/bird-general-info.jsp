<%-- 
    Document   : bird-general-info
    Created on : Jul 7, 2023, 8:07:26 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="col-md-6 col-lg-5 col-xl-4" >
            <div class="card">
                <div class="card-body">
                    <div class="row bird-info">
                       
                        <div class="widget-profile pro-widget-content">
                                    <div class="profile-info-widget">
                                        <a href="#" class="booking-doc-img">
                                            <img src="<c:url value='../assets/images/bird/${appointment.bird.image.imageURLName}'/>" alt="User Image">
                                        </a>
                                        <div class="profile-det-info">
                                            <h3>${appointment.bird.birdFullname}</h3>
                                        </div>
                                    </div>
                                </div>
                        <div class="row bird-information-boxes">
                            <!--                <div class="col-12 col-md-6">
                                                <p class="header">Bird's name</p>
                                                <p class="information"></p>
                                            </div>-->
                            <div class="col-12 col-md-6">
                                <p class="title">Hatching Day: </p>
                                <p class="information">${appointment.bird.hatchingDate}</p>
                            </div>
                            <div class="col-12 col-md-6">
                                <p class="title">Breed: </p>
                                <p class="information">${appointment.bird.breed}</p>
                            </div>
                            <div class="col-12 col-md-6">
                                <p class="title">Sex: </p>
                                <p class="information">${appointment.bird.birdGender}</p>
                            </div>
                            <div class="col-12 col-md-6">
                                <p class="title">Weight: </p>
                                <p class="information">${appointment.bird.birdWeight}</p>
                            </div>
                            <div class="col-12 col-md-6">
                                <p class="title">Microchip: </p>  
                                <p class="information">${appointment.bird.band_Chip}</p>
                            </div>
                            <!--                            <div class="col-12 col-md-6">
                                                            <p>Sex Method</p>
                                                            <p class="information"></p>
                                                        </div>-->
                            <div class="col-12 col-md-6">
                                <p class="title">Feather Color: </p>
                                <p class="information">${appointment.bird.featherColor}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
