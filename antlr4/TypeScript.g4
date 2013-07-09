grammar TypeScript;
import JSLexerRules;

//TypeScript Declarations
//*****************************************************************
//  TypeScript Declaration additions
//      - Only defining items related to Declaration Source Files
//          since I am only parsing '.d.ts' files.
//
//  TODO:: Need to include newlines and other whitespace if needed.
//
// Order (TODO)
//      Types
//      Expressions
//      Statements
//      Functions
//      Interfaces
//      Classes
//      Programs and Modules
//      Ambients
//      Declaration Source Files
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
//	| statement
	;

//
//TypeScript Module
//
//*****************************************************************
//      Types
//*****************************************************************
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
        | moduleOrTypeName '.' IDENT
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

//
// Call Signatures
//
callSignature
    : '(' parameterList? ')' returnTypeAnnotation?
    ;

//
// Construct Signature
//
constructSignature
    : 'new' '(' parameterList? ')' typeAnnotation?
    ;

//
// Index Signatures
//
indexSignature
    : '[' requiredParameter ']' typeAnnotation?
    ;

//
// Property Signatures
//
propertySignature
    : IDENT '?'? typeAnnotation?
    ;

//
// Function Signatures
//
functionSignature
    : IDENT '?'? '(' parameterList ')' returnTypeAnnotation?
    | IDENT '(' parameterList? ')' returnTypeAnnotation?
    ;

//
// Array Type Literals
//
arrayType //This isn't as defined in the spec, but it was mutually left-recursive in ANTLR4.
          //I'd like to find a way to fix this so there is less duplicate code.
    : predefinedType '[' ']'
    | typeName '[' ']'
    | objectType '[' ']'
    | functionType '[' ']'
    | constructorType '[' ']'
    ;

//
// Function Type Literals
//
functionType
    : '(' parameterList? ')' '=>' returnType
    ;

//
// Constructor Type Literals
//
constructorType
    : 'new' '(' parameterList? ')' '=>' type
    ;

//*****************************************************************
//      Expressions
//*****************************************************************
//
// Function Expressions
//
functionExpression //Modified from base JavaScript implementation for TS
	: 'function' NEWLINE!* IDENT? NEWLINE!* callSignature NEWLINE!* '{' functionBody '}'
	;

assignmentExpression //Modified to add in arrowFunctionExpression for TS
	: conditionalExpression
	| leftHandSideExpression NEWLINE!* assignmentOperator NEWLINE!* assignmentExpression
        | arrowFunctionExpression
	;

arrowFunctionExpression
    : arrowFormalParameters '=>' block
    | arrowFormalParameters '=>' assignmentExpression
    ;

arrowFormalParameters
    : callSignature
    | IDENT
    ;

//unaryExpression 
//	: postfixExpression
//	| ('delete' | 'void' | 'typeof' | '++' | '--' | '+' | '-' | '~' | '!') unaryExpression
//        | '<' type '>'
//	;

unaryExpression //Modified to add in < Type > for TS
    : postfixExpression
    | 'delete' unaryExpression
    | 'void' unaryExpression
    | 'typeof' unaryExpression
    | '++' unaryExpression
    | '--' unaryExpression
    | '+' unaryExpression
    | '-' unaryExpression
    | '~' unaryExpression
    | '!' unaryExpression
    | '<' type '>'
    ;



//*****************************************************************
//      Statements
//*****************************************************************
variableDeclaration //Modified for TS
	: IDENT NEWLINE!* typeAnnotation? initialiser?
	;

variableDeclarationNoIn
	: IDENT NEWLINE!* typeAnnotation? initialiserNoIn?
	;

typeAnnotation
        : ':' type
        ;

//*****************************************************************
//      Functions
//*****************************************************************
//
//Function Declarations
//
functionDeclaration //Modified for TS
    : functionOverloads? functionImplementation
    ;

functionOverloads
    : functionOverload
    | functionOverloads functionOverload
    ;

functionOverload
    : 'function' functionSignature ';'
    ;

functionImplementation
    : 'function' functionSignature '{' functionBody '}'
    ;

//
// Function Signatures
//
//Was duplicate, moved as an | to earlier definition.
//functionSignature
//    : IDENT '(' parameterList? ')' returnTypeAnnotation?
//    ;
    
parameterList
    : requiredParameterList
    | optionalParameterList
    | restParameter
    | requiredParameterList ',' optionalParameterList
    | requiredParameterList ',' restParameter
    | optionalParameterList ',' restParameter
    | requiredParameterList ',' optionalParameterList ',' restParameter
    ;

requiredParameterList
    : requiredParameter
    | requiredParameterList ',' requiredParameter
    ;

requiredParameter
    : publicOrPrivate? IDENT typeAnnotation?
    ;

publicOrPrivate
    : 'public'
    | 'private'
    ;

optionalParameterList
    : optionalParameter
    | optionalParameterList ',' optionalParameter
    ;

optionalParameter
    : publicOrPrivate? IDENT '?' typeAnnotation?
    | publicOrPrivate? IDENT typeAnnotation? initialiser
    ;

restParameter
    : '...' requiredParameter
    ;

returnTypeAnnotation
    : ':' returnType
    ;

returnType
    : type
    | 'void'
    ;

//
// Function Implementations
//
//Dupe
//functionImplementation
//    : 'function' functionSignature '{' functionBody '}'
//    ;

//*****************************************************************
//      Interfaces
//*****************************************************************
//
// Interface Declarations
//
interfaceDeclaration
    : 'interface' IDENT interfaceExtendsClause? objectType
    ;

interfaceExtendsClause
    : 'extends' interfaceNameList
    ;

interfaceNameList
    : interfaceName
    | interfaceNameList ',' interfaceName
    ;

interfaceName
    : typeName
    ;

//*****************************************************************
//      Classes
//*****************************************************************
classDeclaration
    : 'class' IDENT classHeritage '{' classBody '}'
    ;

//
// Class Heritage Specification
//
classHeritage
    : classExtendsClause? implementsClause?
    ;

classExtendsClause
    : 'extends' className
    ;

className
    : typeName
    ;

implementsClause
    : 'implements' interfaceNameList
    ;

//
// Class Body
//
classBody
    : classElements?
    ;

classElements
    : classElement
    | classElements classElement
    ;

classElement
    : constructorDeclaration
    | memberDeclaration
    ;

//
// Constructor Declarations
//
constructorDeclaration
    : constructorOverloads? constructorImplementation
    ;

constructorOverloads
    : constructorOverload
    | constructorOverloads constructorOverloads
    ;

constructorOverload
    : 'constructor' '(' parameterList? ')' ';'
    ;

constructorImplementation
    : 'constructor' '(' parameterList ')' '{' functionBody '}'
    ;

//
// Member Declarations
//
memberDeclaration
    : memberVariableDeclaration
    | memberFunctionDeclaration
    | memberAccessorDeclaration
    ;

//
// Member Variable Declarations
//
memberVariableDeclaration
    : publicOrPrivate? 'static'? variableDeclaration ';'
    ;

//
// Member Function Declarations
//
memberFunctionDeclaration
    : memberFunctionOverloads? memberFunctionImplementation
    ;

memberFunctionOverloads
    : memberFunctionOverload
    | memberFunctionOverloads memberFunctionOverload
    ;

memberFunctionOverload
    : publicOrPrivate? 'static'? functionSignature
    ;

memberFunctionImplementation
    : publicOrPrivate? 'static'? functionSignature '{' functionBody '}'
    ;

//
// Member Accessor Declarations
//
memberAccessorDeclaration
    : publicOrPrivate? getAccessorSignature '{' functionBody '}'
    | publicOrPrivate? setAccessorSignature '{' functionBody '}'
    ;

getAccessorSignature
    : 'get' IDENT '(' ')' returnTypeAnnotation?
    ;

setAccessorSignature
    : 'set' IDENT '(' requiredParameter ')'
    ;

//*****************************************************************
//      Programs and Modules
//*****************************************************************
//
//Programs
//
sourceFile
    : implementationSourceFile
    | declarationSourceFile
    ;

implementationSourceFile
    : moduleElements?
    ;

moduleElements
    : moduleElement
    | moduleElements moduleElement
    ;

moduleElement
    : statement
    | functionDeclaration
    | classDeclaration
    | interfaceDeclaration
    | moduleDeclaration
    | importDeclaration
    | exportDeclaration
    | ambientDeclaration
    ;

//
// Module Declarations
//
moduleDeclaration
    : 'module' identifierPath? '{' moduleBody '}'
    ;

identifierPath
    : IDENT
    | identifierPath '.' IDENT
    ;

moduleBody
    : moduleElements?
    ;

//
// Export Declarations
//
exportDeclaration
    : 'export' variableStatement
    | 'export' functionDeclaration
    | 'export' classDeclaration
    | 'export' interfaceDeclaration
    | 'export' moduleDeclaration
    | 'export' ambientDeclaration
    ;

//
// Import Declarations
//
importDeclaration
    : 'import' IDENT '=' moduleReference ';'
    ;

moduleReference
    : externalModuleReference
    | moduleName
    ;

externalModuleReference
    : 'module' '(' STRING_LITERAL ')'
    ;

//*****************************************************************
//      Ambients
//*****************************************************************
//
// Ambient Declarations
//
ambientDeclaration
        : 'declare' ambientVariableDeclaration
        | 'declare' ambientFunctionDeclaration
        | 'declare' ambientClassDeclaration
        | 'declare' ambientModuleDeclaration
	;

//
// Ambient Variable Declarations
//
ambientVariableDeclaration
        : 'var' IDENT ':' typeAnnotation? ';'
        ;

//
// Ambient Function Declarations
//
ambientFunctionDeclaration
        : 'function' functionSignature ';'
        ;

//
// Ambient Class Declarations
//
ambientClassDeclaration
        : 'class' IDENT classHeritage '{' ambientClassBody '}'
        ;

ambientClassBody
    : ambientClassBodyElements?
    ;

ambientClassBodyElements
    : ambientClassBodyElement
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

ambientStaticDeclaration
    : 'static' IDENT typeAnnotation? ';'
    | 'static' functionSignature ';'
    ;

//
// Ambient Module Declarations
//
ambientModuleDeclaration
	: 'module' ambientModuleIdentification '{' ambientModuleBody '}'
	;

ambientModuleIdentification
    : identifierPath
    | STRING_LITERAL
    ;

ambientModuleBody
	: ambientElements?
	;

ambientElements
        : ambientElement
        | ambientElements ambientElement
        ;

ambientElement
        : 'export'? ambientVariableDeclaration
        | 'export'? ambientFunctionDeclaration
        | 'export'? ambientClassDeclaration
        | 'export'? interfaceDeclaration
        | 'export'? ambientModuleDeclaration
        | importDeclaration
        ;

//
// Declaration Source Files
//
declarationSourceFile
    : ambientElements?
    ;


//*********************************************************
// JavaScript Grammar
//      Grammar from Annotaded ES5
//      http://es5.github.io
//*********************************************************
functionBody
    : sourceElements?
    ;

conditionalExpression
    : logicalORExpression
    | logicalORExpression '?' assignmentExpression ':' assignmentExpression
    ;

block
	: '{' statementList? '}'
	;

leftHandSideExpression
    : newExpression
    | callExpression
    ;

newExpression
    : memberExpression
    | 'new' newExpression
    ;

callExpression
    : memberExpression arguments
    | callExpression arguments
    | callExpression '[' expression ']'
    | callExpression '.' IDENT
    ;

arguments
    : '(' ')'
    | '(' argumentList ')'
    ;

argumentList
    : assignmentExpression
    | argumentList ',' assignmentExpression
    ;

assignmentOperator
    : '='
    | '*='
    | '/='
    | '%='
    | '+='
    | '-='
    | '<<='
    | '>>='
    | '>>>='
    | '&='
    | '^='
    | '|='
    ;

postfixExpression
    : leftHandSideExpression
    | leftHandSideExpression NEWLINE!* '++'
    | leftHandSideExpression NEWLINE!* '--'
    ;

initialiser
	: '=' assignmentExpression
	;

initialiserNoIn
	: '=' assignmentExpressionNoIn
	;

statementList
    : statement
    | statementList statement
    ;

statement
    : block
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
    | debuggerStatement
    ;

variableStatement
    : 'var' variableDeclarationList ';'
    ;

variableDeclarationList
    : variableDeclaration
    | variableDeclarationList ',' variableDeclaration
    ;

variableDeclarationListNoIn
    : variableDeclarationNoIn
    | variableDeclarationListNoIn ',' variableDeclarationNoIn
    ;

logicalORExpression
    : logicalANDExpression
    | logicalORExpression '||' logicalANDExpression
    ;

logicalANDExpression
    : bitwiseORExpression
    | logicalANDExpression '&&' bitwiseORExpression
    ;

bitwiseORExpression
    : bitwiseXORExpression
    | bitwiseORExpression '|' bitwiseXORExpression
    ;

bitwiseXORExpression
    : bitwiseANDExpression
    | bitwiseXORExpression '^' bitwiseANDExpression
    ;

bitwiseANDExpression
    : equalityExpression
    | bitwiseANDExpression '&' equalityExpression
    ;

equalityExpression
    : relationalExpression
    | equalityExpression '==' relationalExpression
    | equalityExpression '!=' relationalExpression
    | equalityExpression '===' relationalExpression
    | equalityExpression '!==' relationalExpression
    ;
      
relationalExpression
    : shiftExpression
    | relationalExpression '<' shiftExpression
    | relationalExpression '>' shiftExpression
    | relationalExpression '<=' shiftExpression
    | relationalExpression '>=' shiftExpression
    | relationalExpression 'instanceof' shiftExpression
    | relationalExpression 'in' shiftExpression
    ;

shiftExpression
    : additiveExpression
    | shiftExpression '<<' additiveExpression
    | shiftExpression '>>' additiveExpression
    | shiftExpression '>>>' additiveExpression
    ;

additiveExpression
    : multiplicativeExpression
    | additiveExpression '+' multiplicativeExpression
    | additiveExpression '-' multiplicativeExpression
    ;  

multiplicativeExpression
    : unaryExpression
    | multiplicativeExpression '*' unaryExpression
    | multiplicativeExpression '/' unaryExpression
    | multiplicativeExpression '%' unaryExpression
    ;

memberExpression
    : primaryExpression
    | functionExpression
    | memberExpression '[' expression ']'
    | memberExpression '.' IDENT
    | 'new' memberExpression arguments
    ;

primaryExpression
	: 'this'
	| IDENT
	| literal
	| arrayLiteral
	| objectLiteral
	| '(' expression ')'
	;

literal
	: nullLiteral
	| booleanLiteral
	| NUMERIC_LITERAL
	| STRING_LITERAL
      //Omitting regularExpressionLiteral for now
        ;

nullLiteral
    : 'null'
    ;

booleanLiteral
    : 'true'
    | 'false'
    ;

arrayLiteral
    : '[' elision? ']'
    | '[' elementList ']'
    | '[' elementList ',' elision? ']'
    ;

elementList
    : elision? assignmentExpression
    | elementList ',' elision? assignmentExpression
    ;

elision
    : ','
    | elision ','
    ;

objectLiteral
    :
    ;


expression
    : assignmentExpression
    | expression ',' assignmentExpression
    ;

expressionNoIn
    : assignmentExpressionNoIn
    | expressionNoIn ',' assignmentExpressionNoIn
    ;

assignmentExpressionNoIn
    : conditionalExpressionNoIn
    | leftHandSideExpression assignmentOperator assignmentExpressionNoIn
    ;

conditionalExpressionNoIn
    : logicalORExpressionNoIn
    | logicalORExpressionNoIn '?' assignmentExpressionNoIn ':' assignmentExpressionNoIn
    ;

logicalORExpressionNoIn
    : logicalANDExpressionNoIn
    | logicalORExpressionNoIn '||' logicalANDExpressionNoIn
    ;

logicalANDExpressionNoIn
    : bitwiseORExpressionNoIn
    | logicalANDExpressionNoIn '&&' bitwiseORExpressionNoIn
    ;

bitwiseORExpressionNoIn
    : bitwiseXORExpressionNoIn
    | bitwiseORExpressionNoIn '|' bitwiseXORExpressionNoIn
    ;

bitwiseXORExpressionNoIn
    : bitwiseANDExpressionNoIn
    | bitwiseXORExpressionNoIn '^' bitwiseANDExpressionNoIn
    ;

bitwiseANDExpressionNoIn
    : equalityExpressionNoIn
    | bitwiseANDExpressionNoIn '&' equalityExpressionNoIn
    ;

equalityExpressionNoIn
    : relationalExpressionNoIn
    | equalityExpressionNoIn '==' relationalExpressionNoIn
    | equalityExpressionNoIn '!=' relationalExpressionNoIn
    | equalityExpressionNoIn '===' relationalExpressionNoIn
    | equalityExpressionNoIn '!==' relationalExpressionNoIn
    ;

relationalExpressionNoIn
    : shiftExpression
    | relationalExpressionNoIn '<' shiftExpression
    | relationalExpressionNoIn '>' shiftExpression
    | relationalExpressionNoIn '<=' shiftExpression
    | relationalExpressionNoIn '>=' shiftExpression
    | relationalExpressionNoIn 'instanceof' shiftExpression
    ;

emptyStatement
    : ';'
    ;

expressionStatement
    : expression (NEWLINE | ';')!
    ;

ifStatement
    : 'if' '(' expression ')' statement 'else' statement
    | 'if' '(' expression ')' statement
    ;

iterationStatement
    : 'do' statement 'while' '(' expression ')' ';'
    | 'while' '(' expression ')' statement
    | 'for' '(' expressionNoIn? ';' expression? ';' expression? ')' statement
    | 'for' '(' 'var' variableDeclarationListNoIn ';' expression? ';' expression? ')' statement
    | 'for' '(' leftHandSideExpression 'in' expression ')' statement
    | 'for' '(' 'var' variableDeclarationNoIn 'in' expression ')' statement
    ;


continueStatement
    : 'continue' NEWLINE!* IDENT? ';'
    ;

breakStatement
    : 'break' NEWLINE!* IDENT? ';'
    ;

returnStatement
    : 'return' NEWLINE!* expression? ';'
    ;

withStatement
    : 'with' '(' expression ')' statement
    ;

labelledStatement
    : IDENT ':' statement
    ;

switchStatement
    : 'switch' '(' expression ')' caseBlock
    ;

caseBlock
    : '{' caseClauses? '}'
    | '{' caseClauses? defaultClause caseClauses? '}'
    ;

caseClauses
    : caseClause
    | caseClauses caseClause
    ;

caseClause
    : 'case' expression ':' statementList?
    ;

defaultClause
    : 'default' ':' statementList?
    ;

throwStatement
    : 'throw' NEWLINE!* expression ';'
    ;

tryStatement //Can't use catch or finally, check to see if they are reserved words in ANTLR4.
    : 'try' block catchClause
    | 'try' block finallyClause
    | 'try' block catchClause finallyClause
    ;

catchClause
    : 'catch' '(' IDENT ')' block
    ;
   
finallyClause
    : 'finally' block
    ;

debuggerStatement
    : 'debugger' ';'
    ;

   
////
// THIS IS OLDER AND JS, WE MAY NOT NEED IT FOR .d.ts FILES.
////

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
/*
// functions
formalParameterList
	: '(' (NEWLINE!* IDENT (NEWLINE!* ',' NEWLINE!* IDENT)*)? NEWLINE!* ')'
	;

functionBody
	: '{' NEWLINE!* sourceElements NEWLINE!* '}'
	;

// statements
statement
	: block
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

block
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
	: 'try' NEWLINE!* block NEWLINE!* (finallyClause | catchClause (NEWLINE!* finallyClause)?)
	;

catchClause
	: 'catch' NEWLINE!* '(' NEWLINE!* IDENT NEWLINE!* ')' NEWLINE!* block
	;

finallyClause
	: 'finally' NEWLINE!* block
	;

// expressions
expression
	: assignmentExpression (NEWLINE!* ',' NEWLINE!* assignmentExpression)*
	;

expressionNoIn
	: assignmentExpressionNoIn (NEWLINE!* ',' NEWLINE!* assignmentExpressionNoIn)*
	;

//Modified for TypeScript - above
//assignmentExpression
//	: conditionalExpression
//	| leftHandSideExpression NEWLINE!* assignmentOperator NEWLINE!* assignmentExpression
//	;

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

// Modified for TS - see above
//unaryExpression
//	: postfixExpression
//	| ('delete' | 'void' | 'typeof' | '++' | '--' | '+' | '-' | '~' | '!') unaryExpression
//	;

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
	: type NEWLINE!* ':' NEWLINE!* assignmentExpression
	;

// primitive literal definition.
literal
	: 'null'
	| 'true'
	| 'false'
	| STRING_LITERAL
	| NUMERIC_LITERAL
        ;
*/