<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="/WEB-INF/tlds/custom_functions.tld" %>

<div id="googlemaps" class="collapse">
    <div class="row">
        <div class="col-md-12">
            <div style="width: 100%; height: 300px;" id="map-canvas" class="map-content"></div>      
<!--<iframe width="100%" height="400dpx" frameborder="0" scrollwheel="false" marginheight="0" marginwidth="0" src="http://maps.google.de/maps?hl=de&q=${tournament.venue}+(${tournament.venue})&ie=UTF8&t=&z=12&iwloc=B&output=embed"></iframe>-->
            <a href="#googlemaps" data-toggle="collapse"><i class="glyphicon glyphicon-collapse-up"></i>Einklappen</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-8 col-md-offset-2 text-center" style="margin-bottom: 20px;">
        <h1><i class="fa fa-sitemap"></i> <b>${tournament.name}</b></h1>
        <h2>${tournament.description}</h2>
    </div>
</div>

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <ul class="nav nav-pills nav-justified">
            <li class="active"><a href="#info" data-toggle="tab">Allgemein</a></li>
            <li><a href="#schedule" data-toggle="tab">Spielplan</a></li>
            <li><a href="#table" data-toggle="tab">Tabelle</a></li>
        </ul>
    </div>
</div>

<div id="myTabContent" class="tab-content">

    <div class="tab-pane fade in active" id="info">

        <div class="row">
            <div class="col-md-8 col-md-offset-2">

                <div class="panel panel-leago">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><i class="fa fa-info"></i> Quickinfo</div>

                    <!-- Table -->
                    <div class="table-responsive">                                               
                        <table class="table table-hover">
                            <tbody>  
                                <tr>  
                                    <td>Leader</td> 
                                    <td><i class="fa fa-star-o"></i><b><a href="${pageContext.request.contextPath}/user/${tournament.leader.name}"> ${tournament.leader.name} </a></b></td>                                        
                                </tr>  
                                <tr>  
                                    <td>Zeitraum</td> 
                                    <td>
                                        <c:choose>
                                            <c:when test="${tournament.start_date != null && tournament.end_date != null}">
                                                <b>${tournament.start_date_web}</b> bis <b>${tournament.end_date_web}</b>
                                            </c:when>
                                            <c:otherwise><b>Keine Angabe</b></c:otherwise>
                                        </c:choose>
                                    </td>                                        
                                </tr>  
                                <tr>  
                                    <td>Anmeldefrist</td> 
                                    <td>
                                        <c:choose>
                                            <c:when test="${tournament.deadline != null}"> 
                                                <b>${tournament.deadline_web}</b>, <b>${tournament.countdown}</b>
                                            </c:when>
                                            <c:otherwise><b>Keine Anmeldefrist</b></c:otherwise>
                                        </c:choose> 
                                    </td>                                        
                                </tr>  
                                <tr>  
                                    <td>Spieltage</td> 
                                    <td><b>${tournament.rounds}</b></td>                                        
                                </tr>  
                                <tr>  
                                    <td>Wetter</td> 
                                    <td><b><div id="weather"></div></b></td>                                        
                                </tr>  
                                <tr>  
                                    <td>Austragungsort</td> 
                                    <td> 
                                        <c:choose>
                                            <c:when test="${tournament.venue != null}">
                                                <div id="googlelink"><b><a href="#googlemaps" data-toggle="collapse">${tournament.venue}</a></b></div>
<!--                                                https://maps.google.com/maps?q=${tournament.venue}&hl=de&sll=28.149503,-71.71875&sspn=88.855059,173.144531&hnear=${tournament.venue}&t=m&z=10-->
                                            </c:when>
                                            <c:otherwise><b>Keine Angabe</b></c:otherwise>
                                        </c:choose> 
                                    </td>                                        
                                </tr> 
                                <c:choose>
                                    <c:when test="${tournament.leader.name == user.name}">  
                                        <tr>  
                                            <td>Adminbereich</td> 
                                            <td><b><a href="${pageContext.request.contextPath}/tournament/${tournament.name}/settings/profile"><i class="fa fa-pencil"></i> Turnier bearbeiten</a></b></td>                                        
                                        </tr>    
                                    </c:when>
                                </c:choose>
                            </tbody>  
                        </table>  
                    </div>
                </div><!-- /.panel -->  
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-md-8 col-md-offset-2 text-center" style="padding:0">
                <h2>Teilnehmende Teams</h2>
                <c:forEach var="team" items="${tournament.teams}" varStatus="idx">
                    <div class="col-md-6 text-center no-margin" style="margin: 0px;">
                        <a href="${pageContext.request.contextPath}/team/${team.name}">
                            <div class="long-caption"><i class="fa fa-users"></i> ${team.name}</div>
                        </a>
                    </div> 
                </c:forEach>   
                <c:if test="${empty tournament.teams}">
                    Es sind noch keine Teams angemeldet.
                </c:if>
            </div>
        </div>


    </div><!-- /.tab-pane -->



    <div class="tab-pane fade in" id="schedule">
        <c:choose>
            <c:when test="${tournament.schedule != null}">

                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="panel panel-leago">
                            <!-- Default panel contents -->
                            <div class="panel-heading"><i class="fa fa-gamepad"></i> Spielplan</div>

                            <!-- Table -->
                            <div class="tab-content">
                                <c:forEach items="${tournament.schedule.rounds}" var="round" varStatus="loop">
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
                                                        <c:choose>
                                                            <c:when test="${tournament.leader.name == user.name}">
                                                                <tr>
                                                                    <td class="text-right"><a href="${pageContext.request.contextPath}/team/${match.team1.name}" <c:if test="${fn:isUserInTeam(match.team1, user.teams)}"> style="font-weight: bold;"</c:if>>${match.team1.name}</a></td>
                                                                        <td class="text-center">
                                                                            <form id="match${match.id}" action="${pageContext.request.contextPath}/tournament/${tournament.name}/match/${match.id}" method="POST">
                                                                            <c:choose>
                                                                                <c:when test="${match.played != null}">
                                                                                    <a style="margin-right: 5px;" href="javascript:{}" onclick="toggleInputfield(${match.id});"><i id="lock${match.id}" class="fa fa-lock"></i><i id="unlock${match.id}" class="fa fa-unlock-alt hidden"></i></a> 
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                    <i style="margin-right: 5px; color: #68C999" id="lock${match.id}" class="fa fa-unlock-alt"></i>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <input <c:if test="${match.played != null}">disabled</c:if> type="number" min="0" value="${match.points1}" name="input_points1" required id="points1${match.id}"> : 
                                                                            <input <c:if test="${match.played != null}">disabled</c:if> type="number" min="0" value="${match.points2}" name="input_points2" required id="points2${match.id}">
                                                                            <a href="javascript:{}" class="btn <c:if test="${match.played != null}">disabled</c:if>" style="padding:0; margin-left: 5px" id="submit${match.id}" onclick="document.getElementById('match${match.id}').submit();
                                                                                    return false;"><i class="fa fa-arrow-circle-right"></i></a>
                                                                            </form>
                                                                        </td>
                                                                        <td><a href="${pageContext.request.contextPath}/team/${match.team2.name}" <c:if test="${fn:isUserInTeam(match.team2, user.teams)}"> style="font-weight: bold;"</c:if>>${match.team2.name}</a></td>
                                                                    </tr>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <tr>
                                                                    <td class="text-right"><a href="${pageContext.request.contextPath}/team/${match.team1.name}" <c:if test="${fn:isUserInTeam(match.team1, user.teams)}"> style="font-weight: bold;"</c:if>>${match.team1.name}</a></td>
                                                                    <td class="text-center">${match.points1} : ${match.points2}</td>
                                                                    <td><a href="${pageContext.request.contextPath}/team/${match.team2.name}" <c:if test="${fn:isUserInTeam(match.team2, user.teams)}"> style="font-weight: bold;"</c:if>>${match.team2.name}</a></td>
                                                                    </tr>
                                                            </c:otherwise>
                                                        </c:choose>
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
                            <c:forEach items="${tournament.schedule.rounds}" varStatus="loop">
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

                </c:when>
                <c:otherwise>
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2 text-center">
                            <h2>F&uuml;r dieses Turnier wurde noch kein Spielplan erstellt.</h2>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>



        <div class="tab-pane fade" id="table">
            <div class="row">  
                <div class="col-sm-10 col-md-offset-1">
                    <div class="panel panel-leago">
                        <!-- Default panel contents -->
                        <div class="panel-heading"><i class="fa fa-table"></i> Tabelle</div>

                        <!-- Table -->
                        <div class="table-responsive">                                               
                            <table class="table table-hover">  
                                <thead>  
                                    <tr>   
                                        <th><a href="#" data-toggle="tooltip" data-placement="top" title="Platz" class="label label-default">Platz</a></th> 
                                        <th><a href="#" data-toggle="tooltip" data-placement="top" title="Teamname" class="label label-default">Teamname</a></th> 
                                        <th><a href="#" data-toggle="tooltip" data-placement="top" title="Spiele" class="label label-default">Spiele</a></th> 
                                        <th><a href="#" data-toggle="tooltip" data-placement="top" title="Win-Rate in %" class="label label-primary">Win-Rate in %</a></th> 
                                        <th><a href="#" data-toggle="tooltip" data-placement="top" title="Siege" class="label label-success">Siege</a></th> 
                                        <th><a href="#" data-toggle="tooltip" data-placement="top" title="Niederlagen" class="label label-danger">Niederlagen</a></th> 
                                        <th><a href="#" data-toggle="tooltip" data-placement="top" title="Tore" class="label label-success">Tore</a></th> 
                                        <th><a href="#" data-toggle="tooltip" data-placement="top" title="Gegentore" class="label label-warning">Gegentore</a></th> 
                                        <th><a href="#" data-toggle="tooltip" data-placement="top" title="Tordifferenz" class="label label-default">Tordifferenz</a></th> 
                                    </tr>  
                                </thead>  
                                <tbody>  
                                    <c:forEach items="${tournament.table}" var="placement" varStatus="status">
                                        <tr>  
                                            <td># <c:out value="${status.count}" /></td> 
                                            <td><a href="${pageContext.request.contextPath}/team/${placement.team.name}" <c:if test="${fn:isUserInTeam(placement.team, user.teams)}"> style="font-weight: bold;"</c:if>>${placement.team.name}</a></td>  
                                            <td>${placement.amount_matches}</td>  
                                            <td>${placement.winrate}</td>  
                                            <td>${placement.wins}</td>  
                                            <td>${placement.defeats}</td>  
                                            <td>${placement.goals}</td> 
                                            <td>${placement.goals_conceded}</td> 
                                            <td>${placement.goal_difference}</td>                                         
                                        </tr>  
                                    </c:forEach>
                                </tbody>  
                            </table>  
                        </div>
                    </div><!-- /.panel -->  
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.tab-pane -->


    </div>

    <!-- JavaScript -->
    <script>

        function toggleInputfield(id) {
            $("#lock" + id).toggleClass("hidden");
            $("#unlock" + id).toggleClass("hidden");

            $("#points1" + id).prop("disabled", !$("#points1" + id).prop("disabled"));
            $("#points2" + id).prop("disabled", !$("#points2" + id).prop("disabled"));

            $("#submit" + id).toggleClass("disabled");
        }

    </script>

    <!-- Weather -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.simpleWeather/3.0.2/jquery.simpleWeather.min.js"></script>
    <script>
// Docs at http://simpleweatherjs.com
        $(document).ready(function() {
            $.simpleWeather({
                location: '${tournament.venue}',
                unit: 'c',
                success: function(weather) {
                    html = '<a target="_blank" href="' + weather.link + '">' + weather.temp + '&deg;' + weather.units.temp + '</a><img height="25" src="' + weather.thumbnail + '"></img>';

                    $("#weather").html(html);
                },
                error: function(error) {
                    $("#weather").html('<p>' + error + '</p>');
                }
            });
        });
    </script>

    <!-- Google maps -->
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script>
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        var map;
        var venue = '${tournament.venue}';
        var geocoder = new google.maps.Geocoder();

        function initialize() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            var mapOptions = {
                zoom: 12,
                draggable: false,
                panControl: true,
                zoomControl: true,
                scaleControl: true
            };

            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            directionsDisplay.setMap(map);


            // Try HTML5 geolocation
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var pos = new google.maps.LatLng(position.coords.latitude,
                            position.coords.longitude);

                    var infowindow = new google.maps.InfoWindow({
                        map: map,
                        position: pos,
                        content: 'Du bist hier.'
                    });

                    calcRoute(pos);

                }, function() {
                    handleNoGeolocation(true);

                });
            } else {
                // Browser doesn't support Geolocation
                handleNoGeolocation(false);
            }
        }

        // Handelt die Route vom aktuellen Standort zum Venue
        function calcRoute(pos) {
            var start = pos;
            var end = venue;
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.TravelMode.DRIVING
            };
            directionsService.route(request, function(response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });
        }

        // Errorhandling, setzt Karte automatisch auf Venue
        function handleNoGeolocation(errorFlag) {
            if (errorFlag) {
                var content = 'The Geolocation service failed.';
            } else {
                var content = 'Error: Your browser doesn\'t support geolocation.';
            }

            geocoder.geocode({'address': venue}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: map,
                        draggable: false,
                        position: results[0].geometry.location,
                        title: content + ' Venue: ' + venue,
                        animation: google.maps.Animation.DROP
                    });
                } else {
                    alert("Geocode was not successful for the following reason: " + status);
                }
            });
        }

        google.maps.event.addDomListener(window, 'load', initialize);


        //Script zum neuladen der google-map, da durch das collpase die map nicht richtig angezeigt wird --> Buggy
//        $(document).on("pageshow", "#googlemaps", function() {
//            alert("pageshow event fired");
//            var center = map.getCenter();
//            google.maps.event.trigger(map, "resize");
//            map.setCenter(center);
//        });
//
//// oder so:
//        $(document).ready(function() {
//
//            $('#googlelink').click(function(e) {
//                e.preventDefault();
//                //we have to set center for map after resize, but we need to know center BEFORE we resize it
//                var center = map.getCenter();
//                google.maps.event.trigger(map, "resize"); //this fix the problem with not completely map
//                map.setCenter(center);
//                alert('ja man');
//
//            });
//        });

    </script>
