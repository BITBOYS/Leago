<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row">
    <%@include file="link_list.jsp" %>
    
    <c:choose>
        <c:when test="${empty tournament.teams}">
            <div class="col-md-8 ">
                Es ist kein Team im Turnier vorhanden.
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach items="${tournament.teams}" var="team" varStatus="loop">
                <c:choose>
                    <c:when test="${loop.index < 2}">
                        <div class="col-md-8 ">
                    </c:when>
                    <c:when test="${loop.index > 1}">  
                        <div class="col-md-8 col-md-offset-4">
                    </c:when>
                </c:choose> 
                            <!-- Default panel contents -->
                            <div class="panel panel-default">
                                <div class="panel-heading"><span class="glyphicon glyphicon-remove"></span> <a href="${pageContext.request.contextPath}/team/${team.name}">${team.name}</a> aus <a href="${pageContext.request.contextPath}/tournament/${tournament.name}">${tournament.name}</a> entfernen</div>
                                <div class="panel-body">
                                    <div class="col-xs-12">
                                        <p>Das Team kann nur per neuer Einladung wieder am Turnier teilnehmen.</p>
                                        <form role="form" name="leave_${team.name}" method="post" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/teams">
                                            <input type="hidden" name="action" value="kick">
                                            <input type="hidden" name="team" value="${loop.index}">
                                            <button type="submit" class="btn btn-primary btn-danger">${team.name} entfernen</button>
                                        </form>
                                    </div>
                                </div>
                            </div> <!-- /.panel--> 
                        </div> <!-- /.grid 8 --> 
            </c:forEach>   
        </c:otherwise>
    </c:choose>
                    </div>
<!--    <div class="col-md-8">

        <div class="panel panel-danger">
             Default panel contents 
            <div class="panel-heading"><i class="fa fa-trash-o"></i> Teams entfernen</div>
            <div class="panel-body">
                <div class="col-xs-8">
                     Table 
                    <table class="table">
                        <tbody>
                            <c:choose>
                                <c:when test="${empty tournament.teams}">
                                    <tr>
                                        <p>Kein Teams im Turnier</p> 
                                    </tr>
                                </c:when>
                            <c:otherwise>
                                <c:forEach items="${tournament.teams}" var="team" varStatus="loop">
                                    <tr>
                                        <td>
                                            <div class="col-md-9">
                                                <ul class="nav nav-pills">
                                                    <p>Das L&ouml;schen des Turniers kann <b>nicht</b> r&uuml;ckg&auml;ngig gemacht werden!</p>
                                                    <a href="${pageContext.request.contextPath}/team/${team.name}">${team.name}</a> 
                                                </ul>
                                            </div>
                                            <div class="col-sm-3">
                                                <form method="post" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/teams" id="${team.name}">
                                                    <input type="hidden" name="action" value="kick">
                                                    <input type="hidden" name="team" value="${loop.index}">
                                                    <button type="submit" class="btn btn-primary btn-danger">${team.name} entfernen</button>
                                                </form>
                                            </div>
                                        </td> 
                                    </tr>  
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>  /.panel-body  
        </div>  /.panel   
    </div>  /.col  
</div>-->
