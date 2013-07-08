    /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
grammar TypeScript;
import JSLexerRules;

//TypeScript Declarations
//*****************************************************************
//  TypeScript Declaration additions
//      - Only defining items related to Declaration Source Files
//          since I am only parsing '.d.ts' files.
//*****************************************************************

program
	: NEWLINE!* sourceElement? NEWLINE!* EOF!
	;

sourceElements
	: sourceElement (NEWLINE!* sourceElement)*
	;

sourceElement
	: functionDeclaration
        | ambientDeclaration
	| statement
	;

//
//TypeScript Module
//
ambientDeclaration
        : 'declare' ambientVariableDeclaration
        | 'declare' ambientFunctionDeclaration
        | 'declare' ambientClassDeclaration
        | 'declare' ambientModuleDeclaration
	;
//
//TypeScript Variables
//
ambientVariableDeclaration
        : 'var' IDENT ':' typeAnnotation? ';'
        ;

//
//TypeScript Functions
//
ambientFunctionDeclaration
        : 'function' functionSignature ';'
        ;

//
//TypeScript Class
//
ambientClassDeclaration
        : 'class' IDENT classHeritage '{' ambientClassBody '}'
        ;

ambientClassBody
    : ambientClassBodyElements?
    ;

ambientClassBodyElements
    : ambientClassBodyElements
    | ambientClassBodyElements ambientClassBodyElement
    ;

ambientClassBodyElement
    : ambientConstructorDeclaration
    | ambientMemberDeclaration
    | ambientStaticDeclaration
    ;

ambientConstructorDeclaration
    : 'constructor' '(' parameterList ')' ';'
    ;

ambientMemberDeclaration
    : publicOrPrivate? IDENT typeAnnotation? ';'
    | publicOrPrivate? functionSignature ';'
    ;

ambientModuleDeclaration
	: 'module' IDENT '{' NEWLINE!* ambientModuleBody NEWLINE!* '}'
	;

ambientModuleBody
	: 'export' 'interface'? IDENT ('extends' IDENT (',' IDENT)* )*? NEWLINE!* '{' NEWLINE!* ambientElements? NEWLINE!* '}'
	;

ambientElements
        : ambientElement
        ;

ambientElement
        : ( 'export' ambientVariableDeclaration )?
        ;

ambientInterfaceDeclaration
        : 'interface' IDENT 'extends' typeAnnotation? ';'
        ;

//
// Other Typescript grammar
//
typeAnnotation
        : propertyName; //TODO:: Doesn't seem right, testing.
        ;

functionSignature
        : IDENT '?'? '(' parameterList ')' returnTypeAnnotation?
        ;

returnTypeAnnotation
        : returnType
        ;

returnType
        : type
        | 'void'
        ;

parameterList
	: '(' (NEWLINE!* IDENT (NEWLINE!* ',' NEWLINE!* IDENT)*)? NEWLINE!* ')'
	;

//
// Types
//
type
        : predefinedType
        | typeName
        | typeLiteral
        ;

predefinedType
        : 'any'
        | 'number'
        | 'bool'
        | 'string'
        ;

typeName
        : moduleOrTypeName
        ;

moduleOrTypeName
        : IDENT
        | moduleName '.' IDENT
        ;

moduleName
        : moduleOrTypeName
        ;

typeLiteral
        : objectType
        | arrayType
        | functionType
        | constructorType
        ;

//
// Object Type Literals
//
objectType
    : '{' typeBody '}'
    ;

typeBody
    : typeMemberList?
    | typeMemberList ';'
    ;

typeMemberList
    : typeMember
    | typeMemberList ';' typeMember
    ;

typeMember
    : callSignature
    | constructSignature
    | indexSignature
    | propertySignature
    | functionSignature
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
	: 'function' NEWLINE!* IDENT NEWLINE!* formalParameterList NEWLINE!* functionBody
	;

functionExpression
	: 'function' NEWLINE!* IDENT? NEWLINE!* formalParameterList NEWLINE!* functionBody
	;

formalParameterList
	: '(' (NEWLINE!* IDENT (NEWLINE!* ',' NEWLINE!* IDENT)*)? NEWLINE!* ')'
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
	: IDENT NEWLINE!* initialiser?
	;

variableDeclarationNoIn
	: IDENT NEWLINE!* initialiserNoIn?
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
	: 'continue' IDENT? (NEWLINE | ';')!
	;

breakStatement
	: 'break' IDENT? (NEWLINE | ';')!
	;

returnStatement
	: 'return' expression? (NEWLINE | ';')!
	;

withStatement
	: 'with' NEWLINE!* '(' NEWLINE!* expression NEWLINE!* ')' NEWLINE!* statement
	;

labelledStatement
	: IDENT NEWLINE!* ':' NEWLINE!* statement
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
	: 'catch' NEWLINE!* '(' NEWLINE!* IDENT NEWLINE!* ')' NEWLINE!* statementBlock
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
	: '.' NEWLINE!* IDENT
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
	| IDENT
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
	: IDENT
	| STRING_LITERAL
	| NUMERIC_LITERAL
	;

// primitive literal definition.
literal
	: 'null'
	| 'true'
	| 'false'
	| STRING_LITERAL
	| NUMERIC_LITERAL
        ;