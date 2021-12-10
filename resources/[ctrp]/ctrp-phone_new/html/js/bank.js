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

var FoccusedBank = null;

$(document).on('click', '.bank-app-account', function(e){
    var copyText = document.getElementById("iban-account");
    copyText.select();
    copyText.setSelectionRange(0, 99999);
    document.execCommand("copy");

    RS.Phone.Notifications.Add("fas fa-university", "HBANK", "Bank account no. Copied!", "#badc58", 1750);
});

var CurrentTab = "accounts";

$(document).on('click', '.bank-app-bottom-button', function(e){
    e.preventDefault();

    var PressedObject = this;
    var PressedTab = $(PressedObject).data('headertype');

    if (CurrentTab != PressedTab) {
        var PreviousObject = $(".bank-app-bottom-menu").find('[data-headertype="'+CurrentTab+'"]');

        if (PressedTab == "invoices") {
            $(".bank-app-"+CurrentTab).animate({
                left: -30+"vh"
            }, 250, function(){
                $(".bank-app-"+CurrentTab).css({"display":"none"})
            });
            $(".bank-app-"+PressedTab).css({"display":"block"}).animate({
                left: 0+"vh"
            }, 250);
        } else if (PressedTab == "accounts") {
            $(".bank-app-"+CurrentTab).animate({
                left: 30+"vh"
            }, 250, function(){
                $(".bank-app-"+CurrentTab).css({"display":"none"})
            });
            $(".bank-app-"+PressedTab).css({"display":"block"}).animate({
                left: 0+"vh"
            }, 250);
        }

        $(PreviousObject).removeClass('bank-app-bottom-button-selected');
        $(PressedObject).addClass('bank-app-bottom-button-selected');
        setTimeout(function(){ CurrentTab = PressedTab; }, 300)
    }
})

RS.Phone.Functions.DoBankOpen = function() {
    RS.Phone.Data.PlayerData.money.bank = (RS.Phone.Data.PlayerData.money.bank).toFixed(0);
    $(".bank-app-account-owner").html('<i class="fas fa-user"> </i> '+RS.Phone.Data.PlayerData.charinfo.firstname + " " + RS.Phone.Data.PlayerData.charinfo.lastname);
    $(".bank-app-account-number").val(RS.Phone.Data.PlayerData.charinfo.account);
    $(".bank-app-account-saldo").html(RS.Phone.Data.PlayerData.money.bank+" &dollar;");
    $(".bank-app-account-saldo").data('balance', RS.Phone.Data.PlayerData.money.bank);
    CurrentTab = "accounts";

    // $(".bank-app-loaded").css({"display":"none", "padding-left":"30vh"});
    // $(".bank-app-accounts").css({"left":"30vh"});
    // $(".qbank-logo").css({"left": "0vh"});
    // $("#qbank-text").css({"opacity":"0.0", "left":"9vh"});
    // $(".bank-app-loading").css({
    //     "display":"block",
    //     "left":"0vh",
    // });
    // setTimeout(function(){
        // CurrentTab = "accounts";
    //     $(".qbank-logo").animate({
    //         left: -12+"vh"
    //     }, 500);
    //     setTimeout(function(){
    //         $("#qbank-text").animate({
    //             opacity: 1.0,
    //             left: 14+"vh"
    //         });
    //     }, 100);
    //     setTimeout(function(){
    //         $(".bank-app-loaded").css({"display":"block"}).animate({"padding-left":"0"}, 300);
    //         $(".bank-app-accounts").animate({left:0+"vh"}, 300);
    //         $(".bank-app-loading").animate({
    //             left: -30+"vh"
    //         },300, function(){
    //             $(".bank-app-loading").css({"display":"none"});
    //         });
    //     }, 1500)
    // }, 500)
}

$(document).on('click', '.bank-app-transfer-money', function(e){
    RS.Phone.Animations.TopSlideDown(".bank-app-transfer", 400, 0);
});

$(document).on('click', '#cancel-transfer', function(e){
    e.preventDefault();

    RS.Phone.Animations.TopSlideUp(".bank-app-transfer", 400, -100);
});

$(document).on('click', '#accept-transfer', function(e){
    e.preventDefault();

    var iban = $("#bank-transfer-iban").val();
    var amount = $("#bank-transfer-amount").val();

    if (iban != "" && amount != "") {
            $.post('https://ctrp-phone_new/CanTransferMoney', JSON.stringify({
                sendTo: iban,
                amountOf: amount,
            }), function(data){
                if (data.TransferedMoney) {
                    $("#bank-transfer-iban").val("");
                    $("#bank-transfer-amount").val("");

                    $(".bank-app-account-saldo").html((data.NewBalance).toFixed(0) + " &dollar;");
                    $(".bank-app-account-saldo").data('balance', (data.NewBalance).toFixed(0));
                    RS.Phone.Notifications.Add("fas fa-university", "HBANK", "You have &dollar; "+amount+" transferred!", "#badc58", 1500);
                } else {
                    RS.Phone.Notifications.Add("fas fa-university", "HBANK", "You don't have enough balance!", "#badc58", 1500);
                }
                RS.Phone.Animations.TopSlideUp(".bank-app-transfer", 400, -100);
            });
    } else {
        RS.Phone.Notifications.Add("fas fa-university", "HBANK", "Fill out all fields!", "#badc58", 1750);
    }
});

GetInvoiceLabel = function(type) {
    retval = null;
    if (type == "request") {
        retval = "Payment request";
    }

    return retval
}

$(document).on('click', '.pay-invoice', function(event){
    event.preventDefault();

    var InvoiceId = $(this).parent().parent().attr('id');
    var InvoiceData = $("#"+InvoiceId).data('invoicedata');
    var BankBalance = $(".bank-app-account-saldo").data('balance');

    if (BankBalance >= InvoiceData.amount) {
        $.post('https://ctrp-phone_new/PayInvoice', JSON.stringify({
            sender: InvoiceData.sender,
            amount: InvoiceData.amount,
            invoiceId: InvoiceData.invoiceid,
        }), function(CanPay){
            if (CanPay) {
                $("#"+InvoiceId).animate({
                    left: 30+"vh",
                }, 300, function(){
                    setTimeout(function(){
                        $("#"+InvoiceId).remove();
                    }, 100);
                });
                RS.Phone.Notifications.Add("fas fa-university", "HBANK", "You have &dollar;"+InvoiceData.amount+" paid!", "#badc58", 1500);
                var amountData = $(".bank-app-account-saldo").data('balance');
                var NewAmount = (amountData - InvoiceData.amount).toFixed(0);
                $("#bank-transfer-amount").val(NewAmount);
                $(".bank-app-account-saldo").data('balance', NewAmount);
            } else {
                RS.Phone.Notifications.Add("fas fa-university", "HBANK", "You don't have enough balance!", "#badc58", 1500);
            }
        });
    } else {
        RS.Phone.Notifications.Add("fas fa-university", "HBANK", "You don't have enough balance!", "#badc58", 1500);
    }
});

$(document).on('click', '.decline-invoice', function(event){
    event.preventDefault();
    var InvoiceId = $(this).parent().parent().attr('id');
    var InvoiceData = $("#"+InvoiceId).data('invoicedata');

    $.post('https://ctrp-phone_new/DeclineInvoice', JSON.stringify({
        sender: InvoiceData.sender,
        amount: InvoiceData.amount,
        invoiceId: InvoiceData.invoiceid,
    }));
    $("#"+InvoiceId).animate({
        left: 30+"vh",
    }, 300, function(){
        setTimeout(function(){
            $("#"+InvoiceId).remove();
        }, 100);
    });
    RS.Phone.Notifications.Add("fas fa-university", "HBANK", "You have &dollar;"+InvoiceData.amount+" paid!", "#badc58", 1500);
});

RS.Phone.Functions.LoadBankInvoices = function(invoices) {
    if (invoices !== null) {
        $(".bank-app-invoices-list").html("");

        $.each(invoices, function(i, invoice){
            var Elem = '<div class="bank-app-invoice" id="invoiceid-'+i+'"> <div class="bank-app-invoice-title">'+GetInvoiceLabel(invoice.type)+' <span style="font-size: 1vh; color: gray;">(Sender: '+invoice.name+')</span></div> <div class="bank-app-invoice-amount">&dollar; '+invoice.amount+',-</div> <div class="bank-app-invoice-buttons"> <i class="fas fa-check-circle pay-invoice"></i> <i class="fas fa-times-circle decline-invoice"></i> </div> </div>';

            $(".bank-app-invoices-list").append(Elem);
            $("#invoiceid-"+i).data('invoicedata', invoice);
        });
    }
}

RS.Phone.Functions.LoadContactsWithNumber = function(myContacts) {
    var ContactsObject = $(".bank-app-my-contacts-list");
    $(ContactsObject).html("");
    var TotalContacts = 0;

    $("#bank-app-my-contact-search").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $(".bank-app-my-contacts-list .bank-app-my-contact").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    if (myContacts !== null) {
        $.each(myContacts, function(i, contact){
            var RandomNumber = Math.floor(Math.random() * 6);
            var ContactColor = RS.Phone.ContactColors[RandomNumber];
            var ContactElement = '<div class="bank-app-my-contact" data-bankcontactid="'+i+'"> <div class="bank-app-my-contact-firstletter">'+((contact.name).charAt(0)).toUpperCase()+'</div> <div class="bank-app-my-contact-name">'+contact.name+'</div> </div>'
            TotalContacts = TotalContacts + 1
            $(ContactsObject).append(ContactElement);
            $("[data-bankcontactid='"+i+"']").data('contactData', contact);
        });
    }
};

$(document).on('click', '.bank-app-my-contacts-list-back', function(e){
    e.preventDefault();

    RS.Phone.Animations.TopSlideUp(".bank-app-my-contacts", 400, -100);
});

$(document).on('click', '.bank-transfer-mycontacts-icon', function(e){
    e.preventDefault();

    RS.Phone.Animations.TopSlideDown(".bank-app-my-contacts", 400, 0);
});

$(document).on('click', '.bank-app-my-contact', function(e){
    e.preventDefault();
    var PressedContactData = $(this).data('contactData');

    if (PressedContactData.iban !== "" && PressedContactData.iban !== undefined && PressedContactData.iban !== null) {
        $("#bank-transfer-iban").val(PressedContactData.iban);
    } else {
        RS.Phone.Notifications.Add("fas fa-university", "HBank", "No IBAN is bound to this contact!", "#badc58", 2500);
    }
    RS.Phone.Animations.TopSlideUp(".bank-app-my-contacts", 400, -100);
});