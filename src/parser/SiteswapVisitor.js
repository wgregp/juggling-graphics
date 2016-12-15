// Generated from Siteswap.g4 by ANTLR 4.5
// jshint ignore: start
var antlr4 = require('./antlr4/index.js');

// This class defines a complete generic visitor for a parse tree produced by SiteswapParser.

function SiteswapVisitor() {
	antlr4.tree.ParseTreeVisitor.call(this);
	return this;
}

SiteswapVisitor.prototype = Object.create(antlr4.tree.ParseTreeVisitor.prototype);
SiteswapVisitor.prototype.constructor = SiteswapVisitor;

// Visit a parse tree produced by SiteswapParser#singlePattern.
SiteswapVisitor.prototype.visitSinglePattern = function(ctx) {
};


// Visit a parse tree produced by SiteswapParser#mirroredPattern.
SiteswapVisitor.prototype.visitMirroredPattern = function(ctx) {
};


// Visit a parse tree produced by SiteswapParser#singleBeat.
SiteswapVisitor.prototype.visitSingleBeat = function(ctx) {
};


// Visit a parse tree produced by SiteswapParser#repeatedBeat.
SiteswapVisitor.prototype.visitRepeatedBeat = function(ctx) {
};


// Visit a parse tree produced by SiteswapParser#sync.
SiteswapVisitor.prototype.visitSync = function(ctx) {
};


// Visit a parse tree produced by SiteswapParser#syncFast.
SiteswapVisitor.prototype.visitSyncFast = function(ctx) {
};


// Visit a parse tree produced by SiteswapParser#asyncThrow.
SiteswapVisitor.prototype.visitAsyncThrow = function(ctx) {
};


// Visit a parse tree produced by SiteswapParser#multiplex.
SiteswapVisitor.prototype.visitMultiplex = function(ctx) {
};


// Visit a parse tree produced by SiteswapParser#single.
SiteswapVisitor.prototype.visitSingle = function(ctx) {
};



exports.SiteswapVisitor = SiteswapVisitor;