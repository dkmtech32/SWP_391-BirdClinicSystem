<%-- 
    Document   : give-feedback
    Created on : Jul 7, 2023, 8:46:36 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h2>Owner's feedback</h2> <!-- bắt đầu từ đây trở xuống là cho feedback-->
        <div class="owner-feedback">
            <div class="feedback-rating">
                <h4>Rating</h4>
                <select class="form-control select w-75">
                    <!--                            <option>1</option>
                                                    <option>1.5</option>
                                                    <option>2</option>
                                                    <option>2.5</option>
                                                    <option>3</option>
                                                    <option>3.5</option>
                                                    <option>4</option>
                                                    <option>4.5</option>
                                                    <option>5</option>-->
                    <c:forEach>
                        <option>${appoitment.rating}</option> 
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-11">
                <h4>Feedback</h4>
                <div class="form-group">													
                    <textarea class="form-control" rows="4" placeholder="Owner's feedback"
                              style="word-wrap: break-word; height: 9rem">
                    </textarea>
                </div>
            </div>
        </div> <!-- từ đây là hết phần feedback-->
        <jsp:include page="../Common/script.jsp"/>
    </body>
</html>
