aboutText = """<h1>juggling • graphics<br/>✾ a siteswap illustrator ✾</h1>

<p>juggling • graphics draws pictures of 
<a href="https://en.wikipedia.org/wiki/Siteswap">siteswaps</a>,
which represent throw and catch order in juggling patterns. 
You can enter most common notations for two-handed 
siteswaps, including synchronous and multiplex throws.</p>

<p>You don't need a network connection, just save a link or add it to your home screen 
(<a href="http://www.howtogeek.com/196087/how-to-add-websites-to-the-home-screen-on-any-smartphone-or-tablet/">instructions</a>).
</p>

<p>juggling • graphics is open source. If you're into that kind of thing, you can
 <a href="https://github.com/wgregp/juggling-graphics">see the code on GitHub</a>.<p>

<p>Design and programming by <a href="https://last3.in">Greg Phillips</a>. 
Linear and circular wave diagrams based on an idea by 
<a href="http://www.quatprops.com">Craig Quat</a>.</p>

<p class="privacy">juggling • graphics runs entirely in your browser; we do not 
collect or retain any information about you.</p>
"""

class AboutView

  constructor: (@parentName, @pattern, @look) ->
    @container = document.createElement 'div'
    @container.innerHTML = aboutText
    @container.id = 'about'
    @container.addEventListener 'click', @hide
    @hide()

  node: -> @container

  hide: => @container.style.display = 'none'

  show: => @container.style.display = 'block'

  toggle: => if @container.style.display =='none' then @show() else @hide()


class NerdView

  constructor: (@parentName, @pattern) ->
    @container = document.createElement 'div'
    @container.id = "#{@parentName}-nerdview"
    @container.classList.add 'nerdview'
    @update()

  node: -> @container

  para : (string, className) ->
    p = document.createElement 'p'
    p.appendChild document.createTextNode string
    if className? then p.classList.add className
    @container.appendChild p 
    
  update: ->
    @container.innerHTML = ''
    return if not @pattern.beats?.length
    @para "beats: #{@beatString()}"
    @para "max throw height: #{@pattern.maxThrow()}"
    @para "number of objects: #{@rounded(@pattern.nOrbits())}"
    if not @pattern.valid then @para "#{@pattern.error}", 'error'
    if @pattern.valid and @pattern.orbits.length > 0
      @para "total period: #{@pattern.period()}"
      @para "orbits: "
      @para(@orbit(orbit)) for orbit in @pattern.orbits
      
  hand: (hand)->
    if hand then 'R' else 'L'

  rounded: (n) ->
    Math.floor(n * 100)/100

  beatString: ->
    s = ("(#{@handString beat[0]},#{@handString beat[1]})" for beat in @pattern.beats) 
    s.reduce (x,y) -> x + y
    
  orbit: (orbit) ->
    if orbit.throws.length == 0 then '  not defined'
    else "   period #{orbit.period()} | #{@conciseOrbit(orbit.throws)} | #{@detailedOrbit(orbit)}"
        
  conciseOrbit: (throws) ->
    (t.text for t in throws).reduce (x,y) -> x+y

  detailedOrbit: (orbit) ->
    s = ""
    orbit.resetCycle()
    loop
      t = orbit.currentThrow()
      h = if orbit.hand then 'r' else 'l'
      c = if t.cross then "'" else ""
      s = s + "#{orbit.beat+1}#{h}:#{t.n}#{c}  "
      return s if orbit.nextIndex() <= orbit.index
      orbit.advance()
    
  handString: (hand) ->
    if not hand.length then '_' else hand.reduce ((t, thrown) -> t + thrown.text), ''
    
module.exports =
  AboutView: AboutView
  NerdView: NerdView
