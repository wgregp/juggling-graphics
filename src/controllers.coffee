class OrbitColorPicker

  constructor: (@parentName, @pattern, @look) ->
    @createContainer()
    @palette = new Palette @look
    @container.appendChild @palette.container

  createContainer: ->
    @container = document.createElement 'div'
    @container.id = "#{@parentName}-colors"
    @container.classList.add 'colorpicker'
    @orbits = document.createElement 'table'
    @orbits.classList.add 'orbitcolors'
    @container.appendChild @orbits

  node: -> @container

  hide: -> @container.style.display = 'none'

  show: -> @container.style.display = 'inline-block'

  toggle: -> if @container.style.display =='none' then @show() else @hide()

  update: -> @refreshOrbits()

  refreshOrbits: ->
    @orbits.innerHTML = ''
    return if not @pattern.valid   
    @addOrbit ix, orbit, @look.color ix for ix, orbit of @pattern.orbits

  addOrbit: (ix, orbit, color) ->
    row = document.createElement 'tr'
    row.classList.add 'orbitcolor'
    text = (t.text for t in orbit.throws).reduce (x,y) -> x+y
    row.innerHTML = "<td class=\"color\" style=\"background-color: #{color}\"></td>
      <td class=\"text\">#{text}</td>"
    @orbits.appendChild row
    row.addEventListener 'click', => @palette.setTarget ix, row


class Palette

  constructor: (@look) ->
    @container = document.createElement 'table'
    @container.classList.add 'palette'
    @addColors()
    @targetIndex = undefined

  addColors: ->
    for ix, color of @look.palette
      if ix % 3 is 0
        row = document.createElement 'tr' 
        @container.appendChild row
      cell = document.createElement 'td'
      cell.classList.add 'palettecolor'
      cell.style.backgroundColor = color
      row.appendChild cell
      cell.addEventListener 'click', @setColor color

  setColor: (color) ->
    => 
      if @targetIndex?
        @look.setColor @targetIndex, color 
        @targetRow.classList.remove 'selected'
        @targetRow = @targetIndex = undefined

  setTarget: (@targetIndex, row) ->
    @targetRow.classList.remove 'selected' if @targetRow?
    @targetRow = row
    @targetRow.classList.add 'selected'


class PropertySliders

  constructor: (@parentName, look, properties) ->
    @createContainer()
    @createSlider property for property in properties
    look[property.name] = property.default for property in properties

  node: -> @container

  createContainer: ->
    @container = document.createElement 'div'
    @container.id = "#{@parentName}-sliders"
    @container.classList.add 'propertysliders'

  show: -> @container.style.display = 'inline-table'

  hide: -> @container.style.display = 'none'

  toggle: ->
    if @container.style.display is 'none' then @show() else @hide()

  sliderId: (property) -> "#{@parentName}-sliders-#{property.name}"

  createSlider: (property) ->
    id = @sliderId property
    row = document.createElement 'div'
    row.classList.add 'row'
    row.innerHTML = "
      <span class=\"col\"><label for=\"id\">#{property.label}</label></span>
      <span class=\"col\" id=\"#{id}-current\">#{property.default}</span>
      <span class=\"col\"><input type=\"range\" 
        id=\"#{id}\" 
        min=\"#{property.min}\" 
        max=\"#{property.max}\" 
        step=\"#{property.step}\" 
        value=\"#{property.default}\" 
        name=\"#{id}\" />
      </span>"
    @container.appendChild row

  connectTo: (look, properties) -> 
    @connectSlider look, property for property in properties

  connectSlider: (look, property) ->
    id = @sliderId property
    slider = document.getElementById id
    current = document.getElementById "#{id}-current"
    slider.addEventListener 'input', @listener(slider, look, current, property), false

  listener: (slider, look, current, property) ->
    ->
      current.innerHTML = slider.value
      look.set property.name, parseFloat slider.value


class SiteswapInput

  constructor: (@parentName, @pattern) ->
    @createInputField()
    @attachListeners()

  node: -> @siteswapField

  createInputField: ->
    @siteswapField = document.createElement 'input'
    @siteswapField.id = "#{@parentName}-siteswap"
    @siteswapField.placeholder = 'siteswap'
    @siteswapField.classList.add 'siteswap'
    
  attachListeners: ->
    @siteswapField.addEventListener 'input', @recomputePattern
    
  recomputePattern: =>
    @siteswapField.classList.remove 'invalid-siteswap', 'valid-siteswap'
    @pattern.newSiteswap @siteswapField.value
    if @siteswapField.value.length > 0
      @siteswapField.classList.add if @pattern.valid then 'valid-siteswap' else 'invalid-siteswap'

class Button

  constructor: (image, action) ->
    @button = document.createElement 'a'
    @button.classList.add 'button'
    icon = document.createElement 'img'
    icon.src = image
    @button.appendChild icon 
    @button.addEventListener 'click', (e) =>
      action()

  node: -> @button


class TogglingButton

  constructor: (image1, function1, image2, function2) ->
    @button = document.createElement 'div'
    @button.classList.add 'button'
    @icon1 = document.createElement 'img'
    @icon1.src = image1
    @icon2 = document.createElement 'img'
    @icon2.src = image2
    @action1 = (e) =>
      @setButtonFromTo @action1, @action2, @icon2 if function1()
    @action2 = (e) =>
      @setButtonFromTo @action2, @action1, @icon1 if function2()
    @reset()

  setButtonFromTo: (oldAction, newAction, newIcon) ->
      @button.innerHTML = ''
      @button.appendChild newIcon
      @button.removeEventListener 'click', oldAction
      @button.addEventListener 'click', newAction

  reset: -> @setButtonFromTo @action2, @action1, @icon1

  node: -> @button


module.exports = 
  SiteswapInput : SiteswapInput
  PropertySliders : PropertySliders
  Button: Button
  TogglingButton: TogglingButton
  OrbitColorPicker: OrbitColorPicker

