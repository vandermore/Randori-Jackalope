/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
parser grammar TypeScript;
import CommonLexerRules;
import JSLexerRules;

program
	: NEWLINE!* sourceElements NEWLINE!* EOF!
	;
	
sourceElements
	: sourceElement (NEWLINE!* sourceElement)*
	;
	
sourceElement
	: functionDeclaration
        | ambientDeclaration
	| statement
	;
	
//TypeScript
//*****************************************************************
//  TypeScript additions
//      - need to import JS into the TS grammar instead of putting here.
//*****************************************************************
ambientDeclaration
	: 'declare' ambientModuleDeclaration
	;
	
ambientModuleDeclaration
	: 'module' Identifier '{' NEWLINE!* ambientModuleBody NEWLINE!* '}'
	;
	
//TODO:: TESTING TEMPORARY until actual grammar is input.
ambientModuleBody
	: 'export' 'interface' Identifier ('extends' Identifier (',' Identifier)* )* NEWLINE!* '{' NEWLINE!* sourceElements NEWLINE!* '}'
	;


//JavaScript
//*****************************************************************
//  Since TypeScript is built on top of JS, we can use a JS
//      parser to parse the generic parts.
//*****************************************************************
/*
  Copyright 2008 Chris Lambrou.
  Edited for use with ANTRL4 - 2013 - David Moore
  Edited to include TypeScript info - 2013 - David Moore
  All rights reserved.
*/

// functions
functionDeclaration
	: 'function' NEWLINE!* Identifier NEWLINE!* formalParameterList NEWLINE!* functionBody
	;
	
functionExpression
	: 'function' NEWLINE!* Identifier? NEWLINE!* formalParameterList NEWLINE!* functionBody
	;
	
formalParameterList
	: '(' (NEWLINE!* Identifier (NEWLINE!* ',' NEWLINE!* Identifier)*)? NEWLINE!* ')'
	;

functionBody
	: '{' NEWLINE!* sourceElements NEWLINE!* '}'
	;

// statements
statement
	: statementBlock
	| variableStatement
	| emptyStatement
	| expressionStatement
	| ifStatement
	| iterationStatement
	| continueStatement
	| breakStatement
	| returnStatement
	| withStatement
	| labelledStatement
	| switchStatement
	| throwStatement
	| tryStatement
	;
	
statementBlock
	: '{' NEWLINE!* statementList? NEWLINE!* '}'
	;
	
statementList
	: statement (NEWLINE!* statement)*
	;
	
variableStatement
	: 'var' NEWLINE!* variableDeclarationList (NEWLINE | ';')!
	;
	
variableDeclarationList
	: variableDeclaration (NEWLINE!* ',' NEWLINE!* variableDeclaration)*
	;
	
variableDeclarationListNoIn
	: variableDeclarationNoIn (NEWLINE!* ',' NEWLINE!* variableDeclarationNoIn)*
	;
	
variableDeclaration
	: Identifier NEWLINE!* initialiser?
	;
	
variableDeclarationNoIn
	: Identifier NEWLINE!* initialiserNoIn?
	;
	
initialiser
	: '=' NEWLINE!* assignmentExpression
	;
	
initialiserNoIn
	: '=' NEWLINE!* assignmentExpressionNoIn
	;
	
emptyStatement
	: ';'
	;
	
expressionStatement
	: expression (NEWLINE | ';')!
	;
	
ifStatement
	: 'if' NEWLINE!* '(' NEWLINE!* expression NEWLINE!* ')' NEWLINE!* statement (NEWLINE!* 'else' NEWLINE!* statement)?
	;
	
iterationStatement
	: doWhileStatement
	| whileStatement
	| forStatement
	| forInStatement
	;
	
doWhileStatement
	: 'do' NEWLINE!* statement NEWLINE!* 'while' NEWLINE!* '(' expression ')' (NEWLINE | ';')!
	;
	
whileStatement
	: 'while' NEWLINE!* '(' NEWLINE!* expression NEWLINE!* ')' NEWLINE!* statement
	;
	
forStatement
	: 'for' NEWLINE!* '(' (NEWLINE!* forStatementInitialiserPart)? NEWLINE!* ';' (NEWLINE!* expression)? NEWLINE!* ';' (NEWLINE!* expression)? NEWLINE!* ')' NEWLINE!* statement
	;
	
forStatementInitialiserPart
	: expressionNoIn
	| 'var' NEWLINE!* variableDeclarationListNoIn
	;
	
forInStatement
	: 'for' NEWLINE!* '(' NEWLINE!* forInStatementInitialiserPart NEWLINE!* 'in' NEWLINE!* expression NEWLINE!* ')' NEWLINE!* statement
	;
	
forInStatementInitialiserPart
	: leftHandSideExpression
	| 'var' NEWLINE!* variableDeclarationNoIn
	;

continueStatement
	: 'continue' Identifier? (NEWLINE | ';')!
	;

breakStatement
	: 'break' Identifier? (NEWLINE | ';')!
	;

returnStatement
	: 'return' expression? (NEWLINE | ';')!
	;
	
withStatement
	: 'with' NEWLINE!* '(' NEWLINE!* expression NEWLINE!* ')' NEWLINE!* statement
	;

labelledStatement
	: Identifier NEWLINE!* ':' NEWLINE!* statement
	;
	
switchStatement
	: 'switch' NEWLINE!* '(' NEWLINE!* expression NEWLINE!* ')' NEWLINE!* caseBlock
	;
	
caseBlock
	: '{' (NEWLINE!* caseClause)* (NEWLINE!* defaultClause (NEWLINE!* caseClause)*)? NEWLINE!* '}'
	;

caseClause
	: 'case' NEWLINE!* expression NEWLINE!* ':' NEWLINE!* statementList?
	;
	
defaultClause
	: 'default' NEWLINE!* ':' NEWLINE!* statementList?
	;
	
throwStatement
	: 'throw' expression (NEWLINE | ';')!
	;

tryStatement
	: 'try' NEWLINE!* statementBlock NEWLINE!* (finallyClause | catchClause (NEWLINE!* finallyClause)?)
	;
       
catchClause
	: 'catch' NEWLINE!* '(' NEWLINE!* Identifier NEWLINE!* ')' NEWLINE!* statementBlock
	;
	
finallyClause
	: 'finally' NEWLINE!* statementBlock
	;

// expressions
expression
	: assignmentExpression (NEWLINE!* ',' NEWLINE!* assignmentExpression)*
	;
	
expressionNoIn
	: assignmentExpressionNoIn (NEWLINE!* ',' NEWLINE!* assignmentExpressionNoIn)*
	;
	
assignmentExpression
	: conditionalExpression
	| leftHandSideExpression NEWLINE!* assignmentOperator NEWLINE!* assignmentExpression
	;
	
assignmentExpressionNoIn
	: conditionalExpressionNoIn
	| leftHandSideExpression NEWLINE!* assignmentOperator NEWLINE!* assignmentExpressionNoIn
	;
	
leftHandSideExpression
	: callExpression
	| newExpression
	;
	
newExpression
	: memberExpression
	| 'new' NEWLINE!* newExpression
	;
	
memberExpression
	: (primaryExpression | functionExpression | 'new' NEWLINE!* memberExpression NEWLINE!* arguments) (NEWLINE!* memberExpressionSuffix)*
	;
	
memberExpressionSuffix
	: indexSuffix
	| propertyReferenceSuffix
	;

callExpression
	: memberExpression NEWLINE!* arguments (NEWLINE!* callExpressionSuffix)*
	;
	
callExpressionSuffix
	: arguments
	| indexSuffix
	| propertyReferenceSuffix
	;

arguments
	: '(' (NEWLINE!* assignmentExpression (NEWLINE!* ',' NEWLINE!* assignmentExpression)*)? NEWLINE!* ')'
	;
	
indexSuffix
	: '[' NEWLINE!* expression NEWLINE!* ']'
	;	
	
propertyReferenceSuffix
	: '.' NEWLINE!* Identifier
	;
	
assignmentOperator
	: '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '>>>=' | '&=' | '^=' | '|='
	;

conditionalExpression
	: logicalORExpression (NEWLINE!* '?' NEWLINE!* assignmentExpression NEWLINE!* ':' NEWLINE!* assignmentExpression)?
	;

conditionalExpressionNoIn
	: logicalORExpressionNoIn (NEWLINE!* '?' NEWLINE!* assignmentExpressionNoIn NEWLINE!* ':' NEWLINE!* assignmentExpressionNoIn)?
	;

logicalORExpression
	: logicalANDExpression (NEWLINE!* '||' NEWLINE!* logicalANDExpression)*
	;
	
logicalORExpressionNoIn
	: logicalANDExpressionNoIn (NEWLINE!* '||' NEWLINE!* logicalANDExpressionNoIn)*
	;
	
logicalANDExpression
	: bitwiseORExpression (NEWLINE!* '&&' NEWLINE!* bitwiseORExpression)*
	;
	
logicalANDExpressionNoIn
	: bitwiseORExpressionNoIn (NEWLINE!* '&&' NEWLINE!* bitwiseORExpressionNoIn)*
	;
	
bitwiseORExpression
	: bitwiseXORExpression (NEWLINE!* '|' NEWLINE!* bitwiseXORExpression)*
	;
	
bitwiseORExpressionNoIn
	: bitwiseXORExpressionNoIn (NEWLINE!* '|' NEWLINE!* bitwiseXORExpressionNoIn)*
	;
	
bitwiseXORExpression
	: bitwiseANDExpression (NEWLINE!* '^' NEWLINE!* bitwiseANDExpression)*
	;
	
bitwiseXORExpressionNoIn
	: bitwiseANDExpressionNoIn (NEWLINE!* '^' NEWLINE!* bitwiseANDExpressionNoIn)*
	;
	
bitwiseANDExpression
	: equalityExpression (NEWLINE!* '&' NEWLINE!* equalityExpression)*
	;
	
bitwiseANDExpressionNoIn
	: equalityExpressionNoIn (NEWLINE!* '&' NEWLINE!* equalityExpressionNoIn)*
	;
	
equalityExpression
	: relationalExpression (NEWLINE!* ('==' | '!=' | '===' | '!==') NEWLINE!* relationalExpression)*
	;

equalityExpressionNoIn
	: relationalExpressionNoIn (NEWLINE!* ('==' | '!=' | '===' | '!==') NEWLINE!* relationalExpressionNoIn)*
	;
	
relationalExpression
	: shiftExpression (NEWLINE!* ('<' | '>' | '<=' | '>=' | 'instanceof' | 'in') NEWLINE!* shiftExpression)*
	;

relationalExpressionNoIn
	: shiftExpression (NEWLINE!* ('<' | '>' | '<=' | '>=' | 'instanceof') NEWLINE!* shiftExpression)*
	;

shiftExpression
	: additiveExpression (NEWLINE!* ('<<' | '>>' | '>>>') NEWLINE!* additiveExpression)*
	;

additiveExpression
	: multiplicativeExpression (NEWLINE!* ('+' | '-') NEWLINE!* multiplicativeExpression)*
	;

multiplicativeExpression
	: unaryExpression (NEWLINE!* ('*' | '/' | '%') NEWLINE!* unaryExpression)*
	;

unaryExpression
	: postfixExpression
	| ('delete' | 'void' | 'typeof' | '++' | '--' | '+' | '-' | '~' | '!') unaryExpression
	;
	
postfixExpression
	: leftHandSideExpression ('++' | '--')?
	;

primaryExpression
	: 'this'
	| Identifier
	| literal
	| arrayLiteral
	| objectLiteral
	| '(' NEWLINE!* expression NEWLINE!* ')'
	;
	
// arrayLiteral definition.
arrayLiteral
	: '[' NEWLINE!* assignmentExpression? (NEWLINE!* ',' (NEWLINE!* assignmentExpression)?)* NEWLINE!* ']'
	;
       
// objectLiteral definition.
objectLiteral
	: '{' NEWLINE!* propertyNameAndValue (NEWLINE!* ',' NEWLINE!* propertyNameAndValue)* NEWLINE!* '}'
	;
	
propertyNameAndValue
	: propertyName NEWLINE!* ':' NEWLINE!* assignmentExpression
	;

propertyName
	: Identifier
	| StringLiteral
	| NumericLiteral
	;

// primitive literal definition.
literal
	: 'null'
	| 'true'
	| 'false'
	| StringLiteral
	| NumericLiteral
	