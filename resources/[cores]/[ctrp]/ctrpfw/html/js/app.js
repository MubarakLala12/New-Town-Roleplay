$(function () {
    var sound = new Audio('https://cdn.discordapp.com/attachments/767625711833317397/874584801741508608/notification_up.mp3');
    sound.volume = 0.2;

    var errorsound = new Audio('https://cdn.discordapp.com/attachments/767625711833317397/874587528022327326/error_text_message.mp3');
    errorsound.volume = 0.4;
    
    window.addEventListener('message', function (event) {
        if (event.data.action == 'open') {
            var number = Math.floor((Math.random() * 1000) + 1);
            $('.notify').append(`
            <div class="wrapper-${number}">
                <div class="notification_main-${number}">
                    <div class="text-${number}">
                        ${event.data.text}
                    </div>
                </div>
            </div>`)
            $(`.wrapper-${number}`).css({
                "margin-bottom": "10px",
                "width": "275px",
                "margin": "0 0 8px -180px",
                "border-radius": "15px"
            })
            $('.notification_main-'+number).addClass('main')
            $('.text-'+number).css({
                "font-size": "12px"
            })

            if (event.data.type == 'success') {
                
                $(`.notification_main-${number}`).addClass('success-icon')
                $(`.wrapper-${number}`).addClass('success')
                sound.play();
            } else if (event.data.type == 'info') {
                
                $(`.notification_main-${number}`).addClass('info-icon')
                $(`.wrapper-${number}`).addClass('info')
                sound.play();
            } else if (event.data.type == 'error') {
               
                $(`.notification_main-${number}`).addClass('error-icon')
                $(`.wrapper-${number}`).addClass('error')
                errorsound.play();
            } else if (event.data.type == 'warning') {
                
                $(`.notification_main-${number}`).addClass('warning-icon')
                $(`.wrapper-${number}`).addClass('warning')
                sound.play();
            } else if (event.data.type == 'paise') {
                
                $(`.notification_main-${number}`).addClass('paise-icon')
                $(`.wrapper-${number}`).addClass('paise')
                sound.play();
            } else if (event.data.type == 'long') {
                
                $(`.notification_main-${number}`).addClass('long-icon')
                $(`.wrapper-${number}`).addClass('long')
                sound.play();
            }
            else if (event.data.type == 'primary') {
                
                $(`.notification_main-${number}`).addClass('primary-icon')
                $(`.wrapper-${number}`).addClass('primary')
                sound.play();
            }
            anime({
                targets: `.wrapper-${number}`,
                translateX: -60,
                duration: 750,
                easing: 'spring(5, 100, 35, 10)',
            })
            setTimeout(function () {
                anime({
                    targets: `.wrapper-${number}`,
                    translateX: 500,
                    duration: 750,
                    easing: 'spring(5, 80, 5, 0)'
                })
                setTimeout(function () {
                    $(`.wrapper-${number}`).remove()
                }, 750)
            }, event.data.length)
        }
    })
})