jQuery.expr[':'].contains = function (a, i, m) { return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0; };

//Function to search through a list and dispaly the ones having matching content
//H2 tags are hidden and displayed to adapt to search in reviews page
$.fn.SearchContent = function (searchTextBoxid) {
    var hostId = $(this);
    $(searchTextBoxid).bind('keyup', function () {
        if ($(searchTextBoxid).val() == "") {
            hostId.find('li').css("display", "block");
            hostId.find('h2').css("display", "block");
        }
        else {
            hostId.find('h2').css("display", "none");
            hostId.find('li').css("display", "none");
            hostId.find("li:contains('" + $(searchTextBoxid).val() + "')").css("display", "block");
        }
    });
}