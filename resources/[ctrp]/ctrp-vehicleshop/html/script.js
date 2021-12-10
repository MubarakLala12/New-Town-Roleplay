$(document).ready(function () {
    window.addEventListener('message', function (event) {
      var item = event.data
      
  
      if (item.command == 'open') {
        var commision = Math.trunc(item.vehcommission)

        var com = item.com
        var prize = item.vehPrice


        var finalprice = commision + prize

        $(".container").css("display", "block")
        $(".text-testdrive").css("display", "none")
        $(".text-vehiclechange").css("display", "none")
        
       
        $(".text-button").html("Vehicle Name - "+ item.textbutton)
        $(".text-button1").html("Commission - "+ item.com  + "% | $ " + commision)
        $(".text-button2").html("<span style='color:gold; font-size:21px; text-tranform:uppercase;'>E - </span> Buy vehicle - $"+ finalprice)
        $(".text-button3").html("<span style='color:gold; font-size:21px; text-tranform:uppercase;'>H - </span> Finance vehicle - $"+ item.financePrice)
        
      } 
    })
  
    $(document).keyup(function (event) {
      if (event.which == 27) {
        $.post('https://ctrp-vehicleshop:exit')
      }
    })
  
    
    
    
})

$(document).ready(function () {
    window.addEventListener('message', function (event) {
      var item = event.data
      
  
      if (item.command == 'openpdm') {
        var commision = Math.trunc(item.vehcommission)

        var com = item.com
        var prize = item.vehPrice


        var finalprice = commision + prize

        $(".container").css("display", "block")
        $(".text-testdrive").css("display", "block")
        $(".text-vehiclechange").css("display", "block")
        
       
        $(".text-button").html("Vehicle Name - "+ item.textbutton)
        $(".text-button1").html("Commission - "+ item.com  + "% | $ " + commision)
        $(".text-button2").html("<span style='color:gold; font-size:21px; text-tranform:uppercase;'>E - </span> Buy vehicle - $"+ finalprice)
        $(".text-button3").html("<span style='color:gold; font-size:21px; text-tranform:uppercase;'>H - </span> Finance vehicle - $"+ item.financePrice)
        $(".text-vehiclechange").html("<span style='color:gold; font-size:21px; text-tranform:uppercase;'>G - </span> Change vehicle - "+ item.textbutton)
        $(".text-testdrive").html("<span style='color:gold; font-size:15px; text-tranform:uppercase;'>/givetest - </span> To Give Test Drive")
        
      } 
    })
  
    $(document).keyup(function (event) {
      if (event.which == 27) {
        $.post('https://ctrp-vehicleshop:exit')
      }
    })
  
    
    
    
})

$(document).ready(function () {
    window.addEventListener('message', function (event) {
      var item = event.data
  
      if (item.command == 'openbuy') {
        $(".text-buybutton").css("display", "block")
        $(".text-buybutton").html("<span style='color:green; font-size:21px; text-tranform:uppercase;'>[7]  </span> Yes - <span style='color:darkred; font-size:21px; text-tranform:uppercase;'>[8]  </span> No ")
        
 
      } 
    })
  
    $(document).keyup(function (event) {
      if (event.which == 27) {
        $.post('https://ctrp-vehicleshop:exit')
      }
    })
  
    
    
    
})

$(document).ready(function () {
    window.addEventListener('message', function (event) {
      var item = event.data
  
      if (item.command == 'openfinance') {
        $(".text-financebutton").css("display", "block")
        $(".text-financebutton").html("<span style='color:green; font-size:21px; text-tranform:uppercase;'>[5]  </span> Yes - <span style='color:darkred; font-size:21px; text-tranform:uppercase;'>[6]  </span> No ")
        
        
      } else if (item.command == 'close') {
        $(".container").css("display", "none")
        $(".text-buybutton").css("display", "none")
        $(".text-financebutton").css("display", "none")
        
        
      }
    })
  
    $(document).keyup(function (event) {
      if (event.which == 27) {
        $.post('https://ctrp-vehicleshop:exit')
      }
    })
  
    
    
    
})


$(document).ready(function () {
    window.addEventListener('message', function (event) {
      var item = event.data
  
      if (item.command == 'closesub') {
        $(".text-buybutton").css("display", "none")
        $(".text-financebutton").css("display", "none")
        
        
        
      } 
    })
  
    $(document).keyup(function (event) {
      if (event.which == 27) {
        $.post('https://ctrp-vehicleshop:exit')
      }
    })
  
    
    
    
})

$(document).ready(function () {
    window.addEventListener('message', function (event) {
      var item = event.data
  
      if (item.command == 'close') {
        $(".container").css("display", "none")
        $(".text-buybutton").css("display", "none")
        $(".text-financebutton").css("display", "none")
        
        
        
      } 
    })
  
    $(document).keyup(function (event) {
      if (event.which == 27) {
        $.post('https://ctrp-vehicleshop:exit')
      }
    })
  
    
    
    
})

$(document).ready(function () {
    window.addEventListener('message', function (event) {
      var item = event.data
      
  
      if (item.command == 'openoption') {
      
        $(".container").css("display", "none")
         
      } 
    })
  
    $(document).keyup(function (event) {
      if (event.which == 27) {
        $.post('https://ctrp-vehicleshop:exit')
      }
    })
  
    
    
    
})
