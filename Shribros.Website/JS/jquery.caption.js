//Adds caption to a div
$.fn.AddCaption = function (captionDivId) {
    //Variables
    var captionTextRightPadding = 10;
    var captionTextTopPadding = 5;
    var captionTextAlign = "right";
    var captionBackgroundColor = "#000000";
    var captionTextColor = "#ffffff";
    var captionOpacity = 0.5;
    var captionDivIdFormatted = '#' + captionDivId;

    //Computed Values
    var leftSpacing = $(this).padding().left + $(this).border().left + $(this).margin().left;
    var topSpacing = $(this).padding().top + $(this).border().top + $(this).margin().top;

    //Set CSS styles on caption DIV
    $(captionDivIdFormatted).css("width", $(this).width() - captionTextRightPadding);
    $(captionDivIdFormatted).css("background-color", captionBackgroundColor);
    $(captionDivIdFormatted).css("text-align", captionTextAlign);
    $(captionDivIdFormatted).css("padding-right", captionTextRightPadding + "px");
    $(captionDivIdFormatted).css("padding-top", captionTextTopPadding + "px");
    $(captionDivIdFormatted).css("color", captionTextColor);
    $(captionDivIdFormatted).css("opacity", captionOpacity);
    $(captionDivIdFormatted).css("position", "absolute");
    $(captionDivIdFormatted).css("left", $(this).position().left + leftSpacing);
    $(captionDivIdFormatted).css("top", $(this).position().top + topSpacing);

    //Assign functions
    $(this).mouseenter(function () { $(captionDivIdFormatted).fadeIn(); });
    $(this).mouseleave(function () { $(captionDivIdFormatted).fadeOut(); });
    $(captionDivIdFormatted).hide();
};