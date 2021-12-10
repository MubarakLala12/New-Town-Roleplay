$(document).ready(function () {
  window.addEventListener('message', function (event) {
    var item = event.data
    mugshot_url = " "

    if (item.command == 'open') {
      $("#virus-idcardop").css("display", "block")
     
      $("#name").html(item.name + " " + item.name2)
      $("#birth").html(item.birth)
      $("#gender").html(item.gender)
      $("#csn").html(item.csn)
      $("#signature").html(item.name + " " + item.name2)
      const img = document.getElementById("canvas");
      img.src = item.canvas;


    } else if (item.command == 'close') {
      $("#virus-idcardop").css("display", "none")
      
    }
  })

  $(document).keyup(function (event) {
    if (event.which == 27) {
      $.post('http://virus-idcard:closeUI')
    }
  })

  
  
  

  $(document).mousemove(function (event) {
    cursorX = event.pageX
    cursorY = event.pageY
  })
})




$(document).ready(function () {
  window.addEventListener('message', function (event) {
    var item = event.data
    mugshot_url = " "

    if (item.command == 'driveropen') {
      $("#virus-idcardop2").css("display", "block")
      $("#virus-idcardop").css("display", "none")
     
      $("#name2").html(item.name + " " + item.name2)
      $("#birth2").html(item.birth)
      $("#gender2").html(item.gender)
      $("#csn2").html(item.csn)
      $("#signature2").html(item.name + " " + item.name2)
      const img = document.getElementById("canvas2");
      img.src = item.canvas;


    } else if (item.command == 'close') {
      $("#virus-idcardop2").css("display", "none")
      $("#virus-idcardop").css("display", "none")
      
    }
  })

  $(document).keyup(function (event) {
    if (event.which == 27) {
      $.post('http://virus-idcard:closeUI')
    }
  })

  
  
  

  $(document).mousemove(function (event) {
    cursorX = event.pageX
    cursorY = event.pageY
  })
})








$("#close-btn").click(function () {
  $.post('http://virus-idcard/close-btn');
});

$("#close-btn2").click(function () {
  $.post('http://virus-idcard/close-btn2');
});




function getBase64Image(src, callback, outputFormat) {
  const img = new Image();
  img.crossOrigin = 'Anonymous';
  img.onload = () => {
	const canvas = document.createElement('canvas');
	const ctx = canvas.getContext('2d');
	let dataURL;
	canvas.height = img.naturalHeight;
	canvas.width = img.naturalWidth;
	ctx.drawImage(img, 0, 0);
	dataURL = canvas.toDataURL(outputFormat);
	callback(dataURL);
  };

  img.src = src;
  if (img.complete || img.complete === undefined) {
	img.src = src;
  }
}

function Convert(pMugShotTxd,id) {
	let tempUrl = 'https://nui-img/' + pMugShotTxd + '/' + pMugShotTxd + '?t=' + String(Math.round(new Date().getTime() / 1000));
	if (pMugShotTxd == 'none') {
		tempUrl = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/434px-Unknown_person.jpg';   
	}
    getBase64Image(tempUrl, function(dataUrl) {
      	$.post('http://virus-idcard/Answer', JSON.stringify({
			Answer: dataUrl,
			Id: id,
		}));
    })
}

window.addEventListener('message', (e) => {
    let msg = e.data
    if (msg.type == 'convert') {
		Convert(msg.pMugShotTxd,msg.id);
    }
})



