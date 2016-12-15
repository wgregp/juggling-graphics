/**
 * ANTLR 4 grammar for siteswaps.
 */
 
grammar Siteswap;

pattern: 
	  beatSpec+     #singlePattern
	| beatSpec+ '*' #mirroredPattern
	;

beatSpec: 
	  (syncThrow | asyncThrow)+						 #singleBeat
	| '(' (syncThrow | asyncThrow)+ REPETITION ')'   #repeatedBeat
	;
	
syncThrow: 
	  '(' thrown ',' thrown ')'      #sync
	| '(' thrown ',' thrown ')' '!'  #syncFast
	;
	
asyncThrow: thrown;
	
thrown: 
	  '[' THROW_NUMBER+ ']'          #multiplex
     | THROW_NUMBER                  #single
     ;
     
THROW_NUMBER : [0-9a-w]'x'?;

REPETITION : '^'[0-9]+ ;

WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
