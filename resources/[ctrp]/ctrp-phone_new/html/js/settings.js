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

RS.Phone.Settings = {};
RS.Phone.Settings.Background = "default-rs";
RS.Phone.Settings.OpenedTab = null;
RS.Phone.Settings.Backgrounds = {
    'default-rs': {
        label: "Standaard"
    },
    'default-rs1': {
        label: "Standaard 1"
    }
};

var PressedBackground = null;
var PressedBackgroundObject = null;
var OldBackground = null;
var IsChecked = null;

$(document).on('click', '.settings-app-tab', function(e){
    e.preventDefault();
    var PressedTab = $(this).data("settingstab");

    if (PressedTab == "background") {
        RS.Phone.Animations.TopSlideDown(".settings-"+PressedTab+"-tab", 200, 0);
        RS.Phone.Settings.OpenedTab = PressedTab;
    } else if (PressedTab == "profilepicture") {
        RS.Phone.Animations.TopSlideDown(".settings-"+PressedTab+"-tab", 200, 0);
        RS.Phone.Settings.OpenedTab = PressedTab;
    } else if (PressedTab == "numberrecognition") {
        var checkBoxes = $(".numberrec-box");
        RS.Phone.Data.AnonymousCall = !checkBoxes.prop("checked");
        checkBoxes.prop("checked", RS.Phone.Data.AnonymousCall);

        if (!RS.Phone.Data.AnonymousCall) {
            $("#numberrecognition > p").html('Off');
        } else {
            $("#numberrecognition > p").html('On');
        }
    }
});


$(document).on('click', '#accept-background', function(e){
    e.preventDefault();
    var hasCustomBackground = RS.Phone.Functions.IsBackgroundCustom();

    if (hasCustomBackground === false) {
        RS.Phone.Notifications.Add("fas fa-paint-brush", "Settings", RS.Phone.Settings.Backgrounds[RS.Phone.Settings.Background].label+" is set!")
        RS.Phone.Animations.TopSlideUp(".settings-"+RS.Phone.Settings.OpenedTab+"-tab", 200, -100);
        $(".phone-background").css({"background-image":"url('/html/img/backgrounds/"+RS.Phone.Settings.Background+".jpg')"})
        $(".phone-ghuu").css({"background-image":"url('/html/img/backgrounds/"+RS.Phone.Settings.Background+".jpg')"})
        
    } else {
        RS.Phone.Notifications.Add("fas fa-paint-brush", "Settings", "Own background set!")
        RS.Phone.Animations.TopSlideUp(".settings-"+RS.Phone.Settings.OpenedTab+"-tab", 200, -100);
        $(".phone-background").css({"background-image":"url('"+RS.Phone.Settings.Background+"')"});
        $(".phone-ghuu").css({"background-image":"url('"+RS.Phone.Settings.Background+"')"});
    }

    $.post('https://ctrp-phone_new/SetBackground', JSON.stringify({
        background: RS.Phone.Settings.Background,
    }))
});

RS.Phone.Functions.LoadMetaData = function(MetaData) {
    if (MetaData.background !== null && MetaData.background !== undefined) {
        RS.Phone.Settings.Background = MetaData.background;
    } else {
        RS.Phone.Settings.Background = "default-rs";
    }

    var hasCustomBackground = RS.Phone.Functions.IsBackgroundCustom();

    if (!hasCustomBackground) {
        $(".phone-background").css({"background-image":"url('/html/img/backgrounds/"+RS.Phone.Settings.Background+".jpg')"})
    } else {
        $(".phone-background").css({"background-image":"url('"+RS.Phone.Settings.Background+"')"});
    }

    if (MetaData.profilepicture == "default") {
        $("[data-settingstab='profilepicture']").find('.settings-tab-icon').html('<img src="./img/default.png">');
    } else {
        $("[data-settingstab='profilepicture']").find('.settings-tab-icon').html('<img src="'+MetaData.profilepicture+'">');
    }
}

$(document).on('click', '#cancel-background', function(e){
    e.preventDefault();
    RS.Phone.Animations.TopSlideUp(".settings-"+RS.Phone.Settings.OpenedTab+"-tab", 200, -100);
});

RS.Phone.Functions.IsBackgroundCustom = function() {
    var retval = true;
    $.each(RS.Phone.Settings.Backgrounds, function(i, background){
        if (RS.Phone.Settings.Background == i) {
            retval = false;
        }
    });
    return retval
}

$(document).on('click', '.background-option', function(e){
    e.preventDefault();
    PressedBackground = $(this).data('background');
    PressedBackgroundObject = this;
    OldBackground = $(this).parent().find('.background-option-current');
    IsChecked = $(this).find('.background-option-current');

    if (IsChecked.length === 0) {
        if (PressedBackground != "custom-background") {
            RS.Phone.Settings.Background = PressedBackground;
            $(OldBackground).fadeOut(50, function(){
                $(OldBackground).remove();
            });
            $(PressedBackgroundObject).append('<div class="background-option-current"><i class="fas fa-check-circle"></i></div>');
        } else {
            RS.Phone.Animations.TopSlideDown(".background-custom", 200, 13);
        }
    }
});

$(document).on('click', '#accept-custom-background', function(e){
    e.preventDefault();

    RS.Phone.Settings.Background = $(".custom-background-input").val();
    $(OldBackground).fadeOut(50, function(){
        $(OldBackground).remove();
    });
    $(PressedBackgroundObject).append('<div class="background-option-current"><i class="fas fa-check-circle"></i></div>');
    RS.Phone.Animations.TopSlideUp(".background-custom", 200, -23);
});

$(document).on('click', '#cancel-custom-background', function(e){
    e.preventDefault();

    RS.Phone.Animations.TopSlideUp(".background-custom", 200, -23);
});

var PressedProfilePicture = null;
var PressedProfilePictureObject = null;
var OldProfilePicture = null;
var ProfilePictureIsChecked = null;

$(document).on('click', '#accept-profilepicture', function(e){
    e.preventDefault();
    var ProfilePicture = RS.Phone.Data.MetaData.profilepicture;
    if (ProfilePicture === "default") {
        RS.Phone.Notifications.Add("fas fa-paint-brush", "Settings", "Default profile picture is set!")
        RS.Phone.Animations.TopSlideUp(".settings-"+RS.Phone.Settings.OpenedTab+"-tab", 200, -100);
        $("[data-settingstab='profilepicture']").find('.settings-tab-icon').html('<img src="./img/default.png">');
    } else {
        RS.Phone.Notifications.Add("fas fa-paint-brush", "Settings", "Own profile picture set!")
        RS.Phone.Animations.TopSlideUp(".settings-"+RS.Phone.Settings.OpenedTab+"-tab", 200, -100);
        //console.log(ProfilePicture)
        $("[data-settingstab='profilepicture']").find('.settings-tab-icon').html('<img src="'+ProfilePicture+'">');
    }
    $.post('https://ctrp-phone_new/UpdateProfilePicture', JSON.stringify({
        profilepicture: ProfilePicture,
    }));
});

$(document).on('click', '#accept-custom-profilepicture', function(e){
    e.preventDefault();
    RS.Phone.Data.MetaData.profilepicture = $(".custom-profilepicture-input").val();
    $(OldProfilePicture).fadeOut(50, function(){
        $(OldProfilePicture).remove();
    });
    $(PressedProfilePictureObject).append('<div class="profilepicture-option-current"><i class="fas fa-check-circle"></i></div>');
    RS.Phone.Animations.TopSlideUp(".profilepicture-custom", 200, -23);
});

$(document).on('click', '.profilepicture-option', function(e){
    e.preventDefault();
    PressedProfilePicture = $(this).data('profilepicture');
    PressedProfilePictureObject = this;
    OldProfilePicture = $(this).parent().find('.profilepicture-option-current');
    ProfilePictureIsChecked = $(this).find('.profilepicture-option-current');
    if (ProfilePictureIsChecked.length === 0) {
        if (PressedProfilePicture != "custom-profilepicture") {
            RS.Phone.Data.MetaData.profilepicture = PressedProfilePicture
            $(OldProfilePicture).fadeOut(50, function(){
                $(OldProfilePicture).remove();
            });
            $(PressedProfilePictureObject).append('<div class="profilepicture-option-current"><i class="fas fa-check-circle"></i></div>');
        } else {
            RS.Phone.Animations.TopSlideDown(".profilepicture-custom", 200, 13);
        }
    }
});

$(document).on('click', '#cancel-profilepicture', function(e){
    e.preventDefault();
    RS.Phone.Animations.TopSlideUp(".settings-"+RS.Phone.Settings.OpenedTab+"-tab", 200, -100);
});


$(document).on('click', '#cancel-custom-profilepicture', function(e){
    e.preventDefault();
    RS.Phone.Animations.TopSlideUp(".profilepicture-custom", 200, -23);
});