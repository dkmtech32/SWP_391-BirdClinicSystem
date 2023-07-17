<%-- 
    Document   : give-feedback
    Created on : Jul 7, 2023, 8:46:36 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <form method="POST" action="<c:url value="/Customer/Feedback?appointmentID=${requestScope.appointment.appointmentID}"/>">
            <h2>Owner's feedback</h2> <!-- bắt đầu từ đây trở xuống là cho feedback-->
            <div class="owner-feedback">
                <div class="feedback-rating">
                    <h4>Rating</h4>
                    <select class="form-control select w-75" name="rating">
                        <option value="1">1</option>
                        <option value="1.5">1.5</option>
                        <option value="2">2</option>
                        <option value="2.5">2.5</option>
                        <option value="3">3</option>
                        <option value="3.5">3.5</option>
                        <option value="4">4</option>
                        <option value="4.5">4.5</option>
                        <option value="5">5</option>

                    </select>
                </div>
                <div class="col-md-11">
                    <h4>Feedback</h4>
                    <div class="form-group">
                        <label>Title</label>
                        <input name="title"/>
                    </div>

                    <div class="form-group">													
                        <textarea class="form-control" rows="4" placeholder="Owner's feedback"
                                  style="word-wrap: break-word; height: 9rem" name="feedbackContent"> 
                        </textarea>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary"> Submit</button>
        </form><!-- từ đây là hết phần feedback-->
    </body>
</html>
