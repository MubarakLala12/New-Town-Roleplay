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

var ActiveTwitterTab = "twitter-tweets";
var HashtagOpen = false;
var MinimumTrending = 50;

$(document).on('click', '.twitter-footer-btn', function(e) {
    e.preventDefault();
    // $(this).data('tweettab');
    var tabdata = this;
    var PressedTab = $(tabdata).data("tweettab");
    var PreviousTab = $('.twitter-footer').find('[data-tweettab="'+ ActiveTwitterTab +'"]');

    if (ActiveTwitterTab != PressedTab) {

        switch (PressedTab) {
            case "twitter-tweets":
                $(tabdata).addClass('twitter-footer-btn-selected');
                $(PreviousTab).removeClass('twitter-footer-btn-selected');
        
                $("."+PressedTab+"").css({"display":"block"});
                $("."+ActiveTwitterTab+"").css({"display":"none"});
                $(".new-tweet-btn").css({"display":"block"}); // hide new tweet icon

                ActiveTwitterTab = PressedTab

                $.post('https://ctrp-phone_new/GetTweets', JSON.stringify({}), function(Tweets){
                    RS.Phone.Functions.LoadTweets(Tweets);
                });
                break;
            case "twitter-mentioned":
                $(tabdata).addClass('twitter-footer-btn-selected');
                $(PreviousTab).removeClass('twitter-footer-btn-selected');
        
                $("."+PressedTab+"").css({"display":"block"});
                $("."+ActiveTwitterTab+"").css({"display":"none"});
                $(".new-tweet-btn").css({"display":"none"}); // hide new tweet icon

                ActiveTwitterTab = PressedTab

                $.post('https://ctrp-phone_new/GetMentionedTweets', JSON.stringify({}), function(MentionedTweets){
                    RS.Phone.Functions.LoadMentionedTweets(MentionedTweets)
                });
                break;
            case "twitter-trending":

                $(this).addClass('twitter-footer-btn-selected');
                $(PreviousTab).removeClass('twitter-footer-btn-selected');
        
                $("."+PressedTab+"").css({"display":"block"});
                $("."+ActiveTwitterTab+"").css({"display":"none"});
                $(".new-tweet-btn").css({"display":"none"}); // hide new tweet icon

                ActiveTwitterTab = PressedTab

                if (HashtagOpen) {
                    e.preventDefault();
        
                    $(".twitter-hashtag-tweets").css({"left": "30vh"});
                    $(".twitter-hashtags").css({"left": "0vh"});
                    $(".twitter-new-tweet").css({"display":"block"});
                    $(".twitter-hashtags").css({"display":"block"});
                    HashtagOpen = false;
                }

                $.post('https://ctrp-phone_new/GetHashtags', JSON.stringify({}), function(Hashtags){
                    RS.Phone.Functions.LoadHashtags(Hashtags)
                });
                break;
            default:
                break;
        }
    }
});


let clicked = false;
let photos = [];
$(document).on('click', '.image', function (e) {
    if (!clicked) {
        let n = $(this).clone()

        $(n).appendTo('.tt')
        $(n).css({
            "position": "absolute",
            "width": "500px",
            "height": "auto",
            "left": "-520px",
            "top": "-10px",

            "border-radius": "1rem"
        })
        clicked = true;
        photos.push(n)
    } else {
        for (let i = 0; i < photos.length; i++) {
            photos[i].remove()
        }
        clicked = false;
    }
});


// Functions
// Load all tweets
RS.Phone.Functions.LoadTweets = (tweets) => {
    tweets = tweets.reverse(); // Draai de tweets om zodat nieuwe boven aan geplaatst worden...
    $('.twitter-tweets').html(""); // Empty div

    $.each(tweets, function(i, tweet){
        var TwitterMessage = RS.Phone.Functions.FormatTwitterMessage(tweet.message);
        var Tweet_time = RS.Phone.Functions.FormatTweetTime(tweet.time);
        var Tweet_url = RS.Phone.Functions.FormatTwitterMessage(tweet.url);

        var TwitterUsername = tweet.firstName + ' ' + tweet.lastName;
        var TwitterName = tweet.firstName+' '+tweet.lastName;
        var TwitterAvatar = "./img/default.png";
        
        if (tweet.picture !== "default") {
            TwitterAvatar = tweet.picture;
        }
        
        var TweetElement = '<div class="twitter-tweet" data-twthandler="@'+TwitterUsername.replace(" ", "_")+'">'+
        '<div class="twitter-avatar" >'+
             '<img src="'+TwitterAvatar+'" class="twitter-avatar-img">'+
           '</div>'+
           '<div class="twitter-creator">'+TwitterName+''+
               '<span class="twitter-tag">@'+TwitterUsername.replace(" ", "_")+' &middot; '+Tweet_time+'</span>'+
           '</div>'+
           '<div class="twitter-message">'+TwitterMessage+'</div>'+
           '<img class="twt-img" src= "' + Tweet_url + '" style = " border-radius:2px; width: 70%; position:relative; z-index: 1; left:52px; margin:.6rem .5rem .6rem 1rem;height: auto;">' +
           '<div class="tweet-reply"><i class="fas fa-reply"></i></div>'+
           //'<div class="stage"><div class="heart"></div></div>'+//
       '</div>';


        $(".twitter-tweets").append(TweetElement);
    });
}




RS.Phone.Functions.LoadMentionedTweets = (tweet) => {
    tweet = tweet.reverse();

    if (tweet.length > 0) {
        $(".twitter-mentioned").html("");
        $.each(tweet, function(i, tweet){
            var TwitterMessage = RS.Phone.Functions.FormatTwitterMessage(tweet.message);
            var Tweet_time = RS.Phone.Functions.FormatTweetTime(tweet.time);
    
            var TwitterUsername = tweet.firstName + ' ' + tweet.lastName;
            var TwitterName = tweet.firstName+' '+tweet.lastName;
            var TwitterAvatar = "./img/default.png";
            
            if (tweet.picture !== "default") {
                TwitterAvatar = tweet.picture;
            }
            
            var TweetElement = '<div class="twitter-tweet" data-twthandler="@'+TwitterUsername.replace(" ", "_")+'">'+
            '<div class="twitter-avatar" >'+
                '<img src="'+TwitterAvatar+'" class="twitter-avatar-img">'+
            '</div>'+
            '<div class="twitter-creator">'+TwitterName+''+
                '<span class="twitter-tag">@'+TwitterUsername.replace(" ", "_")+' &middot; '+Tweet_time+'</span>'+
            '</div>'+
            '<div class="twitter-message">'+TwitterMessage+'</div>'+
        '</div>';
            
            $(".twitter-mentioned").append(TweetElement);
        });
    }
}



CopyMentionTag = (elem) => {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val($(elem).data('mentiontag')).select();
    RS.Phone.Notifications.Add("fab fa-twitter", "Twitter", $(elem).data('mentiontag')+ " copied!", "rgb(27, 149, 224)", 1250);
    document.execCommand("copy");
    $temp.remove();
}

RS.Phone.Functions.LoadHashtags = (hashtags) => {
    if (hashtags !== null) {
        $(".twitter-trending-hashtags").html("");
        //console.log(JSON.stringify(hashtags));
        $.each(hashtags, function(i, hashtag){
            var Elem = '';
            var TweetHandle = "Tweet";
            if (hashtag.messages.length > 1 ) {
               TweetHandle = "Tweets";
            }
            if (hashtag.messages.length >= MinimumTrending) {
                Elem = '<div class="twitter-hashtag" id="tag-'+hashtag.hashtag+'"><div class="twitter-hashtag-status">Trending in CTRP</div> <div class="twitter-hashtag-tag">#'+hashtag.hashtag+'</div> <div class="twitter-hashtag-messages">'+hashtag.messages.length+' '+TweetHandle+'</div> </div>';
            } else {
                Elem = '<div class="twitter-hashtag" id="tag-'+hashtag.hashtag+'"><div class="twitter-hashtag-status">Not trending in CTRP</div> <div class="twitter-hashtag-tag">#'+hashtag.hashtag+'</div> <div class="twitter-hashtag-messages">'+hashtag.messages.length+' '+TweetHandle+'</div> </div>';
            }
        
            $(".twitter-trending-hashtags").append(Elem);
            $("#tag-"+hashtag.hashtag).data('tagData', hashtag);
        });
    }
}

RS.Phone.Functions.LoadHashtagMessages = (tweet) => {
    tweet = tweet.reverse();
    if (tweet !== null && tweet !== undefined && tweet !== "" && tweet.length > 0) {
        $(".twitter-hashtag-tweets").html("");
        $.each(tweet, function(i, tweet){
            var TwitterMessage = RS.Phone.Functions.FormatTwitterMessage(tweet.message);
            var Tweet_time = RS.Phone.Functions.FormatTweetTime(tweet.time);

            var TwitterUsername = tweet.firstName + ' ' + tweet.lastName;
            var TwitterName = tweet.firstName+' '+tweet.lastName;
            var TwitterAvatar = "./img/default.png";
            
            if (tweet.picture !== "default") {
                TwitterAvatar = tweet.picture;
            }
            
            var TweetElement = '<div class="twitter-tweet" data-twthandler="@'+TwitterUsername.replace(" ", "_")+'">'+
            '<div class="twitter-avatar" >'+
                '<img src="'+TwitterAvatar+'" class="twitter-avatar-img">'+
            '</div>'+
            '<div class="twitter-creator">'+TwitterName+''+
                '<span class="twitter-tag">@'+TwitterUsername.replace(" ", "_")+' &middot; '+Tweet_time+'</span>'+
            '</div>'+
            '<div class="twitter-message">'+TwitterMessage+'</div>'+
        '</div>';
                    
            $(".twitter-hashtag-tweets").append(TweetElement);
        });
    }
}



RS.Phone.Functions.FormatTweetTime = (tweetTime) => {
    var today = new Date(); // Get Current time
    var TweetTime = new Date(tweetTime); // Get tweet time
    var difference = (today - TweetTime); // Calculate difference between now and tweet time
    var differenceSeconds = Math.floor(difference / 1000); // Change miliseconds to seconds
    var differenceMinutes = Math.floor(differenceSeconds / 60); // Change seconds to minutes
    var differenceHours = Math.floor(differenceMinutes / 60); // Change minuts to hours
    var differenceDays = Math.floor(differenceHours / 24); // change hours to days

    var TimeAgo = differenceSeconds + ' s';

    if (differenceMinutes > 0) {
        TimeAgo = differenceMinutes + ' m';
    } else if (differenceHours > 0) {
        TimeAgo = differenceHours + ' h';
    } else if (differenceDays > 0) {
        TimeAgo = differenceDays + ' d';
    }

    return TimeAgo
}

RS.Phone.Functions.FormatTwitterMessage = (TwitterMessage) => {
    var TwtMessage = TwitterMessage;
    var res = TwtMessage.split("@");
    var tags = TwtMessage.split("#");
    var InvalidSymbols = [
        "[",
        "?",
        "!",
        "@",
        "#",
        "]",
    ]

    for(i = 1; i < res.length; i++) {
        var MentionTag = res[i].split(" ")[0];
        if (MentionTag !== null && MentionTag !== undefined && MentionTag !== "") {
            TwtMessage = TwtMessage.replace("@"+MentionTag, "<span class='mentioned-tag' data-mentiontag='@"+MentionTag+"' style='color: rgb(27, 149, 224);'>@"+MentionTag+"</span>");
        }
    }

    for(i = 1; i < tags.length; i++) {
        var Hashtag = tags[i].split(" ")[0];

        for(i = 1; i < InvalidSymbols.length; i++){
            var symbol = InvalidSymbols[i];
            var res = Hashtag.indexOf(symbol);

            if (res > -1) {
                Hashtag = Hashtag.replace(symbol, "");
            }
        }

        if (Hashtag !== null && Hashtag !== undefined && Hashtag !== "") {
            TwtMessage = TwtMessage.replace("#"+Hashtag, "<span class='hashtag-tag-text' data-hashtag='"+Hashtag+"' style='color: rgb(27, 149, 224);'>#"+Hashtag+"</span>");
        }
    }

    return TwtMessage
}

// Click action handlers
$(document).on('click', '.new-tweet-btn', function(e) {
    e.preventDefault();

    $(".twitter-new").css({"display":"block"});
    $(".twitter-new").animate({
        top: 8+"vh"
    }, 200);
    $(".twitter-tweets").animate({
        top: -48+"vh"
    }, 200, function(){
        $(".twitter-tweets").css({"display":"none"});
    });

    $(".new-tweet-btn").css({"display":"none"}); // hide new tweet icon
    $(".twitter-navbar-logo").css({"display":"none"}); // hide twitter logo

    $(".new-tweet-send-btn").css({"display":"block"}); // show tweet btn
    $(".new-tweet-send-btn2").css({"display":"block"});
    $("#tweet-new-url").css({"display":"block"});
    $(".close-new-tweet-btn").css({"display":"block"}); // show cross btn

    $('.twitter-footer').animate({
        bottom: -7.5+"vh"
    }, 200); // Remove twitter bottom menu
});

$(document).on('click', '.close-new-tweet-btn', function(e) {
    e.preventDefault();

    $(".twitter-tweets").css({"display":"block"});
    $(".twitter-tweets").animate({
        top: 8+"vh"
    }, 200);
    $(".twitter-new").animate({
        top: 62+"vh"
    }, 200, function(){
        $(".twitter-new").css({"display":"none"});
    });
    $(".new-tweet-btn").css({"display":"block"}); // Show new tweet icon
    $(".twitter-navbar-logo").css({"display":"block"}); // Show twitter logo
    $("#tweet-new-url").css({"display":"none"});
    
    $(".new-tweet-send-btn").css({"display":"none"}); // hide tweet btn
    $(".new-tweet-send-btn2").css({"display":"none"}); // hide tweet btn
    $(".close-new-tweet-btn").css({"display":"none"}); // hide cross btn

    $('.twitter-footer').animate({
        bottom: 0.5+"vh"
    }, 200); // Show twitter bottom menu 
});

$(document).on('click', '.new-tweet-send-btn', function(e) { // Send new tweet
    e.preventDefault();

    var TweetUrl = $("#tweet-new-url").val();
    var tweetText = $('#twitter-new-message-box').val();
    var currentDate = new Date();

    if (tweetText == "") { // Check if twitter message box is empty
        RS.Phone.Notifications.Add("fab fa-twitter", "Twitter", "You have not typed a message!", "#1DA1F2");
        return
    }


    // Send new tweet
    $.post('https://ctrp-phone_new/SendNewTweet', JSON.stringify({
        Message: tweetText,
        Date: currentDate,
        Picture: RS.Phone.Data.MetaData.profilepicture
    }), (tweets) => {
        RS.Phone.Functions.LoadTweets(tweets);
    });

    $('#tweet-new-url').val("")
    $('#twitter-new-message-box').val(""); // Empty twitter box
    

    $(".twitter-tweets").css({"display":"block"});
    $(".twitter-tweets").animate({
        top: 8+"vh"
    }, 200);
    $(".twitter-new").animate({
        top: 62+"vh"
    }, 200, function(){
        $(".twitter-new").css({"display":"none"});
    });
    $(".new-tweet-btn").css({"display":"block"}); // Show new tweet icon
    $(".twitter-navbar-logo").css({"display":"block"}); // Show twitter logo
    
    $(".new-tweet-send-btn").css({"display":"none"}); // hide tweet btn
    $(".new-tweet-send-btn2").css({"display":"none"}); // hide tweet btn
    $(".close-new-tweet-btn").css({"display":"none"}); // hide cross btn

    $('.twitter-footer').animate({
        bottom: 0.5+"vh"
    }, 200); // Show twitter bottom menu 

});

$(document).on('click', '.tweet-reply', function (e) {
    e.preventDefault();

    $(".twitter-new").css({"display":"block"});
    $(".twitter-new").animate({
        top: 8+"vh"
    }, 200);
    $(".twitter-tweets").animate({
        top: -48+"vh"
    }, 200, function(){
        $(".twitter-tweets").css({"display":"none"});
    });

    $(".new-tweet-btn").css({"display":"none"}); // hide new tweet icon
    $(".twitter-navbar-logo").css({"display":"none"}); // hide twitter logo

    $(".new-tweet-send-btn").css({"display":"block"}); // show tweet btn
    $(".new-tweet-send-btn2").css({"display":"block"});
    $("#tweet-new-url").css({"display":"block"});
    $(".close-new-tweet-btn").css({"display":"block"}); // show cross btn

    $('.twitter-footer').animate({
        bottom: -7.5+"vh"
    }, 200); // Remove twitter bottom menu
    
    var TwtName = $(this).parent().data('twthandler');
    var text = $(this).parent().data();
    $("#twitter-new-message-box").val(TwtName );
});

$(document).on('click', '#send-photo', function (e) {
    e.preventDefault();

    $.post('https://ctrp-phone_new/PostNewImage', JSON.stringify({}),
        function (url) {
            $('#tweet-new-url').val(url)

        },
    );

    RS.Phone.Functions.ClosePhone();

});

$(document).on('click', '.heart', function (e) {
    e.preventDefault();

    $(this).toggleClass("is-active");

});



