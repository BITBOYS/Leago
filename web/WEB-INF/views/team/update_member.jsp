<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row">
    <%@include file="link_list.jsp" %>
            
    <div class="col-md-8 ">
        <!-- Default panel contents -->
        <div class="panel panel-danger">
            <div class="panel-heading"><span class="glyphicon glyphicon-remove"></span> User aus dem Team entfernen</div>
            <div class="panel-body">

                <p>Das Entfernen des Users kann nicht rückgängig gemacht werden. Der User kann nur per erneuter Einladung wieder in das Team
                aufgenommen werden.</p> 

                <form role="form" name="kick_${team.name}" action="${pageContext.request.contextPath}/team/${team.name}/settings/member" method="POST">
                    <input type="hidden" name="action" value="kick">
                    <div class="form-group 8">
                        <select class="form-control" name="member" required>
                            <c:forEach var="member" items="${team.member}" varStatus="loop">
                                <c:if test="${member.name != team.leader.name}">
                                    <option value="${loop.index}">${member.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="btn btn-primary btn-danger" type="submit">User entfernen</button>
                </form>

            </div>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 --> 
            
    <div class="col-md-8 ">
        <!-- Default panel contents -->
        <div class="panel panel-default">
            <div class="panel-heading"><span class="glyphicon glyphicon-plus"></span> Jemanden ins Team einladen</div>
            <div class="panel-body">

                <p>Lade einen User ein, Mitglied in deinem Team zu werden. Er wird im Anschluss benachrichtigt und kann die Einladung akzeptieren.</p> 

                <form role="form" name="invite_${team.name}" action="${pageContext.request.contextPath}/team/${team.name}/settings/member" method="POST">
                    <input type="hidden" name="action" value="invite">
                    
                    <div class="form-group">
                        <label>User</label>
                        <input type="text" class="form-control" name="new_user" required>
                    </div>
                    
                    <button class="btn btn-primary btn-leago" type="submit">User einladen</button>
                </form>
            </div>
        </div> <!-- /.panel--> 
    </div> <!-- /.grid 8 -->
</div>