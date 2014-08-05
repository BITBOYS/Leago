<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="leago.i18n.bundle" />

<div class="row">
    <%@include file="link_list.jsp" %>
            
    <c:forEach var="team" items="${user.teams}" varStatus="loop">
        <c:choose>
            <c:when test="${loop.index < 2}">
                <div class="col-md-8 ">
            </c:when>
            <c:when test="${loop.index > 1}">  
                <div class="col-md-8 col-md-offset-4">
            </c:when>
        </c:choose> 
                    <!-- Default panel contents -->
                    <div class="panel panel-danger">
                        <div class="panel-heading"><span class="glyphicon glyphicon-remove"></span> <fmt:message key="user_settings.header.leave"/></div>
                        <div class="panel-body">
                            <div class="col-xs-12">
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
                            </div>
                        </div>
                    </div> <!-- /.panel--> 
                </div> <!-- /.grid 8 --> 
    </c:forEach>
</div>