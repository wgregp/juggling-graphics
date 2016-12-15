antlr4 = require './parser/antlr4/index.js'
SiteswapLexer = require './parser/SiteswapLexer.js'
SiteswapParser = require './parser/SiteswapParser.js'
SiteswapListener = require './parser/SiteswapListener.js'

class BeatBuilder extends SiteswapListener.SiteswapListener

  constructor: ->
    @beats = []
    @hand = 0
    @index = 0
    @values = {}

  nextHand: () ->
    @hand = (@hand + 1) % 2

  enterEveryRule: (ctx) ->
    ctx.nodeIndex = @index
    @index++

  # visitTerminal: (node) ->

  # enterSinglePattern: (ctx) ->
  #   console.log 'enterSinglePattern'

  exitSinglePattern: (ctx) ->
    @addMirroredBeats() if @beats.length % 2 == 1

  addMirroredBeats: ->
    @beats.push [@copyHand(ix, 1), @copyHand(ix, 0)] for ix in [0...@beats.length]

  copyHand: (ix, h) ->
    JSON.parse JSON.stringify @beats[ix][h]

  # enterMirroredPattern: (ctx) ->
  #   console.log 'enterMirroredPattern'

  exitMirroredPattern: (ctx) ->
    @addMirroredBeats()

  # enterSingleBeat: (ctx) ->
  #   console.log 'enterSingleBeat'

  # exitSingleBeat: (ctx) ->
  #   console.log 'exitSingleBeat'

  # enterRepeatedBeat: (ctx) ->
  #   console.log 'enterRepeatedBeat'

  # exitRepeatedBeat: (ctx) ->
  #   console.log 'exitRepeatedBeat'

  # enterSync: (ctx) ->
  #   console.log 'enterSync'

  exitSync: (ctx) ->
    @beats.push [ @values[ctx.thrown(0).nodeIndex],
      @values[ctx.thrown(1).nodeIndex]]
    @beats.push [[],[]] # no throw on beat after sync, don't change hands

  # enterSyncFast: (ctx) ->
  #   console.log 'enterSyncFast'

  exitSyncFast: (ctx) ->
    @beats.push [ @values[ctx.thrown(0).nodeIndex],
      @values[ctx.thrown(1).nodeIndex]]
    @nextHand() # throw immediately following a syncfast

  # enterAsyncThrow: (ctx) ->
  #   console.log 'enterAsyncThrow'

  exitAsyncThrow: (ctx) ->
    beat = [[],[]]
    beat[@hand] = @values[ctx.thrown().nodeIndex]
    @nextHand()
    @beats.push beat

  # enterMultiplex: (ctx) ->
  #   console.log 'enterMultiplex'

  exitMultiplex: (ctx) ->
    throws = []
    for n in ctx.THROW_NUMBER()
      t = @throwFrom n.getText()
      throws.push t unless t == null
    @values[ctx.nodeIndex] = throws

  # enterSingle: (ctx) ->
  #   console.log 'enterSingle'

  exitSingle: (ctx) ->
    t = @throwFrom ctx.getText()
    @values[ctx.nodeIndex] = if t == null then [] else [t]

  throwFrom: (str) ->
    n = parseInt str, 33
    if n == 0 then null else
      text: str
      n: n
      cross: (n % 2 == 0 and str.length == 2) or (n % 2 == 1 and str.length == 1)    
      

class SiteswapErrorListener extends antlr4.error.ErrorListener

  constructor: ->
    @errorEncountered = false
    
  syntaxError: ->
    @errorEncountered = true
    
    
exports.toBeats = (patternString) ->
  chars = new antlr4.InputStream patternString
  lexer = new SiteswapLexer.SiteswapLexer chars
  tokens  = new antlr4.CommonTokenStream lexer
  parser = new SiteswapParser.SiteswapParser tokens
  parser.removeErrorListeners()
  lexer.removeErrorListeners()
  ssel = new SiteswapErrorListener()
  parser.addErrorListener ssel
  lexer.addErrorListener ssel
  parser.buildParseTrees = true
  tree = parser.pattern()
  builder = new BeatBuilder()
  antlr4.tree.ParseTreeWalker.DEFAULT.walk builder, tree
  if ssel.errorEncountered then [] else builder.beats

