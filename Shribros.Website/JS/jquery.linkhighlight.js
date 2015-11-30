function HighlightSelectedCategory() {
    $("a").each(function (idx) {
        if ($(this).attr('href') == document.location.pathname.match(/[^\/]+$/)[0]) {
            $(this).parent().css('background-color', 'rgba(18,18,18,0.8)');
        }
    });
}