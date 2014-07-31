<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <%@include file="link_list.jsp" %>
            
    <div class="col-md-8 ">
        <!-- Default panel contents -->
        <div class="panel panel-default">
            <div class="panel-heading">Turniere</div>
            <ul class="list-group">
                <c:forEach var="tournament" items="${team.tournaments}">
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/tournament/${tournament.name}">${tournament.name}</a></li>
                </c:forEach>
            </ul>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 --> 
</div> <!-- /.row --> 