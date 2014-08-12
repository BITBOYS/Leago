<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="leago.i18n.bundle" />
<div class="row">
    
    <%@include file="link_list.jsp" %>
            
    <div class="col-md-8">
        <!-- Default panel contents -->
        <div class="panel panel-default">
            <div class="panel-heading"><fmt:message key="user_settings.header.tournaments"/></div>
            <ul class="list-group">
                <c:forEach var="tournament" items="${user.tournaments}">
                    <li class="list-group-item"><c:if test="${tournament.leader.name == user.name}"><i class="fa fa-star-o"></i></c:if> <a href="${pageContext.request.contextPath}/tournament/${tournament.name}">${tournament.name}</a></li>
                </c:forEach>
            </ul>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 --> 
</div> <!-- /.row --> 