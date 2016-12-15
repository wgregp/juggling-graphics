class Canvas

  constructor: (@parentName, @pattern, @look) ->
    @canvas = document.createElement 'canvas'
    @canvas.id = "#{@parentName}-canvas"
    @linear()

  linear: -> @setDisplay LinearWaves

  circular: -> @setDisplay CircularWaves

  setDisplay: (klass) ->
    wasAnimating = @display?.animating
    @stopAnimation()   
    @display = new klass @canvas, @pattern, @look
    @startAnimation() if wasAnimating
    @update()

  update: -> @display.update()

  startAnimation: -> @display?.startAnimation()

  stopAnimation: -> @display?.stopAnimation()

  node: -> @canvas


class Visualization 

  constructor: (@canvas, @pattern, @look) ->
    @offscreen = document.createElement 'canvas'
    @animating = false

  borderPadding: -> @look.lineWidth + 10

  handSeparation: -> (@look.lineWidth + @look.borderWidth) * @look.handSeparation

  throwDir: (h) -> h * 2 - 1

  startAnimation: ->
    if @canvas.width > 0
      @animating = true
      @frameRequest = window.requestAnimationFrame @animate
      true # animation started
    else
      false # no animation

  stopAnimation: ->
    window.cancelAnimationFrame @frameRequest
    @animating = false
    @lastAnimationTime = undefined
    true # animation stopped

  update: ->
    if @pattern.valid
      @setCanvasDimensionsAndClear()
      @draw()
    else
      @canvas.width = 0
      @canvas.height = 0
      @canvas.style.width = "0"
      @canvas.style.height = "0"

  setCanvasDimensionsAndClear: ->
    @canvas.width = @boxWidth() * window.devicePixelRatio 
    @canvas.height = @boxHeight() * window.devicePixelRatio
    @canvas.style.width = "#{@boxWidth()}px"
    @canvas.style.height = "#{@boxHeight()}px"
    dctx = @canvas.getContext '2d'
    dctx.clearRect 0, 0, @canvas.width, @canvas.height

    @offscreen.width = @renderWidth() * window.devicePixelRatio
    @offscreen.height = @boxHeight() * window.devicePixelRatio
    ctx = @offscreen.getContext '2d'
    ctx.fillStyle = @look.background
    ctx.fillRect 0, 0, @offscreen.width, @offscreen.height
    ctx.scale window.devicePixelRatio, window.devicePixelRatio

  maxThrowHeight: -> @look.height @pattern.maxThrow()

  nextView: (views) ->
      views.reduce ((a, v) -> if a.drawnTo < v.drawnTo then a else v), views[0].drawnTo


class LinearWaves extends Visualization

  boxWidth: -> @look.duration @pattern.period()*@look.cycles

  renderWidth: -> @baseOffset() + @boxWidth() + @endPadding()

  # to make sure all orbits have started at the left, allow one period
  baseOffset: -> @look.duration @pattern.period()

  # for animation, need a bit more than one full cycle at the end after baseOffset
  endPadding: -> 1.5 * @look.duration @pattern.period()

  boxHeight: -> (@maxThrowHeight() + @borderPadding())*2 + @handSeparation()

  renderHeight: -> boxHeight()

  views: ->
    (new LinearBraid orbit, @look, @handSeparation(), @look.color ix \
      for ix, orbit of @pattern.orbits)

  draw: ->
    ctx = @offscreen.getContext '2d'
    ctx.translate 0, @boxHeight()/2      
    views = @views()
    while views.length > 0
      view = @nextView views 
      view.curve ctx
      views.splice views.indexOf(view), 1 if view.drawnTo > @renderWidth()
    @animationOffset = 0
    @render()

  render: ->
    dctx = @canvas.getContext '2d'
    dctx.drawImage @offscreen, -(@baseOffset()+@animationOffset), 0

  animate: (time) =>
    return if not @animating
    if @lastAnimationTime
      step = @look.animationStep * 0.06 * (time-@lastAnimationTime)
      @animationOffset = Math.ceil (@animationOffset+step) % (@canvas.width/@look.cycles)
    @lastAnimationTime = time
    @render()
    @frame = window.requestAnimationFrame @animate

  
class CircularWaves extends Visualization

  boxWidth: ->  @diameter() + 2 * (@maxThrowHeight() + @borderPadding()+@handSeparation())

  boxHeight: -> @boxWidth()

  renderWidth: -> @boxWidth()

  renderHeight: -> @boxHeight()

  diameter: -> @circumference() / Math.PI

  radius: -> @diameter()/2

  circumference: -> @look.duration @ticks()

  ticks: -> @pattern.period() * @look.cycles

  draw: ->
    ctx = @offscreen.getContext '2d'
    ctx.translate @boxWidth()/2, @boxWidth()/2
    waves = []
    toFinish = []
    for ix, orbit of @pattern.orbits
      w = new CircularBraid orbit, @look, @handSeparation(), @look.color(ix), @radius(), @ticks(), @pattern.maxThrow()
      waves.push w
    ctx.beginPath()
    while waves.length > 0
      wave = @nextView waves 
      wave.curve ctx
      if wave.drawnTo > wave.end
        toFinish.push wave
        waves.splice waves.indexOf(wave), 1
    wave.finishBraid(ctx) for wave in toFinish 
    @animationOffset = 0
    @render()

  render: ->
    dctx = @canvas.getContext '2d'
    dctx.save() 
    centre = @canvas.width/2
    dctx.translate centre, centre
    dctx.rotate @animationOffset 
    dctx.drawImage @offscreen, -centre, -centre
    dctx.restore();

  animate: (time) =>
    return if not @animating
    if @lastAnimationTime
      step = @look.animationStep * 0.00024 * (time-@lastAnimationTime)
      @animationOffset = (@animationOffset+step) % (2*Math.PI)
    @lastAnimationTime = time
    @render()
    window.requestAnimationFrame @animate

class Braid

  throwDir: (h) -> h * 2 - 1

  throwing: ->
    [@look.height(@orbit.n), @look.duration(@orbit.n), @throwDir(@orbit.hand)]

  drawCurve: (ctx) ->    
    offset = @borderOffset @look.lineWidth, @look.borderWidth

    ctx.setLineDash [0, offset+20, 100000] #+20 to fix dash at beginning of line in Safari
    ctx.lineDashOffset = 20
    ctx.strokeStyle = @look.background
    ctx.lineWidth = @look.lineWidth+2*@look.borderWidth
    ctx.lineCap = 'butt'
    ctx.stroke()
    
    ctx.setLineDash []
    ctx.strokeStyle = @color
    ctx.lineWidth = @look.lineWidth
    ctx.lineCap = 'round'
    ctx.stroke()

  deg: (rad) -> rad * 180 / Math.PI

  borderOffset: (w, bdr) ->
    return 0 if not @catchAngle? or isNaN @catchAngle
    theta = Math.abs @catchAngle - @throwAngle
    theta = 2*Math.PI - theta if theta > Math.PI
    s = theta/2
    a = w/2
    b = @look.cornerTweak * w + a / Math.tan s
    e = bdr / Math.tan theta
    if theta > Math.PI/2 then b else b + e


class LinearBraid extends Braid

  constructor: (@orbit, @look, @handSeparation, @color) ->
    @orbit.resetCycle()
    @drawnTo = @look.duration @orbit.beat

  curve: (ctx) ->
    ctx.beginPath()
    [h, d, @v] = @throwing()
    throwX = @drawnTo
    throwY = @handSeparation/2*@v
    ctx.moveTo throwX, throwY
    peakX = throwX+d/2 
    peakY = throwY+@v*h
    ctrlD = d*@look.smoothing/2
    ctrl1X = peakX - ctrlD
    ctrl1Y = peakY
    @throwAngle = Math.atan2 ctrl1X-throwX, ctrl1Y-throwY
    ctx.bezierCurveTo throwX, throwY, ctrl1X, ctrl1Y, peakX, peakY
    landX = throwX+d
    landY = @handSeparation/2 * @throwDir @orbit.nextHand()
    ctrl2X = peakX + ctrlD
    ctrl2Y = peakY
    @catchAngle = @lastCatchAngle
    @lastCatchAngle = Math.atan2 ctrl2X-landX, ctrl2Y-landY
    ctx.bezierCurveTo ctrl2X, ctrl2Y, landX, landY, landX, landY
    @orbit.advance()
    @drawnTo = @look.duration @orbit.beat
    @drawCurve ctx


class PeakDot extends Braid

  constructor: (@orbit, @look, @handSeparation, @color) ->
    @orbit.resetCycle()
    @drawnTo = @look.duration @orbit.beat

  curve: (ctx) ->
    [h, d, @v] = @throwing()
    peakX = @drawnTo+d/2
    peakY = @v*(@handSeparation/2+h)
    ctx.beginPath()
    ctx.arc peakX, peakY, @look.lineWidth+@look.borderWidth, 0, 2*Math.PI
    ctx.closePath()
    ctx.fillStyle = @look.background
    ctx.fill()
    ctx.beginPath()
    ctx.arc peakX, peakY, @look.lineWidth, 0, 2*Math.PI
    ctx.closePath()
    ctx.fillStyle = @color
    ctx.fill()
    @orbit.advance()
    @drawnTo = @look.duration @orbit.beat


cartesian = (r, theta) -> 
    if r > 0
      [r * Math.cos(theta), r * Math.sin(theta)]
    else
      [-r * Math.cos(theta+Math.PI), -r * Math.sin(theta+Math.PI)]


class CircularBraid extends Braid

  constructor: (@orbit, @look, @handSeparation, @color, @radius, @ticks, @maxThrow) ->
    @orbit.resetCycle()
    @drawnTo = @orbit.beat
    @end = @orbit.beat + @ticks

  angle: (tick) -> tick / @ticks * 2 * Math.PI

  ctrlRadius: (r, t) -> r / Math.cos(t)

  innerCorrected: (n) ->
    # visually correct for inwards vs outwards curvature
    correction = @radius*(1-Math.cos @angle n/2) 
    -(correction + @look.height n)

  throwHeight: ->
    if @throwDir(@orbit.hand) is 1
      @look.height @orbit.n
    else
      maxH = Math.abs @innerCorrected @maxThrow
      if maxH > @radius
        @radius/maxH * @innerCorrected @orbit.n
      else
        @innerCorrected @orbit.n

  curve: (ctx) ->
    @throwCurve ctx
    @catchCurve ctx
    @drawCurve ctx
    @orbit.advance()
    @drawnTo = @orbit.beat

  finishBraid: (ctx) ->
    @throwCurve ctx
    @catchAngle = @lastCatchAngle
    @drawCurve ctx

  throwCurve: (ctx) ->
    ctx.beginPath()
    @theta = @angle @orbit.beat
    @throwR = @radius + @handSeparation/2*@throwDir(@orbit.hand)
    @dr = @throwHeight()
    @dt = @angle @orbit.n/2
    [throwX, throwY] = cartesian @throwR, @theta
    ctx.moveTo throwX, throwY    
    [peakX, peakY] = cartesian @throwR+@dr, @theta+@dt
    @ctrlR = @ctrlRadius @throwR+@dr, @dt*@look.smoothing/2
    [ctrl1X, ctrl1Y] = cartesian @ctrlR, @theta+@dt-@dt*(@look.smoothing/2)
    @throwAngle = Math.atan2 ctrl1X-throwX, ctrl1Y-throwY
    ctx.bezierCurveTo throwX, throwY, ctrl1X, ctrl1Y, peakX, peakY

  catchCurve: (ctx) ->
    catchR = @radius + @handSeparation/2*@throwDir(@orbit.nextHand())
    [landX, landY] = cartesian catchR, @theta+2*@dt
    [ctrl2X, ctrl2Y] = cartesian @ctrlR, @theta+@dt+@dt*(@look.smoothing/2)
    @catchAngle = @lastCatchAngle
    @lastCatchAngle = Math.atan2 ctrl2X-landX, ctrl2Y-landY
    ctx.bezierCurveTo ctrl2X, ctrl2Y, landX, landY, landX, landY


module.exports = 
  Canvas : Canvas


