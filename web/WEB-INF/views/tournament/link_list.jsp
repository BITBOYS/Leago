<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-4">
    <div class="list-group">
        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/tournament" class="list-group-item <c:if test="${settings_action == 'tournament'}">active</c:if>">
            <h4><span class="fa fa-sitemap"></span> Tournament settings</h4>
            <p class="list-group-item-text">Change the Tournament values</p>
        </a>
        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/team" class="list-group-item <c:if test="${settings_action == 'team'}">active</c:if>">
            <h4><span class="fa fa-users"></span> Teams settings</h4> 
            <p class="list-group-item-text">Kick od add individual Teams ${settings_action}</p>
        </a>
        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/danger" class="list-group-item <c:if test="${settings_action == 'danger'}">active</c:if>"> 
            <h4 class="list-group-item-heading"><span class="fa fa-exclamation-triangle"></span> Danger zone</h4> 
            <p class="list-group-item-text">Delete the tournament ${tournament.name}</p>
        </a>
    </div>
</div>