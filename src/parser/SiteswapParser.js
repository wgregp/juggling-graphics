// Generated from Siteswap.g4 by ANTLR 4.5
// jshint ignore: start
var antlr4 = require('./antlr4/index.js');
var SiteswapListener = require('./SiteswapListener').SiteswapListener;
var SiteswapVisitor = require('./SiteswapVisitor').SiteswapVisitor;

var grammarFileName = "Siteswap.g4";

var serializedATN = ["\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd",
    "\3\fH\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\3\2\6\2\16\n\2\r\2\16",
    "\2\17\3\2\6\2\23\n\2\r\2\16\2\24\3\2\3\2\5\2\31\n\2\3\3\3\3\6\3\35\n",
    "\3\r\3\16\3\36\3\3\3\3\3\3\6\3$\n\3\r\3\16\3%\3\3\3\3\3\3\5\3+\n\3\3",
    "\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\5\4:\n\4\3\5\3\5",
    "\3\6\3\6\6\6@\n\6\r\6\16\6A\3\6\3\6\5\6F\n\6\3\6\2\2\7\2\4\6\b\n\2\2",
    "M\2\30\3\2\2\2\4*\3\2\2\2\69\3\2\2\2\b;\3\2\2\2\nE\3\2\2\2\f\16\5\4",
    "\3\2\r\f\3\2\2\2\16\17\3\2\2\2\17\r\3\2\2\2\17\20\3\2\2\2\20\31\3\2",
    "\2\2\21\23\5\4\3\2\22\21\3\2\2\2\23\24\3\2\2\2\24\22\3\2\2\2\24\25\3",
    "\2\2\2\25\26\3\2\2\2\26\27\7\3\2\2\27\31\3\2\2\2\30\r\3\2\2\2\30\22",
    "\3\2\2\2\31\3\3\2\2\2\32\35\5\6\4\2\33\35\5\b\5\2\34\32\3\2\2\2\34\33",
    "\3\2\2\2\35\36\3\2\2\2\36\34\3\2\2\2\36\37\3\2\2\2\37+\3\2\2\2 #\7\4",
    "\2\2!$\5\6\4\2\"$\5\b\5\2#!\3\2\2\2#\"\3\2\2\2$%\3\2\2\2%#\3\2\2\2%",
    "&\3\2\2\2&\'\3\2\2\2\'(\7\13\2\2()\7\5\2\2)+\3\2\2\2*\34\3\2\2\2* \3",
    "\2\2\2+\5\3\2\2\2,-\7\4\2\2-.\5\n\6\2./\7\6\2\2/\60\5\n\6\2\60\61\7",
    "\5\2\2\61:\3\2\2\2\62\63\7\4\2\2\63\64\5\n\6\2\64\65\7\6\2\2\65\66\5",
    "\n\6\2\66\67\7\5\2\2\678\7\7\2\28:\3\2\2\29,\3\2\2\29\62\3\2\2\2:\7",
    "\3\2\2\2;<\5\n\6\2<\t\3\2\2\2=?\7\b\2\2>@\7\n\2\2?>\3\2\2\2@A\3\2\2",
    "\2A?\3\2\2\2AB\3\2\2\2BC\3\2\2\2CF\7\t\2\2DF\7\n\2\2E=\3\2\2\2ED\3\2",
    "\2\2F\13\3\2\2\2\r\17\24\30\34\36#%*9AE"].join("");


var atn = new antlr4.atn.ATNDeserializer().deserialize(serializedATN);

var decisionsToDFA = atn.decisionToState.map( function(ds, index) { return new antlr4.dfa.DFA(ds, index); });

var sharedContextCache = new antlr4.PredictionContextCache();

var literalNames = [ 'null', "'*'", "'('", "')'", "','", "'!'", "'['", "']'" ];

var symbolicNames = [ 'null', 'null', 'null', 'null', 'null', 'null', 'null', 
                      'null', "THROW_NUMBER", "REPETITION", "WS" ];

var ruleNames =  [ "pattern", "beatSpec", "syncThrow", "asyncThrow", "thrown" ];

function SiteswapParser (input) {
	antlr4.Parser.call(this, input);
    this._interp = new antlr4.atn.ParserATNSimulator(this, atn, decisionsToDFA, sharedContextCache);
    this.ruleNames = ruleNames;
    this.literalNames = literalNames;
    this.symbolicNames = symbolicNames;
    return this;
}

SiteswapParser.prototype = Object.create(antlr4.Parser.prototype);
SiteswapParser.prototype.constructor = SiteswapParser;

Object.defineProperty(SiteswapParser.prototype, "atn", {
	get : function() {
		return atn;
	}
});

SiteswapParser.EOF = antlr4.Token.EOF;
SiteswapParser.T__0 = 1;
SiteswapParser.T__1 = 2;
SiteswapParser.T__2 = 3;
SiteswapParser.T__3 = 4;
SiteswapParser.T__4 = 5;
SiteswapParser.T__5 = 6;
SiteswapParser.T__6 = 7;
SiteswapParser.THROW_NUMBER = 8;
SiteswapParser.REPETITION = 9;
SiteswapParser.WS = 10;

SiteswapParser.RULE_pattern = 0;
SiteswapParser.RULE_beatSpec = 1;
SiteswapParser.RULE_syncThrow = 2;
SiteswapParser.RULE_asyncThrow = 3;
SiteswapParser.RULE_thrown = 4;

function PatternContext(parser, parent, invokingState) {
	if(parent===undefined) {
	    parent = null;
	}
	if(invokingState===undefined || invokingState===null) {
		invokingState = -1;
	}
	antlr4.ParserRuleContext.call(this, parent, invokingState);
    this.parser = parser;
    this.ruleIndex = SiteswapParser.RULE_pattern;
    return this;
}

PatternContext.prototype = Object.create(antlr4.ParserRuleContext.prototype);
PatternContext.prototype.constructor = PatternContext;


 
PatternContext.prototype.copyFrom = function(ctx) {
    antlr4.ParserRuleContext.prototype.copyFrom.call(this, ctx);
};


function SinglePatternContext(parser, ctx) {
	PatternContext.call(this, parser);
    PatternContext.prototype.copyFrom.call(this, ctx);
    return this;
}

SinglePatternContext.prototype = Object.create(PatternContext.prototype);
SinglePatternContext.prototype.constructor = SinglePatternContext;

SiteswapParser.SinglePatternContext = SinglePatternContext;

SinglePatternContext.prototype.beatSpec = function(i) {
    if(i===undefined) {
        i = null;
    }
    if(i===null) {
        return this.getTypedRuleContexts(BeatSpecContext);
    } else {
        return this.getTypedRuleContext(BeatSpecContext,i);
    }
};
SinglePatternContext.prototype.enterRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.enterSinglePattern(this);
	}
};

SinglePatternContext.prototype.exitRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.exitSinglePattern(this);
	}
};

SinglePatternContext.prototype.accept = function(visitor) {
    if ( visitor instanceof SiteswapVisitor ) {
        return visitor.visitSinglePattern(this);
    } else {
        return visitor.visitChildren(this);
    }
};


function MirroredPatternContext(parser, ctx) {
	PatternContext.call(this, parser);
    PatternContext.prototype.copyFrom.call(this, ctx);
    return this;
}

MirroredPatternContext.prototype = Object.create(PatternContext.prototype);
MirroredPatternContext.prototype.constructor = MirroredPatternContext;

SiteswapParser.MirroredPatternContext = MirroredPatternContext;

MirroredPatternContext.prototype.beatSpec = function(i) {
    if(i===undefined) {
        i = null;
    }
    if(i===null) {
        return this.getTypedRuleContexts(BeatSpecContext);
    } else {
        return this.getTypedRuleContext(BeatSpecContext,i);
    }
};
MirroredPatternContext.prototype.enterRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.enterMirroredPattern(this);
	}
};

MirroredPatternContext.prototype.exitRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.exitMirroredPattern(this);
	}
};

MirroredPatternContext.prototype.accept = function(visitor) {
    if ( visitor instanceof SiteswapVisitor ) {
        return visitor.visitMirroredPattern(this);
    } else {
        return visitor.visitChildren(this);
    }
};



SiteswapParser.PatternContext = PatternContext;

SiteswapParser.prototype.pattern = function() {

    var localctx = new PatternContext(this, this._ctx, this.state);
    this.enterRule(localctx, 0, SiteswapParser.RULE_pattern);
    var _la = 0; // Token type
    try {
        this.state = 22;
        var la_ = this._interp.adaptivePredict(this._input,2,this._ctx);
        switch(la_) {
        case 1:
            localctx = new SinglePatternContext(this, localctx);
            this.enterOuterAlt(localctx, 1);
            this.state = 11; 
            this._errHandler.sync(this);
            _la = this._input.LA(1);
            do {
                this.state = 10;
                this.beatSpec();
                this.state = 13; 
                this._errHandler.sync(this);
                _la = this._input.LA(1);
            } while((((_la) & ~0x1f) == 0 && ((1 << _la) & ((1 << SiteswapParser.T__1) | (1 << SiteswapParser.T__5) | (1 << SiteswapParser.THROW_NUMBER))) !== 0));
            break;

        case 2:
            localctx = new MirroredPatternContext(this, localctx);
            this.enterOuterAlt(localctx, 2);
            this.state = 16; 
            this._errHandler.sync(this);
            _la = this._input.LA(1);
            do {
                this.state = 15;
                this.beatSpec();
                this.state = 18; 
                this._errHandler.sync(this);
                _la = this._input.LA(1);
            } while((((_la) & ~0x1f) == 0 && ((1 << _la) & ((1 << SiteswapParser.T__1) | (1 << SiteswapParser.T__5) | (1 << SiteswapParser.THROW_NUMBER))) !== 0));
            this.state = 20;
            this.match(SiteswapParser.T__0);
            break;

        }
    } catch (re) {
    	if(re instanceof antlr4.error.RecognitionException) {
	        localctx.exception = re;
	        this._errHandler.reportError(this, re);
	        this._errHandler.recover(this, re);
	    } else {
	    	throw re;
	    }
    } finally {
        this.exitRule();
    }
    return localctx;
};

function BeatSpecContext(parser, parent, invokingState) {
	if(parent===undefined) {
	    parent = null;
	}
	if(invokingState===undefined || invokingState===null) {
		invokingState = -1;
	}
	antlr4.ParserRuleContext.call(this, parent, invokingState);
    this.parser = parser;
    this.ruleIndex = SiteswapParser.RULE_beatSpec;
    return this;
}

BeatSpecContext.prototype = Object.create(antlr4.ParserRuleContext.prototype);
BeatSpecContext.prototype.constructor = BeatSpecContext;


 
BeatSpecContext.prototype.copyFrom = function(ctx) {
    antlr4.ParserRuleContext.prototype.copyFrom.call(this, ctx);
};


function SingleBeatContext(parser, ctx) {
	BeatSpecContext.call(this, parser);
    BeatSpecContext.prototype.copyFrom.call(this, ctx);
    return this;
}

SingleBeatContext.prototype = Object.create(BeatSpecContext.prototype);
SingleBeatContext.prototype.constructor = SingleBeatContext;

SiteswapParser.SingleBeatContext = SingleBeatContext;

SingleBeatContext.prototype.syncThrow = function(i) {
    if(i===undefined) {
        i = null;
    }
    if(i===null) {
        return this.getTypedRuleContexts(SyncThrowContext);
    } else {
        return this.getTypedRuleContext(SyncThrowContext,i);
    }
};

SingleBeatContext.prototype.asyncThrow = function(i) {
    if(i===undefined) {
        i = null;
    }
    if(i===null) {
        return this.getTypedRuleContexts(AsyncThrowContext);
    } else {
        return this.getTypedRuleContext(AsyncThrowContext,i);
    }
};
SingleBeatContext.prototype.enterRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.enterSingleBeat(this);
	}
};

SingleBeatContext.prototype.exitRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.exitSingleBeat(this);
	}
};

SingleBeatContext.prototype.accept = function(visitor) {
    if ( visitor instanceof SiteswapVisitor ) {
        return visitor.visitSingleBeat(this);
    } else {
        return visitor.visitChildren(this);
    }
};


function RepeatedBeatContext(parser, ctx) {
	BeatSpecContext.call(this, parser);
    BeatSpecContext.prototype.copyFrom.call(this, ctx);
    return this;
}

RepeatedBeatContext.prototype = Object.create(BeatSpecContext.prototype);
RepeatedBeatContext.prototype.constructor = RepeatedBeatContext;

SiteswapParser.RepeatedBeatContext = RepeatedBeatContext;

RepeatedBeatContext.prototype.REPETITION = function() {
    return this.getToken(SiteswapParser.REPETITION, 0);
};

RepeatedBeatContext.prototype.syncThrow = function(i) {
    if(i===undefined) {
        i = null;
    }
    if(i===null) {
        return this.getTypedRuleContexts(SyncThrowContext);
    } else {
        return this.getTypedRuleContext(SyncThrowContext,i);
    }
};

RepeatedBeatContext.prototype.asyncThrow = function(i) {
    if(i===undefined) {
        i = null;
    }
    if(i===null) {
        return this.getTypedRuleContexts(AsyncThrowContext);
    } else {
        return this.getTypedRuleContext(AsyncThrowContext,i);
    }
};
RepeatedBeatContext.prototype.enterRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.enterRepeatedBeat(this);
	}
};

RepeatedBeatContext.prototype.exitRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.exitRepeatedBeat(this);
	}
};

RepeatedBeatContext.prototype.accept = function(visitor) {
    if ( visitor instanceof SiteswapVisitor ) {
        return visitor.visitRepeatedBeat(this);
    } else {
        return visitor.visitChildren(this);
    }
};



SiteswapParser.BeatSpecContext = BeatSpecContext;

SiteswapParser.prototype.beatSpec = function() {

    var localctx = new BeatSpecContext(this, this._ctx, this.state);
    this.enterRule(localctx, 2, SiteswapParser.RULE_beatSpec);
    var _la = 0; // Token type
    try {
        this.state = 40;
        var la_ = this._interp.adaptivePredict(this._input,7,this._ctx);
        switch(la_) {
        case 1:
            localctx = new SingleBeatContext(this, localctx);
            this.enterOuterAlt(localctx, 1);
            this.state = 26; 
            this._errHandler.sync(this);
            var _alt = 1;
            do {
            	switch (_alt) {
            	case 1:
            		this.state = 26;
            		switch(this._input.LA(1)) {
            		case SiteswapParser.T__1:
            		    this.state = 24;
            		    this.syncThrow();
            		    break;
            		case SiteswapParser.T__5:
            		case SiteswapParser.THROW_NUMBER:
            		    this.state = 25;
            		    this.asyncThrow();
            		    break;
            		default:
            		    throw new antlr4.error.NoViableAltException(this);
            		}
            		break;
            	default:
            		throw new antlr4.error.NoViableAltException(this);
            	}
            	this.state = 28; 
            	this._errHandler.sync(this);
            	_alt = this._interp.adaptivePredict(this._input,4, this._ctx);
            } while ( _alt!=2 && _alt!=antlr4.atn.ATN.INVALID_ALT_NUMBER );
            break;

        case 2:
            localctx = new RepeatedBeatContext(this, localctx);
            this.enterOuterAlt(localctx, 2);
            this.state = 30;
            this.match(SiteswapParser.T__1);
            this.state = 33; 
            this._errHandler.sync(this);
            _la = this._input.LA(1);
            do {
                this.state = 33;
                switch(this._input.LA(1)) {
                case SiteswapParser.T__1:
                    this.state = 31;
                    this.syncThrow();
                    break;
                case SiteswapParser.T__5:
                case SiteswapParser.THROW_NUMBER:
                    this.state = 32;
                    this.asyncThrow();
                    break;
                default:
                    throw new antlr4.error.NoViableAltException(this);
                }
                this.state = 35; 
                this._errHandler.sync(this);
                _la = this._input.LA(1);
            } while((((_la) & ~0x1f) == 0 && ((1 << _la) & ((1 << SiteswapParser.T__1) | (1 << SiteswapParser.T__5) | (1 << SiteswapParser.THROW_NUMBER))) !== 0));
            this.state = 37;
            this.match(SiteswapParser.REPETITION);
            this.state = 38;
            this.match(SiteswapParser.T__2);
            break;

        }
    } catch (re) {
    	if(re instanceof antlr4.error.RecognitionException) {
	        localctx.exception = re;
	        this._errHandler.reportError(this, re);
	        this._errHandler.recover(this, re);
	    } else {
	    	throw re;
	    }
    } finally {
        this.exitRule();
    }
    return localctx;
};

function SyncThrowContext(parser, parent, invokingState) {
	if(parent===undefined) {
	    parent = null;
	}
	if(invokingState===undefined || invokingState===null) {
		invokingState = -1;
	}
	antlr4.ParserRuleContext.call(this, parent, invokingState);
    this.parser = parser;
    this.ruleIndex = SiteswapParser.RULE_syncThrow;
    return this;
}

SyncThrowContext.prototype = Object.create(antlr4.ParserRuleContext.prototype);
SyncThrowContext.prototype.constructor = SyncThrowContext;


 
SyncThrowContext.prototype.copyFrom = function(ctx) {
    antlr4.ParserRuleContext.prototype.copyFrom.call(this, ctx);
};


function SyncFastContext(parser, ctx) {
	SyncThrowContext.call(this, parser);
    SyncThrowContext.prototype.copyFrom.call(this, ctx);
    return this;
}

SyncFastContext.prototype = Object.create(SyncThrowContext.prototype);
SyncFastContext.prototype.constructor = SyncFastContext;

SiteswapParser.SyncFastContext = SyncFastContext;

SyncFastContext.prototype.thrown = function(i) {
    if(i===undefined) {
        i = null;
    }
    if(i===null) {
        return this.getTypedRuleContexts(ThrownContext);
    } else {
        return this.getTypedRuleContext(ThrownContext,i);
    }
};
SyncFastContext.prototype.enterRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.enterSyncFast(this);
	}
};

SyncFastContext.prototype.exitRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.exitSyncFast(this);
	}
};

SyncFastContext.prototype.accept = function(visitor) {
    if ( visitor instanceof SiteswapVisitor ) {
        return visitor.visitSyncFast(this);
    } else {
        return visitor.visitChildren(this);
    }
};


function SyncContext(parser, ctx) {
	SyncThrowContext.call(this, parser);
    SyncThrowContext.prototype.copyFrom.call(this, ctx);
    return this;
}

SyncContext.prototype = Object.create(SyncThrowContext.prototype);
SyncContext.prototype.constructor = SyncContext;

SiteswapParser.SyncContext = SyncContext;

SyncContext.prototype.thrown = function(i) {
    if(i===undefined) {
        i = null;
    }
    if(i===null) {
        return this.getTypedRuleContexts(ThrownContext);
    } else {
        return this.getTypedRuleContext(ThrownContext,i);
    }
};
SyncContext.prototype.enterRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.enterSync(this);
	}
};

SyncContext.prototype.exitRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.exitSync(this);
	}
};

SyncContext.prototype.accept = function(visitor) {
    if ( visitor instanceof SiteswapVisitor ) {
        return visitor.visitSync(this);
    } else {
        return visitor.visitChildren(this);
    }
};



SiteswapParser.SyncThrowContext = SyncThrowContext;

SiteswapParser.prototype.syncThrow = function() {

    var localctx = new SyncThrowContext(this, this._ctx, this.state);
    this.enterRule(localctx, 4, SiteswapParser.RULE_syncThrow);
    try {
        this.state = 55;
        var la_ = this._interp.adaptivePredict(this._input,8,this._ctx);
        switch(la_) {
        case 1:
            localctx = new SyncContext(this, localctx);
            this.enterOuterAlt(localctx, 1);
            this.state = 42;
            this.match(SiteswapParser.T__1);
            this.state = 43;
            this.thrown();
            this.state = 44;
            this.match(SiteswapParser.T__3);
            this.state = 45;
            this.thrown();
            this.state = 46;
            this.match(SiteswapParser.T__2);
            break;

        case 2:
            localctx = new SyncFastContext(this, localctx);
            this.enterOuterAlt(localctx, 2);
            this.state = 48;
            this.match(SiteswapParser.T__1);
            this.state = 49;
            this.thrown();
            this.state = 50;
            this.match(SiteswapParser.T__3);
            this.state = 51;
            this.thrown();
            this.state = 52;
            this.match(SiteswapParser.T__2);
            this.state = 53;
            this.match(SiteswapParser.T__4);
            break;

        }
    } catch (re) {
    	if(re instanceof antlr4.error.RecognitionException) {
	        localctx.exception = re;
	        this._errHandler.reportError(this, re);
	        this._errHandler.recover(this, re);
	    } else {
	    	throw re;
	    }
    } finally {
        this.exitRule();
    }
    return localctx;
};

function AsyncThrowContext(parser, parent, invokingState) {
	if(parent===undefined) {
	    parent = null;
	}
	if(invokingState===undefined || invokingState===null) {
		invokingState = -1;
	}
	antlr4.ParserRuleContext.call(this, parent, invokingState);
    this.parser = parser;
    this.ruleIndex = SiteswapParser.RULE_asyncThrow;
    return this;
}

AsyncThrowContext.prototype = Object.create(antlr4.ParserRuleContext.prototype);
AsyncThrowContext.prototype.constructor = AsyncThrowContext;

AsyncThrowContext.prototype.thrown = function() {
    return this.getTypedRuleContext(ThrownContext,0);
};

AsyncThrowContext.prototype.enterRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.enterAsyncThrow(this);
	}
};

AsyncThrowContext.prototype.exitRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.exitAsyncThrow(this);
	}
};

AsyncThrowContext.prototype.accept = function(visitor) {
    if ( visitor instanceof SiteswapVisitor ) {
        return visitor.visitAsyncThrow(this);
    } else {
        return visitor.visitChildren(this);
    }
};




SiteswapParser.AsyncThrowContext = AsyncThrowContext;

SiteswapParser.prototype.asyncThrow = function() {

    var localctx = new AsyncThrowContext(this, this._ctx, this.state);
    this.enterRule(localctx, 6, SiteswapParser.RULE_asyncThrow);
    try {
        this.enterOuterAlt(localctx, 1);
        this.state = 57;
        this.thrown();
    } catch (re) {
    	if(re instanceof antlr4.error.RecognitionException) {
	        localctx.exception = re;
	        this._errHandler.reportError(this, re);
	        this._errHandler.recover(this, re);
	    } else {
	    	throw re;
	    }
    } finally {
        this.exitRule();
    }
    return localctx;
};

function ThrownContext(parser, parent, invokingState) {
	if(parent===undefined) {
	    parent = null;
	}
	if(invokingState===undefined || invokingState===null) {
		invokingState = -1;
	}
	antlr4.ParserRuleContext.call(this, parent, invokingState);
    this.parser = parser;
    this.ruleIndex = SiteswapParser.RULE_thrown;
    return this;
}

ThrownContext.prototype = Object.create(antlr4.ParserRuleContext.prototype);
ThrownContext.prototype.constructor = ThrownContext;


 
ThrownContext.prototype.copyFrom = function(ctx) {
    antlr4.ParserRuleContext.prototype.copyFrom.call(this, ctx);
};


function SingleContext(parser, ctx) {
	ThrownContext.call(this, parser);
    ThrownContext.prototype.copyFrom.call(this, ctx);
    return this;
}

SingleContext.prototype = Object.create(ThrownContext.prototype);
SingleContext.prototype.constructor = SingleContext;

SiteswapParser.SingleContext = SingleContext;

SingleContext.prototype.THROW_NUMBER = function() {
    return this.getToken(SiteswapParser.THROW_NUMBER, 0);
};
SingleContext.prototype.enterRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.enterSingle(this);
	}
};

SingleContext.prototype.exitRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.exitSingle(this);
	}
};

SingleContext.prototype.accept = function(visitor) {
    if ( visitor instanceof SiteswapVisitor ) {
        return visitor.visitSingle(this);
    } else {
        return visitor.visitChildren(this);
    }
};


function MultiplexContext(parser, ctx) {
	ThrownContext.call(this, parser);
    ThrownContext.prototype.copyFrom.call(this, ctx);
    return this;
}

MultiplexContext.prototype = Object.create(ThrownContext.prototype);
MultiplexContext.prototype.constructor = MultiplexContext;

SiteswapParser.MultiplexContext = MultiplexContext;

MultiplexContext.prototype.THROW_NUMBER = function(i) {
	if(i===undefined) {
		i = null;
	}
    if(i===null) {
        return this.getTokens(SiteswapParser.THROW_NUMBER);
    } else {
        return this.getToken(SiteswapParser.THROW_NUMBER, i);
    }
};

MultiplexContext.prototype.enterRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.enterMultiplex(this);
	}
};

MultiplexContext.prototype.exitRule = function(listener) {
    if(listener instanceof SiteswapListener ) {
        listener.exitMultiplex(this);
	}
};

MultiplexContext.prototype.accept = function(visitor) {
    if ( visitor instanceof SiteswapVisitor ) {
        return visitor.visitMultiplex(this);
    } else {
        return visitor.visitChildren(this);
    }
};



SiteswapParser.ThrownContext = ThrownContext;

SiteswapParser.prototype.thrown = function() {

    var localctx = new ThrownContext(this, this._ctx, this.state);
    this.enterRule(localctx, 8, SiteswapParser.RULE_thrown);
    var _la = 0; // Token type
    try {
        this.state = 67;
        switch(this._input.LA(1)) {
        case SiteswapParser.T__5:
            localctx = new MultiplexContext(this, localctx);
            this.enterOuterAlt(localctx, 1);
            this.state = 59;
            this.match(SiteswapParser.T__5);
            this.state = 61; 
            this._errHandler.sync(this);
            _la = this._input.LA(1);
            do {
                this.state = 60;
                this.match(SiteswapParser.THROW_NUMBER);
                this.state = 63; 
                this._errHandler.sync(this);
                _la = this._input.LA(1);
            } while(_la===SiteswapParser.THROW_NUMBER);
            this.state = 65;
            this.match(SiteswapParser.T__6);
            break;
        case SiteswapParser.THROW_NUMBER:
            localctx = new SingleContext(this, localctx);
            this.enterOuterAlt(localctx, 2);
            this.state = 66;
            this.match(SiteswapParser.THROW_NUMBER);
            break;
        default:
            throw new antlr4.error.NoViableAltException(this);
        }
    } catch (re) {
    	if(re instanceof antlr4.error.RecognitionException) {
	        localctx.exception = re;
	        this._errHandler.reportError(this, re);
	        this._errHandler.recover(this, re);
	    } else {
	    	throw re;
	    }
    } finally {
        this.exitRule();
    }
    return localctx;
};


exports.SiteswapParser = SiteswapParser;
