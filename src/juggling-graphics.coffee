require './style/juggling-graphics.css'

spacer = (bar) ->
  s = document.createElement 'div'
  s.classList.add 'spacer'
  bar.appendChild s

Pattern = (require './pattern.coffee').Pattern
views2D = require './views2D.coffee'
views3D = require './views3D.coffee'
textviews = require './textviews.coffee'
style = require './style.coffee'
controllers = require './controllers.coffee'
toolbars = require './toolbars.coffee'

ROOT = 'root'
pattern = new Pattern
siteswap = new controllers.SiteswapInput ROOT, pattern  
look = new style.Look()
colors = new controllers.OrbitColorPicker ROOT, pattern, look

display2D = new views2D.Canvas ROOT, pattern, look
display3D = new views3D.Canvas3D ROOT, pattern, look

sliders = new controllers.PropertySliders ROOT, look, style.LOOK_PROPERTIES.sliders
about = new textviews.AboutView()

rootNode = document.getElementById ROOT

buttonBar = document.createElement 'div'
buttonBar.classList.add 'buttonBar'

toolbar2D = new toolbars.Toolbar2D buttonBar, pattern, display2D, sliders, colors, about, display3D
toolbar2D.activate()

toolbar3D = new toolbars.Toolbar3D buttonBar, pattern, display3D, sliders, colors, about, display2D

toolbar2D.otherToolbar = toolbar3D
toolbar3D.otherToolbar = toolbar2D

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
rootNode.appendChild display2D.node()
rootNode.appendChild display3D.node()

pattern.addListener display2D
pattern.addListener colors
look.addListener display2D
look.addListener colors

display2D.update()
siteswap.node().focus()

