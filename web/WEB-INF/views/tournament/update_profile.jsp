<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <%@include file="link_list.jsp" %>
                
    <c:if test="${tournament.schedule == null}">
        <div class="col-md-8">
            <div class=" alert alert-info">
            Dieses Turnier hat noch keinen Spielplan. Wenn du einen generieren m&ouml;chtest, klicke <a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/schedule">hier</a>
            </div>
        </div>
    </c:if>
    

    <div class="col-md-8">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-sitemap"></i> Name &auml;ndern</div>
            <div class="panel-body">
                
                <div class="col-xs-8">
                    <form role="form" name="name_form" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/profile" method="POST">

                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="input_name_new1" placeholder="${tournament.name}" value="${value_name1}" required>
                        </div>

                        <div class="form-group">
                            <label>Name wiederholen</label>
                            <input type="text" class="form-control" name="input_name_new2" placeholder="${tournament.name}" value="${value_name2}" required>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Name aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body -->
        </div> <!-- /.panel -->
    </div> <!-- /.col -->


    <div class="col-md-8 col-md-offset-4">

        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-code"></i> Beschreibung &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="description_form" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/profile" method="POST">

                        <div class="form-group">
                            <label>Beschreibung</label>
                            <textarea style="max-width: 150%; resize: vertical"  rows="10" class="form-control" name="input_description_new" placeholder="${tournament.description}" value="${value_description}" maxlength="255" required></textarea>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Beschreibung aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.grid 8 --> 


    <div class="col-md-8 col-md-offset-4">

        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-globe"></i> Austragungsort &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="venue_form" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/profile" method="POST">

                        <div class="form-group">
                            <label>Ort</label>
                            <input type="text" class="form-control" name="input_venue_new" placeholder="${tournament.venue}" value="${value_venue}" required>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Austragunsort aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.col --> 


    <div class="col-md-8 col-md-offset-4">

        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-tags"></i> Spieltage &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="rounds_form" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/profile" method="POST">

                        <div class="form-group">
                            <label>Spielrunden</label>
                            <input type="number" min="1" class="form-control" name="input_rounds_new" placeholder="${tournament.rounds} Runden" value="${value_rounds}" required>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Spieltage aktualisieren</button>
                        </div>

                    </form>
                </div>
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.col --> 


    <div class="col-md-8 col-md-offset-4">

        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><i class="fa fa-clock-o"></i> Zeiten &auml;ndern</div>
            <div class="panel-body">
                <div class="col-xs-8">
                    <form role="form" name="start_date_form" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/profile" method="POST">
                        <div class="form-group">
                            <label>Startdatum <small class="text-muted">(aktuell: '${tournament.start_date_web}')</small></label>
                            <input type="datetime-local" class="form-control" name="input_startdate_new" value="${value_start_date}" required>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Startdatum aktualisieren</button>
                        </div>
                    </form>

                    <form role="form" name="end_date_form" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/profile" method="POST">
                        <div class="form-group">
                            <label>Enddatum <small class="text-muted">(aktuell: '${tournament.end_date_web}')</small></label>
                            <input type="datetime-local" class="form-control" name="input_enddate_new" value="${value_end_date}" required>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Enddatum aktualisieren</button>
                        </div>
                    </form>

                    <form role="form" name="deadline_form" action="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/profile" method="POST">
                        <div class="form-group">
                            <label>Deadline <small class="text-muted">(aktuell: '${tournament.deadline_web}')</small></label>
                            <input type="datetime-local" class="form-control" name="input_deadline_new" value="${value_deadline}" required>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-leago" type="submit">Deadline aktualisieren</button>
                        </div>
                    </form>

                </div> <!-- /.col --> 
            </div> <!-- /.panel-body --> 
        </div> <!-- /.panel -->  
    </div> <!-- /.col --> 

</div><!-- /.row -->
