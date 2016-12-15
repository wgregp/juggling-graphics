parser = require './parser.coffee'

# utility functions for computing least common multiples

# greatest common divisor 
gcd = (a, b) ->     
  [a, b] = [b, a % b] while b
  a

# least common multiple of two
lcm = (a, b) -> a * b / gcd(a, b)

# least common multiple of many, in an array
lcmm = (args) -> if args.length != 0 then args.reduce lcm


class Pattern

  constructor: ->
    @ss = ''
    @listeners = []
    @valid = false
  
  addListener: (listener) ->
    @listeners.push listener
    
  notify: ->
    listener.update() for listener in @listeners
    
  newSiteswap: (@ss) ->
    @valid = true # assume OK, set false on error
    @beats = parser.toBeats @ss
    @computeOrbits()
    @notify()
    
  computeOrbits: ->
    @orbits = []
    n = @nOrbits()
    if n % 1 < 0.0001 
      @orbits = (new Orbit(id) for id in [0...n])
      seive = new Seive @
      try
        seive.compute @orbits
      catch error
        @valid = false
        @error = error
    else 
      @valid = false
      @error = 'fractional number of objects'

  period: ->
    lcmm (orbit.period() for orbit in @orbits)

  throwNumbers: ->
    flat = []
    flat.push t.n for t in h for h in b for b in @beats
    flat
    
  maxThrow: ->
    @throwNumbers().reduce(((a, n) -> if n > a then n else a), 0)
  
  nOrbits: ->
    @sumOfThrows() / @beats.length

  sumOfThrows: ->
    @throwNumbers().reduce(((a, n) -> a + n), 0)    


class Orbit

  constructor: (@id) ->
    @setEmpty()

  setEmpty: ->
    @throws = []
    @complete = false
    @index = 0
    @startBeat = -1
    @startHand = -1

  toString: ->
    s = "@#{@id} (#{@startHand},#{@startBeat}) : "
    for thrown in @throws
      s = "#{s} #{thrown.text} "
    s = "#{s} complete" if @complete
    s

  resetCycle: ->
    if @throws.length > 0
      @index = 0
      @beat = @startBeat
      @hand = @startHand
      @n = @currentThrow().n
    else
      throw "trying to walk empty orbit"

  addThrow: (thrown, beat, hand) ->
    if @throws.length is 0
      @startBeat = beat
      @startHand = hand
    @throws.push thrown

  removeThrow: ->
    @throws.pop()

  repeatsAfter: (patternLength) ->
    @toSameHand() && @period() % patternLength == 0

  toSameHand: ->
    @throws.reduce ((a, v) -> if v.cross then not a else a), true

  period: ->
    @throws.reduce ((a, t) -> a += t.n), 0

  currentThrow: () ->
    @throws[@index]

  nextHand: ->
    (@hand + if @throws[@index].cross then 1 else 0) % 2

  nextBeat: ->
    @beat + @throws[@index].n

  nextIndex: ->
    (@index + 1) % @throws.length

  advance: ->
    @hand = @nextHand()
    @beat = @nextBeat()
    @index = @nextIndex()
    @n = @currentThrow().n


# The aim is to find orbits in order from shortest to longest. So, attempts
# all possible orbits of length 1, then 2, etc. Multiplexes complicate things
# a bit.
class Seive

  constructor: (@pattern) ->
    @makeSeive()

  makeSeive: ->
    str = JSON.stringify @pattern.beats
    @seive = JSON.parse str
    for [0...@pattern.sumOfThrows()]
      @seive = @seive.concat JSON.parse str

  logString: (beats) ->
    s = ("(#{@handString beat[0]},#{@handString beat[1]})" for beat in beats) 
    s.reduce ((x,y) -> x + y), ""

  handString: (hand) ->
    if not hand.length then '_' else hand.reduce ((t, thrown) -> t + thrown.text), ''

  compute: (@orbits) ->
    available = @orbits[..]
    orbitLength = 1
    while orbitLength <= @pattern.beats.length and available.length isnt 0
      startBeat = 0
      while startBeat < @pattern.maxThrow() and available.length isnt 0
        startHand = 0
        while startHand < 2 && available.length isnt 0
          @attemptOrbitFrom available, startBeat, startHand, orbitLength
          startHand++
        startBeat++
      orbitLength++
    if not @allOrbitsComplete()
      throw "could not complete all orbits"

  attemptOrbitFrom: (available, beat, hand, hops) ->
    for ix, thrown of @seive[beat][hand][..]
      return if available.length is 0
      orbit = available.shift()
      orbit.setEmpty()
      @extend orbit, thrown, beat, hand, hops-1
      if orbit.complete
        @sweep orbit
      else
        available.unshift orbit

  extend: (orbit, thrown, beat, hand, hops) ->
    orbit.addThrow thrown, beat, hand
    if hops is 0
      if orbit.repeatsAfter @pattern.beats.length
        orbit.complete = true
      return
    nextBeat = beat + thrown.n
    nextHand = (hand + if thrown.cross then 1 else 0) % 2
    if @seive[nextBeat][nextHand].length is 0
      h = if nextHand is 0 then 'left' else 'right'
      throw "collision in #{h} hand at beat #{nextBeat+1}"        
    for ix, thrown of @seive[nextBeat][nextHand][..]
      if not orbit.complete
        @extend orbit, thrown, nextBeat, nextHand, hops-1
      if not orbit.complete
        orbit.removeThrow()

  sweep: (orbit) ->
    orbit.resetCycle()
    while orbit.beat < @seive.length
      throws = @seive[orbit.beat][orbit.hand]
      @remove orbit, throws
      orbit.advance()
    orbit.resetCycle()

  remove: (orbit, throws) ->
    match = false
    tix = 0
    while tix < throws.length and not match
      toGo = orbit.currentThrow()
      if toGo.n is throws[tix].n and toGo.cross is throws[tix].cross
        match = true
      else
        tix++
    if match
      throws.splice tix, 1
    else
      throw 'sweeping, no match found (bug: this should never happen!)'

  allOrbitsComplete: ->
    for orbit in @orbits
      return false unless orbit.complete
    return true
  

module.exports = {
  Pattern : Pattern
}
