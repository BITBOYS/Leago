<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-4">
    <div class="list-group">
        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/profile" class="list-group-item <c:if test="${settings_action == 'profile'}">active</c:if>">
            <h4><span class="fa fa-sitemap"></span> Tournament settings</h4>
            <p class="list-group-item-text">Change the Tournament settings</p>
        </a>
        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/teams" class="list-group-item <c:if test="${settings_action == 'teams'}">active</c:if>">
            <h4><span class="fa fa-users"></span> Teams settings</h4> 
            <p class="list-group-item-text">Kick or add individual Teams</p>
        </a>
        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/danger" class="list-group-item <c:if test="${settings_action == 'danger'}">active</c:if>"> 
            <h4 class="list-group-item-heading"><span class="fa fa-exclamation-triangle"></span> Danger zone</h4> 
            <p class="list-group-item-text">Change the leader or delete the tournament</p>
        </a>
    </div>
</div>