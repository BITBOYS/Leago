<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="leago.i18n.bundle" />

<div class="col-md-4">
    <div class="list-group">
        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/profile" class="list-group-item <c:if test="${settings_action == 'profile'}">active</c:if>">
            <h4><span class="fa fa-sitemap"></span> <fmt:message key="tournament_settings.link.tournament"/></h4>
            <p class="list-group-item-text"><fmt:message key="tournament_settings.info.tournament"/></p>
        </a>
        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/teams" class="list-group-item <c:if test="${settings_action == 'teams'}">active</c:if>">
            <h4><span class="fa fa-users"></span> <fmt:message key="tournament_settings.link.teams"/></h4> 
            <p class="list-group-item-text"><fmt:message key="tournament_settings.info.teams"/></p>
        </a>
        <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/danger" class="list-group-item <c:if test="${settings_action == 'danger'}">active</c:if>"> 
            <h4 class="list-group-item-heading"><span class="fa fa-exclamation-triangle"></span> <fmt:message key="tournament_settings.link.danger"/></h4> 
            <p class="list-group-item-text"> <fmt:message key="tournament_settings.info.danger"/></p>
        </a>
    </div>
    <p><a href="${pageContext.request.contextPath}/tournament/${tournament.name}"><span class="fa fa-long-arrow-left"></span> <fmt:message key="tournament_settings.link.back"/></a></p>
</div>