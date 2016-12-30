THREE = require 'three'
require './lib/TrackballControls.js'

class Canvas3D

  constructor: (@parentName, @pattern, @look) ->
    @canvas = document.createElement 'canvas'
    @canvas.id = "#{@parentName}-canvas3D"
    w = Math.min 0.9*window.innerWidth, 800
    @canvas.width = w * window.devicePixelRatio
    @canvas.height = w * window.devicePixelRatio
    @canvas.style.width = "#{w}px"
    @canvas.style.height = "#{w}px"
    @geometry = @nested
    @wasAwake = false

  node: -> @canvas

  goDormant: -> window.cancelAnimationFrame @frameRequest if @frameRequest?

  wakeUp: -> @refresh()

  toNested: -> 
    @geometry = @nested
    @refresh()

  toSideBySide: ->
    @geometry = @sideBySide
    @refresh()

  initialize: ->
    @renderer = new THREE.WebGLRenderer
      canvas: @canvas
      antialias: true
      preserveDrawingBuffer: true
    @renderer.setClearColor '#f0f0f0'

  update: -> true

  refresh: ->
    start = Date.now()
    window.cancelAnimationFrame @frameRequest
    if not @renderer?
      @initialize()  
      @setScene()
      @controls = new THREE.TrackballControls @camera, @canvas
      @tubes = []
    @addOrbits()
    @render()
    console.log "refreshed in #{Date.now()-start} ms"

  render: =>
    @controls.update()
    @renderer.render @scene, @camera
    @frameRequest = window.requestAnimationFrame @render

  setScene: -> 
    @scene = new THREE.Scene
    @camera = new THREE.PerspectiveCamera 70, @canvas.width / @canvas.height, 0.1, 100000
    @camera.position.set 0, 0, 750
    light = new THREE.DirectionalLight 0xffffff, 0.7
    light.position.set 0, 0, 1
    @camera.add light
    @scene.add @camera
    @scene.add new THREE.AmbientLight 0x404040, 2

  addOrbits: ->
    @scene.remove tube for tube in @tubes
    @tubes = []
    return if not @pattern.valid
    @ticks = @pattern.period()*@look.cycles
    @radius = @look.duration(@ticks)/(2*Math.PI)
    for ix, orbit of @pattern.orbits
      curve = new THREE.Curve
      curve.getPoint = (t) =>
        tick = @ticks * t
        if tick < orbit.startBeat
          tick = tick + @ticks
          t = t + 1
        orbit.resetCycle()
        while not (orbit.beat <= tick and orbit.nextBeat() >= tick)
          orbit.advance()
        @geometry t, orbit.beat, orbit.n, orbit.hand, true
      g = new THREE.TubeGeometry curve, 512, @look.lineWidth/2, 32
      material = new THREE.MeshPhongMaterial(
        color: @look.color ix
        specular: '#333333'
        side: THREE.DoubleSide)
      tube = new THREE.Mesh g, material
      @scene.add tube
      @tubes.push tube

  nested: (t, startTick, n, hand, bothDirections=true) ->
    theta = 2* Math.PI * (1 - t)
    loops = @ticks / n
    r = @look.height n
    startAngle = 2*Math.PI * (1 - startTick / @ticks)
    if hand is 1 and bothDirections
      R = @radius + r
      phi = theta - startAngle + Math.PI / loops
    else
      R = @radius - r
      phi = -(theta - startAngle)
    x = (R + r * Math.cos(loops * phi)) * Math.cos(theta)
    y = (R + r * Math.cos(loops * phi)) * Math.sin(theta)
    z = r * Math.sin(loops * phi)
    new THREE.Vector3 x, y, z
 
  sideBySide: (t, startTick, n, hand, bothDirections=true) ->
    theta = 2* Math.PI * (1 - t)
    loops = @ticks / n
    r = @look.height n
    startAngle = 2*Math.PI * (1 - startTick / @ticks)
    if hand is 1 and bothDirections
      R = @radius 
      phi = theta - startAngle + Math.PI / loops / 2
      zOffset = -r
    else
      R = @radius
      phi = -(theta - startAngle - 3 * Math.PI / loops / 2)
      zOffset = r
    x = (R + r * Math.cos(loops * phi)) * Math.cos(theta)
    y = (R + r * Math.cos(loops * phi)) * Math.sin(theta)
    z = zOffset + r * Math.sin(loops * phi)
    new THREE.Vector3 x, y, z

module.exports =
  Canvas3D : Canvas3D

