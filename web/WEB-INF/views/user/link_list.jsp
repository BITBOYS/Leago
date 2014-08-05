<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="leago.i18n.bundle" />

<div class="col-md-4">
    <div class="list-group">
        
        <a href="${pageContext.request.contextPath}/settings/profile" class="list-group-item <c:if test="${settings_action == 'profile'}">active</c:if>">
            <h4 class="list-group-item-heading"><span class="glyphicon glyphicon-user"></span> <fmt:message key="user_settings.link.account"/></h4>
            <p class="list-group-item-text"><fmt:message key="user_settings.info.account"/></p>
        </a>
        <a href="${pageContext.request.contextPath}/settings/teams" class="list-group-item <c:if test="${settings_action == 'teams'}">active</c:if>">
            <h4 class="list-group-item-heading"><span class="fa fa-users"></span> <fmt:message key="user_settings.link.teams"/></h4> 
            <p class="list-group-item-text"><fmt:message key="user_settings.info.teams"/></p>
        </a>
        <a href="${pageContext.request.contextPath}/settings/tournaments" class="list-group-item <c:if test="${settings_action == 'tournaments'}">active</c:if>"> 
            <h4 class="list-group-item-heading"><span class="fa fa-sitemap"></span> <fmt:message key="user_settings.link.tournaments"/></h4> 
            <p class="list-group-item-text"><fmt:message key="user_settings.info.tournaments"/></p>
        </a>
        
    </div>
</div>
            
            
            
            