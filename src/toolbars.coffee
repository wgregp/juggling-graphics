controllers = require './controllers.coffee'


class Toolbar

  constructor: (@container, @pattern, @display, @sliders, @colors, @about, @otherDisplay) ->
    @bar = document.createElement 'div'
    @addButtons()

  activate: ->
    @container.innerHTML = ""
    @container.appendChild @bar

  spacer: ->
    s = document.createElement 'div'
    s.classList.add 'spacer'
    @bar.appendChild s

  button: (image, action) ->
    b = new controllers.Button require("./style/#{image}.png"), action
    @bar.append b.node()

  sliderButton: -> @button 'sliders', => @sliders.toggle()

  colorButton: -> @button 'colours', => @colors.toggle()

  downloadPNGButton: ->
    downloadPNGButton = new controllers.Button require('./style/down-png.png'), =>
      return if @display.node().width is 0
      downloadPNGButton.node().href = @display.node().toDataURL()
      downloadPNGButton.node().download = "#{@pattern.ss}.png" 
    @bar.appendChild downloadPNGButton.node()

  aboutButton: -> @button 'about',  => @about.toggle()

  switchDisplays: ->
    @display.goDormant()
    @display.node().style.display = 'none'
    @otherDisplay.node().style.display = 'block'
    @otherDisplay.wakeUp()
    @otherToolbar.activate()


class Toolbar2D extends Toolbar

  linearButton: ->
    linearButton = new controllers.Button require('./style/linear.png'), => 
      @display.linear()
    @bar.appendChild linearButton.node()

  circularButton: ->
    circularButton = new controllers.Button require('./style/circular.png'), => 
      @display.circular()
    @bar.appendChild circularButton.node()

  threeDButton: -> @button '3D', => @switchDisplays()

  playPauseButton: ->
    play = =>
      @display.startAnimation()
    pause = =>
      @display.stopAnimation()
    playPauseButton = new controllers.TogglingButton require('./style/play.png'), play,
      require('./style/pause.png'), pause 
    @bar.appendChild playPauseButton.node()

  addButtons: () ->
    @linearButton()
    @circularButton()
    @spacer()
    @threeDButton()
    @spacer()
    @sliderButton()
    @colorButton()
    @spacer()
    @playPauseButton()
    @spacer()
    @downloadPNGButton()
    @spacer()
    @aboutButton()


class Toolbar3D extends Toolbar

  refreshButton: -> @button 'refresh', => @display.refresh()

  nestedButton: -> @button 'taurus-nest', => @display.toNested()

  sideBySideButton: -> @button 'taurus-side', => @display.toSideBySide()

  twoDButton: -> @button '2D', => @switchDisplays()

  addButtons: () ->
    @refreshButton()
    @spacer()
    @nestedButton()
    @sideBySideButton()
    @spacer()
    @twoDButton()
    @spacer()
    @sliderButton()
    @colorButton()
    @spacer()
    @downloadPNGButton()    
    @spacer()
    @aboutButton()


module.exports =
  Toolbar2D : Toolbar2D
  Toolbar3D : Toolbar3D
