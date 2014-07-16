<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">User-Profil <small>Alles &uuml;ber ${profileuser.name}</small></h1>
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li class="active">Profil</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <ul id="myTab" class="nav nav-tabs">
            <li><a href="#team" data-toggle="tab">Teams</a></li>
            <c:if test="${user.name == profileuser.name}">
                <li><a href="#account" data-toggle="tab">Accounteinstellungen</a></li>
            </c:if>
        </ul>
        <div id="myTabContent" class="tab-content">

            <div class="tab-pane fade in active" id="team">
                <i class="fa fa-beer pull-left fa-4x"></i>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus tristique, non posuere neque iaculis. Fusce aliquet dui ut felis rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
                <div class="row">  

                    <div class="col-lg-12">
                        <h2 class="page-header">${profileuser.name}s Teams</h2>
                    </div>

                    <!-- Schleife zum Anzeigen aller Teams in denen man sich befindet -->
                    <c:forEach var="col" begin="0" end="2">
                        <div class="col-lg-4 col-md-4 hero-feature">
                            <div class="thumbnail">
                                <div class="caption">
                                <h3>Testteam <small> Leader: 
                                <a href="#">Maiko</a></small></h3>
                                </div>
                                <div class="caption">
                                    <div class="panel panel-default">
                                        <!-- Default panel contents -->
                                        <div class="panel-heading">Stats</div>

                                        <!-- Table -->
                                        <div class="table-responsive">                                               
                                            <table class="table table-hover">   
                                                <thead>  
                                                    <tr>  
                                                        <th class="tooltip-social"><a href="#" data-toggle="tooltip" data-placement="top" title="Turniersiege" class="label label-success">TS</a></th>  
                                                        <th><span title="Gesamtsiege" class="label label-success">GS</span></th>  
                                                        <th><span title="Niederlagen" class="label label-danger">N</span></th>  
                                                        <th><span title="Tore" class="label label-success">T</span></th>  
                                                        <th><span title="Gegentore" class="label label-danger">GT</span></th>  
                                                        <th><span title="Tordifferenz" class="label label-primary">TD</span></th> 
                                                    </tr>  
                                                </thead>  
                                                <tbody>  
                                                    <tr>  
                                                        <td>10</td>  
                                                        <td>25</td>  
                                                        <td>6</td>  
                                                        <td>200</td>  
                                                        <td>100</td>  
                                                        <td>100</td> 
                                                    </tr>  
                                                </tbody>  
                                            </table> 
                                        </div>
                                    </div>  
                                    <p>
                                        <a href="#" class="btn btn-primary">Zum Teamprofil <i class="fa fa-angle-right"></i></a>
                                        <a onclick="" class="btn btn-danger">Team verlassen <i class="fa fa-angle-right"></i></a>
                                    </p>
                                </div>
                            </div>
                            <br>
                        </div>
                    </c:forEach>

                </div><!-- /.row -->
            </div>

            <div class="tab-pane fade" id="account">
                <i class="fa fa-gear pull-left fa-4x"></i>

                <div class="row">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat diam quis nisl vestibulum dignissim. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam placerat nunc ut tellus tristique, non posuere neque iaculis. Fusce aliquet dui ut felis rhoncus, vitae molestie mauris auctor. Donec pellentesque feugiat leo a adipiscing. Pellentesque quis tristique eros, sed rutrum mauris.</p>
                    <div class="col-lg-12">
                        <h2 class="page-header">E-Mail &auml;ndern</h2>
                        <form class="form-horizontal" role="form" name="form_email" action="#" method="POST">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">E-Mail</label>
                                <div class="col-sm-6">
                                    <input type="email" class="form-control" name="input_email_old" placeholder="alte E-Mail" required>
                                    <input type="email" class="form-control" name="input_email_new1" placeholder="neue E-Mail" required>
                                    <input type="email" class="form-control" name="input_email_new2" placeholder="neue E-Mail" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>     
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Name &auml;ndern</h2>
                        <form class="form-horizontal" role="form" name="form_name" action="#" method="POST">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" name="input_name_old" placeholder="alter Name">
                                </div>
                                <div class="col-sm-6 col-md-offset-2">
                                    <input type="text" class="form-control" name="input_name_new1" placeholder="neuer Name">
                                    <input type="text" class="form-control" name="input_name_new2" placeholder="neuer Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>     
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Passwort &auml;ndern</h2>
                        <form class="form-horizontal" role="form" name="form_pasword" action="#" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Passwort</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" name="input_password_old" placeholder="altes Passwort">
                                </div>
                                <div class="col-sm-6 col-md-offset-2">
                                    <input type="password" class="form-control" name="input_password_new1" placeholder="neues Passwort">
                                    <input type="password" class="form-control" name="input_password_new2" placeholder="neues Passwort">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button class="btn btn-primary btn-default" type="submit">
                                        &Auml;ndern <i class="fa fa-angle-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>