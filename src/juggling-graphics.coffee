require './style/juggling-graphics.css'

spacer = (bar) ->
  s = document.createElement 'div'
  s.classList.add 'spacer'
  bar.appendChild s

Pattern = (require './pattern.coffee').Pattern
canvasviews = require './canvasviews.coffee'
textviews = require './textviews.coffee'
style = require './style.coffee'
controllers = require './controllers.coffee'

ROOT = 'root'
pattern = new Pattern
siteswap = new controllers.SiteswapInput ROOT, pattern  
look = new style.Look()
colors = new controllers.OrbitColorPicker ROOT, pattern, look
display = new canvasviews.Canvas ROOT, pattern, look
sliders = new controllers.PropertySliders ROOT, look, style.LOOK_PROPERTIES.sliders
about = new textviews.AboutView()

rootNode = document.getElementById ROOT

buttonBar = document.createElement 'div'
buttonBar.classList.add 'buttonBar'
linearButton = new controllers.Button require('./style/linear.png'), => 
  display.linear()
buttonBar.appendChild linearButton.node()
circularButton = new controllers.Button require('./style/circular.png'), => 
  display.circular()
buttonBar.appendChild circularButton.node()
spacer buttonBar
sliderButton = new controllers.Button require('./style/sliders.png'), =>
  sliders.toggle()
buttonBar.appendChild sliderButton.node()
colorButton = new controllers.Button require('./style/colours.png'), => 
  colors.toggle()
buttonBar.appendChild colorButton.node()
spacer buttonBar
play = =>
  display.startAnimation()
pause = =>
  display.stopAnimation()
playPauseButton = new controllers.TogglingButton require('./style/play.png'), play,
  require('./style/pause.png'), pause 
buttonBar.appendChild playPauseButton.node()
spacer buttonBar
downloadPNGButton = new controllers.Button require('./style/down-png.png'), =>
  return if display.node().width is 0
  downloadPNGButton.node().href = display.node().toDataURL()
  downloadPNGButton.node().download = "#{pattern.ss}.png" 
buttonBar.appendChild downloadPNGButton.node()
spacer buttonBar
aboutButton = new controllers.Button require('./style/about.png'), =>
  about.toggle()
buttonBar.appendChild aboutButton.node()

rootNode.appendChild siteswap.node()
rootNode.appendChild buttonBar

# nerd = new textviews.NerdView ROOT, pattern
# pattern.addListener nerd
# rootNode.appendChild nerd.node()

rootNode.appendChild about.node()
rootNode.appendChild sliders.node()
sliders.hide()
sliders.connectTo look, style.LOOK_PROPERTIES.sliders
rootNode.appendChild colors.node()
colors.hide()
rootNode.appendChild display.node()

pattern.addListener display
pattern.addListener colors
look.addListener display
look.addListener colors

display.update()
siteswap.node().focus()

