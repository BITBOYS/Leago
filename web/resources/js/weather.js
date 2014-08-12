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
            $("#weather").html('Keine Angabe');
        }
    });
});