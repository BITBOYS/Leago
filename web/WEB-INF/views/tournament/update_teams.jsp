<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <%@include file="link_list.jsp" %>

    <div class="col-md-8">

        <div class="panel panel-danger">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-trash-o"></i> Teams entfernen</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <!-- Table -->
                    <table class="table">
                        <tbody>
                            <c:choose>
                                <c:when test="${empty tournament.teams}">
                                    <tr>
                                        <p>Kein Teams im Turnier</p> 
                                    </tr>
                                </c:when>
                            <c:otherwise>
                                <c:forEach items="${tournament.teams}" var="team">
                                    <tr>
                                        <td>
                                            <div class="col-md-9">
                                                <ul class="nav nav-pills">
                                                    <p>Das L&ouml;schen des Turniers kann <b>nicht</b> r&uuml;ckg&auml;ngig gemacht werden!</p>
                                                    <a href="${pageContext.request.contextPath}/team?team=${team.name}">${team.name}</a> 
                                                </ul>
                                            </div>
                                            <div class="col-sm-3">
                                                <form method="post" action="${pageContext.request.contextPath}/team?action=kick" id="${team.name}">
                                                    <input type="text" value="${team.name}" name="kick_team" style="display:none">
                                                    <a onclick="document.getElementById('${team.name}').submit();" class="btn btn-danger btn-leago">Entfernen <i class="fa fa-angle-right"></i></a>
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
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.col --> 
</div>
