fx_version 'cerulean'
game { 'gta5' }

name 'Car control'
version '1.0'

ui_page 'html/carcontrol.html'

file {
  'Newtonsoft.Json.dll',

  'html/carbon.jpg',
  'html/carcontrol.html',
  'html/doorFrontLeft.png',
  'html/doorFrontRight.png',
  'html/doorRearLeft.png',
  'html/doorRearRight.png',
  'html/frontHood.png',
  'html/ignition.png',
  'html/rearHood.png',
  'html/rearHood2.png',
  'html/seatFrontLeft.png',
  'html/template.html',
  'html/windowFrontLeft.png',
  'html/windowFrontRight.png',
  'html/windowRearLeft.png',
  'html/windowRearRight.png',
  'html/interiorLight.png',
}

client_scripts {
  'Config.lua',
  'utils.lua',
  'client/Client.lua',
}

