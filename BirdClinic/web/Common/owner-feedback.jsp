<%-- 
    Document   : owner-feedback
    Created on : Jul 7, 2023, 8:38:40 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h2>Owner's feedback</h2> <!-- chỉ hiện khi user đưa feedback rồi -->
    <c:choose>
        <c:when test="${appointment.rating =='1'}">
            <div class="col-md-12 col-sm-12">
                <div class="rating">
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </c:when>
        <c:when test="${appointment.rating =='1.5'}">
            <div class="col-md-12 col-sm-12">
                <div class="rating">
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star-half-alt filled"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </c:when>
        <c:when test="${appointment.rating =='2'}">
            <div class="col-md-12 col-sm-12">
                <div class="rating">
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </c:when>
        <c:when test="${appointment.rating =='2.5'}">
            <div class="col-md-12 col-sm-12">
                <div class="rating">
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star-half-alt filled"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </c:when>
        <c:when test="${appointment.rating =='3'}">
            <div class="col-md-12 col-sm-12">
                <div class="rating">
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </c:when>
        <c:when test="${appointment.rating =='3.5'}">
            <div class="col-md-12 col-sm-12">
                <div class="rating">
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star-half-alt filled"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </c:when>
        <c:when test="${appointment.rating =='4'}">
            <div class="col-md-12 col-sm-12">
                <div class="rating">
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </c:when>
        <c:when test="${appointment.rating =='4.5'}">
            <div class="col-md-12 col-sm-12">
                <div class="rating">
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star-half-alt filled"></i>
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </c:when>
        <c:when test="${appointment.rating =='5'}">
            <div class="col-md-12 col-sm-12">
                <div class="rating">
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                    <i class="fas fa-star filled"></i>
                </div>
            </div>
        </c:when>
    </c:choose>
    <div class="col-md-12 col-sm-12">
        <div class="form-group">													
            <div class="form-control" rows="4" placeholder="Owner's feedback"
                 style="word-wrap: break-word; height: 9rem">
                ${appointment.ownerFeedback}
            </div>
        </div>
    </div>
</body>
</html>
