<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="leago.i18n.bundle" />

<div class="row">
    <%@include file="link_list.jsp" %>
    
    <div class="col-md-8 ">
        <!-- Default panel contents -->
        <div class="panel panel-danger">
            <div class="panel-heading"><span class="glyphicon glyphicon-remove"></span> <fmt:message key="user_settings.header.leave"/></div>
            <ul class="list-group">
                <c:forEach var="team" items="${user.teams}">
                    <li class="list-group-item">
                        <p><fmt:message key="user_settings.label.leave"/> <b><a href="${pageContext.request.contextPath}/team/${team.name}">${team.name}</a></b></p>
                        <p><fmt:message key="user_settings.info.leave"/></p> 
                        <c:choose>
                            <c:when test="${user.name == team.leader.name}">
                                    <button class="btn btn-primary btn-danger" disabled><fmt:message key="user_settings.submit.leave"/></button>
                                    <i class="fa fa-exclamation-triangle"></i> <fmt:message key="user_settings.info.cant_leave"/>
                            </c:when>
                            <c:otherwise>
                                <form role="form" name="leave_${team.name}" method="post" action="${pageContext.request.contextPath}/settings/teams">
                                    <input type="hidden" name="action" value="exit">
                                    <input type="hidden" name="team" value="${loop.index}">
                                    <button type="submit" class="btn btn-primary btn-danger"><fmt:message key="user_settings.submit.leave"/></button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </c:forEach>
            </ul>
        </div> <!-- /.panel--> 
    </div>
</div>