<%-- 
    Document   : bird-general-info
    Created on : Jul 7, 2023, 8:07:26 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="bird-general-info">
            <div class="avatar-image">
                <img src="assets/img/about-1.jpg" class="bird-avatar"/>
                <h2><a href="../Common/bird-details.jsp">${bird.birdFullname}</a></h2>
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
                    <p class="header">Weight</p>
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
    </body>
</html>
