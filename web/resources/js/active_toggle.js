function changeClass(id) {
    if(id === 'link_user') {
        $('#link_user').addClass('active');
        $('#link_teams').removeClass('active');
        $('#link_tournaments').removeClass('active');
    }

    if(id === 'link_teams') {
        $('#link_user').removeClass('active');
        $('#link_teams').addClass('active');
        $('#link_tournaments').removeClass('active');
    }

    if(id === 'link_tournaments') {
        $('#link_user').removeClass('active');
        $('#link_teams').removeClass('active');
        $('#link_tournaments').addClass('active');
    }
}