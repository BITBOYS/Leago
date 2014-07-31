<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">
    <h1>So w&uuml;rde der Spielplan aussehen.</h1>
    <h2>M&ouml;chtest du ihn jetzt erstellen?</h2>
    <p>
        <form action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/schedule" method="POST">
            <input type="hidden" value="accept" name="action">
            <input type="submit" class="btn btn-leago btn-primary" value="Spielplan erstellen">
            oder <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings">zurück</a>
        </form>
        
    </p>
</div>
<hr>    
    
<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-leago">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-gamepad"></i> Spielplan</div>

            <!-- Table -->
            <div class="tab-content">
            <c:forEach items="${schedule.rounds}" var="round" varStatus="loop">
                <c:choose>
                    <c:when test="${loop.index == 0}">
                        <div class="table-responsive tab-pane active no-margin" id="round${loop.index + 1}">
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive tab-pane no-margin" id="round${loop.index + 1}">
                    </c:otherwise>
                </c:choose>
                    <table class="table table-hover">
                        <tbody>
                            <tr class="text-center"><td colspan="3"><b>Runde ${round.round}</b></td></tr>
                            <c:forEach items="${round.matches}" var="match">
                                <tr>
                                    <td class="text-right"><a href="${pageContext.request.contextPath}/team/${match.team1.name}">${match.team1.name}</a></td>
                                    <td class="text-center">vs</td>
                                    <td><a href="${pageContext.request.contextPath}/team/${match.team2.name}">${match.team2.name}</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </div>
            </c:forEach>
            </div>
        </div><!-- /.panel -->
    </div><!-- col-md-8 -->
</div>
    
<div class="text-center">
    <ul class="pagination">
        <c:forEach items="${schedule.rounds}" varStatus="loop">
            <c:choose>
                <c:when test="${loop.index+1 == param.round || (param.round == null && loop.index+1 == 1)}">
                    <li class="active"><a href="#round${loop.index + 1}" data-toggle="tab">${loop.index + 1}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="#round${loop.index + 1}" data-toggle="tab">${loop.index + 1}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>
</div>