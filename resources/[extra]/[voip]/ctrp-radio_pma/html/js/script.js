$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "open") {
            CTRPRadio.SlideUp()
        }

        if (event.data.type == "close") {
            CTRPRadio.SlideDown()
        }
    });

    document.onkeyup = function (data) {
        if (data.which == 27) { // Escape key
            $.post('https://ctrp-radio/escape', JSON.stringify({}));
            CTRPRadio.SlideDown()
        } else if (data.which == 13) { // Enter key
            $.post('https://ctrp-radio/joinRadio', JSON.stringify({
                channel: $("#channel").val()
            }));
        }
    };
});

CTRPRadio = {}

$(document).on('click', '#submit', function(e){
    e.preventDefault();

    $.post('https://ctrp-radio/joinRadio', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#disconnect', function(e){
    e.preventDefault();

    $.post('https://ctrp-radio/leaveRadio');
});

CTRPRadio.SlideUp = function() {
    $(".container").css("display", "block");
    $(".radio-container").animate({bottom: "6vh",}, 250);
}

CTRPRadio.SlideDown = function() {
    $(".radio-container").animate({bottom: "-110vh",}, 400, function(){
        $(".container").css("display", "none");
    });
}