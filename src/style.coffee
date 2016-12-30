COLORS = [
  '#1f78b4'
  '#33a02c'
  '#e31a1c'
  '#6a3d9a'
  '#ff7f00'
  '#b15928'
  '#a6cee3'
  '#b2df8a'
  '#fb9a99'
  '#cab2d6'
  '#fdbf6f'
  '#ffff99'
]


LOOK_PROPERTIES = 
  sliders: [
    { name: 'cycles', min: 1, max: 10, step: 1, default: 1, label: 'Cycles'}
    { name: 'hands', min: 1, max: 6, step: 1, default: 2, label: 'Hands'}
    { name: 'dwell', min: 0, max: 1, step: 0.05, default: 0, label: 'Dwell ratio'}
    { name: 'gravity', min: 1, max: 3, step: 0.1, default: 1, label: 'Gravity'}
    { name: 'dx', min: 1 , max: 100, step: 1, default: 20, label: 'Spacing'}
    { name: 'dy', min: 1, max: 100, step: 1, default: 10, label: 'Peaks'}
    { name: 'smoothing', min: 0, max: 1, step: 0.1, default: 0.5, label: 'Smoothing'}
    { name: 'lineWidth', min: 1, max: 30, step: 1, default: 4, label: 'Line width'}
    { name: 'borderWidth', min: 0, max: 15, step: 0.5, default: 2, label: 'Gap width'}
    { name: 'handSeparation', min: 0, max: 2, step: 0.05, default: 0, label: 'Separation'}
    { name: 'cornerTweak', min: -1, max: 1, step: 0.05, default: 0, label: 'Corners'}
    { name: 'animationStep', min: 1, max: 20, step: 1, default: 5, label: 'Animation speed'}
   ]


class Look

  constructor: ->
    @listeners = []
    @background = '#ffffff'
    @colors = COLORS[..]
    @palette = COLORS[..].concat ['#ffffff', '#999999', '#000000']
 
  set: (name, value) ->
    if @[name] isnt value
      @[name] = value
      @notify()

  color: (ix) -> @colors[ix%@colors.length]

  setColor: (ix, color) -> 
    if @colors[ix] isnt color
      @colors[ix] = color
      @notify()

  addListener: (listener) ->
    @listeners.push listener
    
  notify: ->
    listener.update() for listener in @listeners[..]

  height: (n) ->
    # for prechac value of 1, 0 < dwell < 0.5, so divide by 2
    dwell = if n <= @hands/2 then @dwell/2 else @dwell
    Math.abs((n/@hands*2-dwell*2))**@gravity * @dy

  duration: (n) ->
    n * @dx


module.exports =
  Look: Look
  LOOK_PROPERTIES: LOOK_PROPERTIES
  COLORS: COLORS

