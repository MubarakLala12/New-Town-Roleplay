var ctrpCityhall = {}
var mouseOver = false;
var selectedIdentity = null;
var selectedIdentityType = null;
var selectedJob = null;
var selectedJobId = null;

ctrpCityhall.Open = function(data) {
    $(".container").fadeIn(150);
}

ctrpCityhall.Close = function() {
    $(".container").fadeOut(150, function(){
        ctrpCityhall.ResetPages();
    });
    $.post('http://ctrp-cityhall/close');

    $(selectedJob).removeClass("job-selected");
    $(selectedIdentity).removeClass("job-selected");
}

ctrpCityhall.ResetPages = function() {
    $(".cityhall-option-blocks").show();
    $(".cityhall-identity-page").hide();
    $("#cityhall-job-info").hide();
    $(".cityhall-job-page").hide();
}

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "open":
                ctrpCityhall.Open(event.data);
                break;
            case "close":
                ctrpCityhall.Close();
                break;
        }
    })
});

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
            ctrpCityhall.Close();
            break;
    }
});

$('.cityhall-option-block').click(function(e){
    e.preventDefault();

    var blockPage = $(this).data('page');

    $(".cityhall-option-blocks").fadeOut(100, function(){
        $(".cityhall-"+blockPage+"-page").fadeIn(100);
    });

    if (blockPage == "identity") {
        $(".identity-page-blocks").html("");
        $(".identity-page-blocks").html('<div class="identity-page-block" data-type="id-kaart" onmouseover="'+hoverDescription("id-kaart")+'" onmouseout="'+hoverDescription("id-kaart")+'"><p>ID Card</p></div>');
        $.post('http://ctrp-cityhall/requestLicenses', JSON.stringify({}), function(licenses){
            $.each(licenses, function(i, license){
                console.log(license.licenseType)
                var elem = '<div class="identity-page-block" data-type="'+license.idType+'" onmouseover="hoverDescription("'+license.idType+'")" onmouseout="hoverDescription("'+license.idType+'")"><p>'+license.label+'</p></div>';
                $(".identity-page-blocks").append(elem);
            });
        });
    }
});

hoverDescription = function(type) {
    if (!mouseOver) {
        if (type == "id-kaart") {
            $(".hover-description").fadeIn(10);
            $(".hover-description").html('<p>You are required to carry an ID card on you. <br>This is so that you can identify yourself at any time.</p>');
        } else if (type == "rijbewijs") {
            $(".hover-description").fadeIn(10);
            $(".hover-description").html('<p>If you drive a vehicle, you are required to have a drivers license<br> to be able to show when requested.</p>');
        }
    } else {
        if(selectedIdentity == null) {
            $(".hover-description").fadeOut(10);
            $(".hover-description").html('');
        }
    }

    mouseOver = !mouseOver;
}

$(document).on("click", ".identity-page-block", function(e){
    e.preventDefault();

    var idType = $(this).data('type');

    selectedIdentityType = idType;

    if (selectedIdentity == null) {
        $(this).addClass("identity-selected");
        $(".hover-description").fadeIn(10);
        selectedIdentity = this;
        if (idType== "id-kaart") {
            $(".request-identity-button").fadeIn(100);
            $(".request-identity-button").html("<p>Request ID card ($50-)</p>")
        } else {
            $(".request-identity-button").fadeIn(100);
            $(".request-identity-button").html("<p>Apply for a driver's license ($50-)</p>")
        }
    } else if (selectedIdentity == this) {
        $(this).removeClass("identity-selected");
        selectedIdentity = null;
        $(".request-identity-button").fadeOut(100);
    } else {
        $(selectedIdentity).removeClass("identity-selected");
        $(this).addClass("identity-selected");
        selectedIdentity = this;
        if($(this).data('type') == "id-kaart") {
            $(".request-identity-button").html("<p>Request ID card ($50-)</p>")
        } else {
            $(".request-identity-button").html("<p>Apply for a driver's license ($50-)</p>")
        }
    }
});

$(".request-identity-button").click(function(e){
    e.preventDefault();

    $.post('http://ctrp-cityhall/requestId', JSON.stringify({
        idType: selectedIdentityType
    }))

    ctrpCityhall.ResetPages();
});

$(document).on("click", ".job-page-block", function(e){
    e.preventDefault();

    var job = $(this).data('job');

    selectedJobId = job;

    if (selectedJob == null) {
        $(this).addClass("job-selected");
        selectedJob = this;
        $(".apply-job-button").fadeIn(100);
    } else if (selectedJob == this) {
        $(this).removeClass("job-selected");
        selectedJob = null;
        $(".apply-job-button").fadeOut(100);
    } else {
        $(selectedJob).removeClass("job-selected");
        $(this).addClass("job-selected");
        selectedJob = this;
    }
});

$(document).on('click', '.apply-job-button', function(e){
    e.preventDefault();

    $.post('http://ctrp-cityhall/applyJob', JSON.stringify({
        job: selectedJobId
    }))
    ctrpCityhall.Close();
    ctrpCityhall.ResetPages();
});

$(document).on('click', '.back-to-main', function(e){
    e.preventDefault();

    $(selectedJob).removeClass("job-selected");
    $(selectedIdentity).removeClass("job-selected");

    ctrpCityhall.ResetPages();
});
