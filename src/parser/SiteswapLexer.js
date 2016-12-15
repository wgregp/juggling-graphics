// Generated from Siteswap.g4 by ANTLR 4.5
// jshint ignore: start
var antlr4 = require('./antlr4/index.js');


var serializedATN = ["\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd",
    "\2\f\66\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b",
    "\4\t\t\t\4\n\t\n\4\13\t\13\3\2\3\2\3\3\3\3\3\4\3\4\3\5\3\5\3\6\3\6\3",
    "\7\3\7\3\b\3\b\3\t\3\t\5\t(\n\t\3\n\3\n\6\n,\n\n\r\n\16\n-\3\13\6\13",
    "\61\n\13\r\13\16\13\62\3\13\3\13\2\2\f\3\3\5\4\7\5\t\6\13\7\r\b\17\t",
    "\21\n\23\13\25\f\3\2\5\4\2\62;cy\3\2\62;\5\2\13\f\17\17\"\"8\2\3\3\2",
    "\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2",
    "\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\3\27\3\2\2\2\5\31",
    "\3\2\2\2\7\33\3\2\2\2\t\35\3\2\2\2\13\37\3\2\2\2\r!\3\2\2\2\17#\3\2",
    "\2\2\21%\3\2\2\2\23)\3\2\2\2\25\60\3\2\2\2\27\30\7,\2\2\30\4\3\2\2\2",
    "\31\32\7*\2\2\32\6\3\2\2\2\33\34\7+\2\2\34\b\3\2\2\2\35\36\7.\2\2\36",
    "\n\3\2\2\2\37 \7#\2\2 \f\3\2\2\2!\"\7]\2\2\"\16\3\2\2\2#$\7_\2\2$\20",
    "\3\2\2\2%\'\t\2\2\2&(\7z\2\2\'&\3\2\2\2\'(\3\2\2\2(\22\3\2\2\2)+\7`",
    "\2\2*,\t\3\2\2+*\3\2\2\2,-\3\2\2\2-+\3\2\2\2-.\3\2\2\2.\24\3\2\2\2/",
    "\61\t\4\2\2\60/\3\2\2\2\61\62\3\2\2\2\62\60\3\2\2\2\62\63\3\2\2\2\63",
    "\64\3\2\2\2\64\65\b\13\2\2\65\26\3\2\2\2\6\2\'-\62\3\b\2\2"].join("");


var atn = new antlr4.atn.ATNDeserializer().deserialize(serializedATN);

var decisionsToDFA = atn.decisionToState.map( function(ds, index) { return new antlr4.dfa.DFA(ds, index); });

function SiteswapLexer(input) {
	antlr4.Lexer.call(this, input);
    this._interp = new antlr4.atn.LexerATNSimulator(this, atn, decisionsToDFA, new antlr4.PredictionContextCache());
    return this;
}

SiteswapLexer.prototype = Object.create(antlr4.Lexer.prototype);
SiteswapLexer.prototype.constructor = SiteswapLexer;

SiteswapLexer.EOF = antlr4.Token.EOF;
SiteswapLexer.T__0 = 1;
SiteswapLexer.T__1 = 2;
SiteswapLexer.T__2 = 3;
SiteswapLexer.T__3 = 4;
SiteswapLexer.T__4 = 5;
SiteswapLexer.T__5 = 6;
SiteswapLexer.T__6 = 7;
SiteswapLexer.THROW_NUMBER = 8;
SiteswapLexer.REPETITION = 9;
SiteswapLexer.WS = 10;


SiteswapLexer.modeNames = [ "DEFAULT_MODE" ];

SiteswapLexer.literalNames = [ 'null', "'*'", "'('", "')'", "','", "'!'", 
                               "'['", "']'" ];

SiteswapLexer.symbolicNames = [ 'null', 'null', 'null', 'null', 'null', 
                                'null', 'null', 'null', "THROW_NUMBER", 
                                "REPETITION", "WS" ];

SiteswapLexer.ruleNames = [ "T__0", "T__1", "T__2", "T__3", "T__4", "T__5", 
                            "T__6", "THROW_NUMBER", "REPETITION", "WS" ];

SiteswapLexer.grammarFileName = "Siteswap.g4";



exports.SiteswapLexer = SiteswapLexer;

