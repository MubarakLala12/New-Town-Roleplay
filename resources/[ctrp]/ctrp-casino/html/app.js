var VirusCasino = {}
var mouseOver = false;
var selectedIdentity = null;
var selectedIdentityType = null;
var selectedJob = null;
var selectedJobId = null;

VirusCasino.Open = function(data) {
    $(".container").fadeIn(150);
}

VirusCasino.Close = function() {
    $(".container").fadeOut(150, function(){
        VirusCasino.ResetPages();
    });
    $.post('http://ctrp-casino/close');

    $(selectedJob).removeClass("job-selected");
    $(selectedIdentity).removeClass("job-selected");
}

VirusCasino.ResetPages = function() {
    $(".casino-option-blocks").show();
    $(".casino-identity-page").hide();
    $(".casino-job-page").hide();
}

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "open":
                VirusCasino.Open(event.data);
                break;
            case "close":
                VirusCasino.Close();
                break;
        }
    })
});

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
            VirusCasino.Close();
            break;
    }
});

$('.casino-option-block').click(function(e){
    e.preventDefault();

    var blockPage = $(this).data('page');

    $(".casino-option-blocks").fadeOut(100, function(){
        $(".casino-"+blockPage+"-page").fadeIn(100);
    });

    if (blockPage == "identity") {
        $(".identity-page-blocks").html("");
        $(".identity-page-blocks").html('<div class="identity-page-block" data-type="casinomembership" onmouseover="'+hoverDescription("casinomembership")+'" onmouseout="'+hoverDescription("casinomembership")+'"><p>Casino Membership</p></div>');
        $.post('http://ctrp-casino/requestLicenses', JSON.stringify({}), function(licenses){
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
        if (type == "casinomembership") {
            $(".hover-description").fadeIn(10);
            $(".hover-description").html('');
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
        if (idType== "casinomembership") {
            $(".request-identity-button").fadeIn(100);
            $(".request-identity-button").html("<p>BUY ($2000-)</p>")
        }
    } else if (selectedIdentity == this) {
        $(this).removeClass("identity-selected");
        selectedIdentity = null;
        $(".request-identity-button").fadeOut(100);
    } 
});

$(".request-identity-button").click(function(e){
    e.preventDefault();

    $.post('http://ctrp-casino/requestId', JSON.stringify({
        idType: selectedIdentityType
    }))

    VirusCasino.ResetPages();
});




$(document).on('click', '.back-to-main', function(e){
    e.preventDefault();

    $(selectedJob).removeClass("job-selected");
    $(selectedIdentity).removeClass("job-selected");

    VirusCasino.ResetPages();
});
