// ....................../´¯/) 
// ....................,/¯../ 
// .................../..../ 
// ............./´¯/'...'/´¯¯`·¸ 
// ........../'/.../..../......./¨¯\ 
// ........('(...´...´.... ¯~/'...') 
// .........\.................'...../ 
// ..........''...\.......... _.·´ 
// ............\..............( 
// ..............\.............\...
// VIRUSOP

{/* <span id="advertentie-nummer" class="advertentie-nummer">'+add.number+'</span> */}

// Functions
RS.Phone.Functions.LoadAdverts = (adverts) => {
    $(".advertentie-lijst").html("");

    if (adverts.length < 0) 
        return
        

    $.each(adverts, function(i, add){
        console.log(add.number);
        
        var addvertHtml = '<div class="advertentie"><span class="advertentie-owner">'+add.name+'</span><input type="text" class="advertentie-nummer1" id="advertentie-nummer" value="'+add.number+'" readonly spellcheck="false"><p class="advertentie-bericht">'+add.message+'</p></div>';
        $(".advertentie-lijst").append(addvertHtml);
    });
}


// On Click check
// Goto new advert
$(document).on('click', '.advertentie-add-btn', (e) => {
    e.preventDefault();

    $('.advertenties').animate({
        top: 62+"vh"
    });
    $(".nieuw-advertentie").animate({
        top: 0+"vh"
    });

});

// Go back to adverts
$(document).on('click', '.nieuw-advertentie-back-btn', (e) => {
    e.preventDefault();

    $(".advertenties").animate({
        top: 0+"vh"
    });
    $(".nieuw-advertentie").animate({
        top: -62+"vh"
    });
});

// Copy number if clicking on add
$(document).on('click', '.advertentie', function(e) {
    var copyText = document.getElementById("advertentie-nummer");
    copyText.select();
    copyText.setSelectionRange(0, 99999);
    document.execCommand("copy");

    RS.Phone.Notifications.Add("fas fa-ad", "Advertisement", "Phone no. Copied!", "#fff", 1750);

});

// Submit advert
$(document).on('click', '.nieuw-advertentie-btn', function(e){
    e.preventDefault();

    var advertentieBericht = $("#nieuw-advertentie-bericht").val();

    if (advertentieBericht == "") {
        RS.Phone.Notifications.Add("fas fa-ad", "Advertisement", "You cannot place an empty AD!", "#FFF", 2000);
        return
    }

    $(".advertenties").animate({
        top: 0+"vh"
    });
    $(".nieuw-advertentie").animate({
        top: -62+"vh"
    });
    $.post('https://ctrp-phone_new/PostAdvert', JSON.stringify({
        message: advertentieBericht,
    }));

    $("#nieuw-advertentie-bericht").val('');
});

