<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-4">
    <div class="list-group">
        <a href="${pageContext.request.contextPath}/team/${team.name}/settings/profile" class="list-group-item <c:if test="${settings_action == 'profile'}">active</c:if>">
            <h4><span class="fa fa-info"></span> Team settings</h4>
            <p class="list-group-item-text">Change the Team settings</p>
        </a>
        <a href="${pageContext.request.contextPath}/team/${team.name}/settings/member" class="list-group-item <c:if test="${settings_action == 'member'}">active</c:if>">
            <h4><span class="fa fa-users"></span> Member</h4> 
            <p class="list-group-item-text">Kick or add individual user</p>
        </a>
        <a href="${pageContext.request.contextPath}/team/${team.name}/settings/tournaments" class="list-group-item <c:if test="${settings_action == 'tournaments'}">active</c:if>"> 
            <h4 class="list-group-item-heading"><span class="fa fa-sitemap"></span> Tournaments</h4> 
            <p class="list-group-item-text">Your own tournaments</p>
        </a>
    </div>
    <p><a href="${pageContext.request.contextPath}/team/${team.name}"><span class="fa fa-long-arrow-left"></span> zurück zum Teamprofil</a></p>
</div>