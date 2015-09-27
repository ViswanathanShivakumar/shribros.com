$.fn.resizeBackground = function (imageWidth, imageHeight) {
    var imageAspectRatio = imageWidth / imageHeight;
    var newimageWidth;
    var newimageHeight;
    if ($(window).width() > $(window).height()) {
        newimageWidth = $(window).width();
        newimageHeight = newimageWidth / imageAspectRatio;
        while (newimageHeight <= $(window).height()) {
            newimageWidth += 10;
            newimageHeight = newimageWidth / imageAspectRatio;
        }
        this.css("background-size", newimageWidth + "px " + newimageHeight + "px");
    } else {
        newimageHeight = $(window).height();
        newimageWidth = newimageHeight * imageAspectRatio;;
        while (newimageWidth <= $(window).width()) {
            newimageHeight += 10;
            newimageWidth = newimageHeight * imageAspectRatio;;
        }
        this.css("background-size", newimageWidth + "px " + newimageHeight + "px");
    }
};
 
$.fn.scalableBackground = function (backgroundImageUrl, imageWidth, imageHeight) {
    this.css("background-image", 'url(' + backgroundImageUrl + ')');
    this.css("background-repeat", "no-repeat");
    this.css("background-attachment", "fixed");
    this.resizeBackground(imageWidth, imageHeight);
    var scopeObject = this;
    $(window).resize(function () {
        scopeObject.resizeBackground(imageWidth, imageHeight);
    });
};