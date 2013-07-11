package net.digitalprimates.translators.actionscript;

import net.digitalprimates.antlr.TypeScriptListener;
import net.digitalprimates.antlr.TypeScriptParser;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;

/**
 * User: David "Vandermore" Moore
 * Date: 7/11/13
 * Time: 11:03 AM
 */
public class TypeScriptToAS implements TypeScriptListener {
    public static final String OPEN_BRACE = "{";
    public static final String CLOSE_BRACE = "}";
    public static final String TAB = "\t";
    public static final String SEMI_COLON = ";";
    protected FileOutput fileOutput;
    protected Boolean isArrayType = false;
    protected Boolean isInterface = false;
    TypeScriptParser parser;

    public TypeScriptToAS( TypeScriptParser parser ) {
        this.parser = parser;
    }

    protected String getASType( String value ) {
        String aType = value;

        if (aType != null) {
            if ( !isArrayType ) {
                switch ( aType ) {
                    case "any" :
                        aType = "*";
                        break;
                    case "bool" :
                        aType = "Boolean";
                        break;
                    case "number" :
                        aType = "Number";
                        break;
                    case "string" :
                        aType = "String";
                        break;
                    default:
                        break;
                }
            } else {
                aType = "Array";
            }
        }

        return aType;
    }

    @Override public void enterAmbientVariableDeclaration(TypeScriptParser.AmbientVariableDeclarationContext ctx) {
        System.out.println( "enterAmbientVariableDeclaration: " + ctx.getText() );
        System.out.println( "                               : " + ctx.IDENT() );
        System.out.println( "                               : " + ctx.typeAnnotation().getText() );

        fileOutput.insertLineBreak();
        fileOutput.writeToFile( TAB + "public var " );
        fileOutput.writeToFile( ctx.IDENT().getText() );
    }

    @Override public void exitAmbientVariableDeclaration(TypeScriptParser.AmbientVariableDeclarationContext ctx) {
        fileOutput.writeToFile( SEMI_COLON );
    }

    @Override public void enterEqualityExpressionNoIn(TypeScriptParser.EqualityExpressionNoInContext ctx) { }

    @Override public void exitEqualityExpressionNoIn(TypeScriptParser.EqualityExpressionNoInContext ctx) { }

    @Override public void enterVariableDeclarationListNoIn(TypeScriptParser.VariableDeclarationListNoInContext ctx) { }

    @Override public void exitVariableDeclarationListNoIn(TypeScriptParser.VariableDeclarationListNoInContext ctx) { }

    @Override public void enterArrayLiteral(TypeScriptParser.ArrayLiteralContext ctx) { }

    @Override public void exitArrayLiteral(TypeScriptParser.ArrayLiteralContext ctx) { }

    @Override public void enterConstructorOverloads(TypeScriptParser.ConstructorOverloadsContext ctx) { }

    @Override public void exitConstructorOverloads(TypeScriptParser.ConstructorOverloadsContext ctx) { }

    @Override public void enterArrayType(TypeScriptParser.ArrayTypeContext ctx) {
        isArrayType = true;
//        System.out.println( "enterArrayType " + ctx.getText() );
    }

    @Override public void exitArrayType(TypeScriptParser.ArrayTypeContext ctx) {
        isArrayType = false;
    }

    @Override public void enterIndexSignature(TypeScriptParser.IndexSignatureContext ctx) { }

    @Override public void exitIndexSignature(TypeScriptParser.IndexSignatureContext ctx) { }

    @Override public void enterExpressionStatement(TypeScriptParser.ExpressionStatementContext ctx) { }

    @Override public void exitExpressionStatement(TypeScriptParser.ExpressionStatementContext ctx) { }

    @Override public void enterMemberAccessorDeclaration(TypeScriptParser.MemberAccessorDeclarationContext ctx) { }

    @Override public void exitMemberAccessorDeclaration(TypeScriptParser.MemberAccessorDeclarationContext ctx) { }

    @Override public void enterCloseParen(TypeScriptParser.CloseParenContext ctx) {
        fileOutput.writeToFile( " )" );
    }

    @Override public void exitCloseParen(TypeScriptParser.CloseParenContext ctx) { }

    @Override public void enterModuleElements(TypeScriptParser.ModuleElementsContext ctx) { }

    @Override public void exitModuleElements(TypeScriptParser.ModuleElementsContext ctx) { }

    @Override public void enterAmbientModuleIdentification(TypeScriptParser.AmbientModuleIdentificationContext ctx) { }

    @Override public void exitAmbientModuleIdentification(TypeScriptParser.AmbientModuleIdentificationContext ctx) { }

    @Override public void enterParameterList(TypeScriptParser.ParameterListContext ctx) { }

    @Override public void exitParameterList(TypeScriptParser.ParameterListContext ctx) {
    }

    @Override public void enterMemberFunctionImplementation(TypeScriptParser.MemberFunctionImplementationContext ctx) { }

    @Override public void exitMemberFunctionImplementation(TypeScriptParser.MemberFunctionImplementationContext ctx) { }

    @Override public void enterOpenParen(TypeScriptParser.OpenParenContext ctx) {
        fileOutput.writeToFile( " ( " );
    }

    @Override public void exitOpenParen(TypeScriptParser.OpenParenContext ctx) { }

    @Override public void enterWithStatement(TypeScriptParser.WithStatementContext ctx) { }

    @Override public void exitWithStatement(TypeScriptParser.WithStatementContext ctx) { }

    @Override public void enterImportDeclaration(TypeScriptParser.ImportDeclarationContext ctx) { }

    @Override public void exitImportDeclaration(TypeScriptParser.ImportDeclarationContext ctx) { }

    @Override public void enterBitwiseORExpressionNoIn(TypeScriptParser.BitwiseORExpressionNoInContext ctx) { }

    @Override public void exitBitwiseORExpressionNoIn(TypeScriptParser.BitwiseORExpressionNoInContext ctx) { }

    @Override public void enterBitwiseXORExpression(TypeScriptParser.BitwiseXORExpressionContext ctx) { }

    @Override public void exitBitwiseXORExpression(TypeScriptParser.BitwiseXORExpressionContext ctx) { }

    @Override public void enterAmbientClassBodyElements(TypeScriptParser.AmbientClassBodyElementsContext ctx) { }

    @Override public void exitAmbientClassBodyElements(TypeScriptParser.AmbientClassBodyElementsContext ctx) { }

    @Override public void enterAssignmentExpression(TypeScriptParser.AssignmentExpressionContext ctx) { }

    @Override public void exitAssignmentExpression(TypeScriptParser.AssignmentExpressionContext ctx) { }

    @Override public void enterVariableDeclarationNoIn(TypeScriptParser.VariableDeclarationNoInContext ctx) { }

    @Override public void exitVariableDeclarationNoIn(TypeScriptParser.VariableDeclarationNoInContext ctx) { }

    @Override public void enterAmbientDeclaration(TypeScriptParser.AmbientDeclarationContext ctx) { }

    @Override public void exitAmbientDeclaration(TypeScriptParser.AmbientDeclarationContext ctx) { }

    @Override public void enterConstructorType(TypeScriptParser.ConstructorTypeContext ctx) { }

    @Override public void exitConstructorType(TypeScriptParser.ConstructorTypeContext ctx) { }

    @Override public void enterAmbientModuleBody(TypeScriptParser.AmbientModuleBodyContext ctx) { }

    @Override public void exitAmbientModuleBody(TypeScriptParser.AmbientModuleBodyContext ctx) { }

    @Override public void enterOpenBrace(TypeScriptParser.OpenBraceContext ctx) {
        fileOutput.writeToFile( " " );
        fileOutput.writeToFile( OPEN_BRACE );
        fileOutput.insertLineBreak();
    }
    @Override public void exitOpenBrace(TypeScriptParser.OpenBraceContext ctx) { }

    @Override public void enterDefaultClause(TypeScriptParser.DefaultClauseContext ctx) { }

    @Override public void exitDefaultClause(TypeScriptParser.DefaultClauseContext ctx) { }

    @Override public void enterTypeMemberList(TypeScriptParser.TypeMemberListContext ctx) { }

    @Override public void exitTypeMemberList(TypeScriptParser.TypeMemberListContext ctx) {
        fileOutput.writeToFile( SEMI_COLON );
        fileOutput.insertLineBreak();
    }

    @Override public void enterBitwiseANDExpression(TypeScriptParser.BitwiseANDExpressionContext ctx) { }

    @Override public void exitBitwiseANDExpression(TypeScriptParser.BitwiseANDExpressionContext ctx) { }

    @Override public void enterAssignmentExpressionNoIn(TypeScriptParser.AssignmentExpressionNoInContext ctx) { }

    @Override public void exitAssignmentExpressionNoIn(TypeScriptParser.AssignmentExpressionNoInContext ctx) { }

    @Override public void enterCatchClause(TypeScriptParser.CatchClauseContext ctx) { }

    @Override public void exitCatchClause(TypeScriptParser.CatchClauseContext ctx) { }

    @Override public void enterCaseBlock(TypeScriptParser.CaseBlockContext ctx) { }

    @Override public void exitCaseBlock(TypeScriptParser.CaseBlockContext ctx) { }

    @Override public void enterPropertySignature(TypeScriptParser.PropertySignatureContext ctx) {
//        System.out.println( "enterPropertySignature: " + ctx.getText() );
        fileOutput.insertLineBreak();
        fileOutput.writeToFile( TAB + ctx.IDENT().getText() );
    }

    @Override public void exitPropertySignature(TypeScriptParser.PropertySignatureContext ctx) {
    }

    @Override public void enterBreakStatement(TypeScriptParser.BreakStatementContext ctx) { }

    @Override public void exitBreakStatement(TypeScriptParser.BreakStatementContext ctx) { }

    @Override public void enterObjectLiteral(TypeScriptParser.ObjectLiteralContext ctx) { }

    @Override public void exitObjectLiteral(TypeScriptParser.ObjectLiteralContext ctx) { }

    @Override public void enterFunctionOverload(TypeScriptParser.FunctionOverloadContext ctx) { }

    @Override public void exitFunctionOverload(TypeScriptParser.FunctionOverloadContext ctx) { }

    @Override public void enterFinallyClause(TypeScriptParser.FinallyClauseContext ctx) { }

    @Override public void exitFinallyClause(TypeScriptParser.FinallyClauseContext ctx) { }

    @Override public void enterOptionalParameterList(TypeScriptParser.OptionalParameterListContext ctx) { }

    @Override public void exitOptionalParameterList(TypeScriptParser.OptionalParameterListContext ctx) { }

    @Override public void enterVariableStatement(TypeScriptParser.VariableStatementContext ctx) { }

    @Override public void exitVariableStatement(TypeScriptParser.VariableStatementContext ctx) { }

    @Override public void enterPropertyNameAndValueList(TypeScriptParser.PropertyNameAndValueListContext ctx) { }

    @Override public void exitPropertyNameAndValueList(TypeScriptParser.PropertyNameAndValueListContext ctx) { }

    @Override public void enterBlock(TypeScriptParser.BlockContext ctx) { }

    @Override public void exitBlock(TypeScriptParser.BlockContext ctx) { }

    @Override public void enterCallExpression(TypeScriptParser.CallExpressionContext ctx) { }

    @Override public void exitCallExpression(TypeScriptParser.CallExpressionContext ctx) { }

    @Override public void enterPublicOrPrivate(TypeScriptParser.PublicOrPrivateContext ctx) {
        fileOutput.writeToFile( ctx.getText() );
    }

    @Override public void exitPublicOrPrivate(TypeScriptParser.PublicOrPrivateContext ctx) {
        fileOutput.writeToFile( " " );
    }

    @Override public void enterRequiredParameterList(TypeScriptParser.RequiredParameterListContext ctx) {
//        fileOutput.writeToFile( ", " );
    }

    @Override public void exitRequiredParameterList(TypeScriptParser.RequiredParameterListContext ctx) { }

    @Override public void enterConditionalExpression(TypeScriptParser.ConditionalExpressionContext ctx) { }

    @Override public void exitConditionalExpression(TypeScriptParser.ConditionalExpressionContext ctx) { }

    @Override public void enterInterfaceName(TypeScriptParser.InterfaceNameContext ctx) { }

    @Override public void exitInterfaceName(TypeScriptParser.InterfaceNameContext ctx) { }

    @Override public void enterFunctionType(TypeScriptParser.FunctionTypeContext ctx) { }

    @Override public void exitFunctionType(TypeScriptParser.FunctionTypeContext ctx) { }

    @Override public void enterBitwiseORExpression(TypeScriptParser.BitwiseORExpressionContext ctx) { }

    @Override public void exitBitwiseORExpression(TypeScriptParser.BitwiseORExpressionContext ctx) { }

    @Override public void enterAmbientClassBody(TypeScriptParser.AmbientClassBodyContext ctx) { }

    @Override public void exitAmbientClassBody(TypeScriptParser.AmbientClassBodyContext ctx) { }

    @Override public void enterDeclarationSourceFile(TypeScriptParser.DeclarationSourceFileContext ctx) { }

    @Override public void exitDeclarationSourceFile(TypeScriptParser.DeclarationSourceFileContext ctx) { }

    @Override public void enterIterationStatement(TypeScriptParser.IterationStatementContext ctx) { }

    @Override public void exitIterationStatement(TypeScriptParser.IterationStatementContext ctx) { }

    @Override public void enterTypeAnnotation(TypeScriptParser.TypeAnnotationContext ctx) {
        fileOutput.writeToFile( ": " );
        System.out.println( "enterTypeAnnotation: " + ctx.getText() );
    }

    @Override public void exitTypeAnnotation(TypeScriptParser.TypeAnnotationContext ctx) { }

    @Override public void enterClassElement(TypeScriptParser.ClassElementContext ctx) { }

    @Override public void exitClassElement(TypeScriptParser.ClassElementContext ctx) { }

    @Override public void enterReturnTypeAnnotation(TypeScriptParser.ReturnTypeAnnotationContext ctx) {
        fileOutput.writeToFile( ": " );
        System.out.println( "enterReturnTypeAnnotation: " + ctx.getText() );
    }

    @Override public void exitReturnTypeAnnotation(TypeScriptParser.ReturnTypeAnnotationContext ctx) { }

    @Override public void enterModuleName(TypeScriptParser.ModuleNameContext ctx) { }

    @Override public void exitModuleName(TypeScriptParser.ModuleNameContext ctx) { }

    @Override public void enterModuleReference(TypeScriptParser.ModuleReferenceContext ctx) { }

    @Override public void exitModuleReference(TypeScriptParser.ModuleReferenceContext ctx) { }

    @Override public void enterClassDeclaration(TypeScriptParser.ClassDeclarationContext ctx) { }

    @Override public void exitClassDeclaration(TypeScriptParser.ClassDeclarationContext ctx) { }

    @Override public void enterImplementationSourceFile(TypeScriptParser.ImplementationSourceFileContext ctx) { }

    @Override public void exitImplementationSourceFile(TypeScriptParser.ImplementationSourceFileContext ctx) { }

    @Override public void enterTypeLiteral(TypeScriptParser.TypeLiteralContext ctx) {}

    @Override public void exitTypeLiteral(TypeScriptParser.TypeLiteralContext ctx) { }

    @Override public void enterBooleanLiteral(TypeScriptParser.BooleanLiteralContext ctx) { }

    @Override public void exitBooleanLiteral(TypeScriptParser.BooleanLiteralContext ctx) { }

    @Override public void enterClassHeritage(TypeScriptParser.ClassHeritageContext ctx) { }

    @Override public void exitClassHeritage(TypeScriptParser.ClassHeritageContext ctx) { }

    @Override public void enterGetAccessorSignature(TypeScriptParser.GetAccessorSignatureContext ctx) { }

    @Override public void exitGetAccessorSignature(TypeScriptParser.GetAccessorSignatureContext ctx) { }

    @Override public void enterOptionalParameter(TypeScriptParser.OptionalParameterContext ctx) {
        fileOutput.writeToFile( ctx.IDENT().getText() );
    }

    @Override public void exitOptionalParameter(TypeScriptParser.OptionalParameterContext ctx) {
        //TODO:: need to see if the initialiser is here, if not, put null.
        if ( ctx.initialiser() == null ) {
            fileOutput.writeToFile( " = " + "null" );
        }
    }

    @Override public void enterMemberExpression(TypeScriptParser.MemberExpressionContext ctx) { }

    @Override public void exitMemberExpression(TypeScriptParser.MemberExpressionContext ctx) { }

    @Override public void enterTypeName(TypeScriptParser.TypeNameContext ctx) {
        String aType = ctx.getText();

        aType = getASType( aType );

        fileOutput.writeToFile( aType );
    }

    @Override public void exitTypeName(TypeScriptParser.TypeNameContext ctx) { }

    @Override public void enterArrowFormalParameters(TypeScriptParser.ArrowFormalParametersContext ctx) { }

    @Override public void exitArrowFormalParameters(TypeScriptParser.ArrowFormalParametersContext ctx) { }

    @Override public void enterNullLiteral(TypeScriptParser.NullLiteralContext ctx) { }

    @Override public void exitNullLiteral(TypeScriptParser.NullLiteralContext ctx) { }

    @Override public void enterSwitchStatement(TypeScriptParser.SwitchStatementContext ctx) { }

    @Override public void exitSwitchStatement(TypeScriptParser.SwitchStatementContext ctx) { }

    @Override public void enterEqualityExpression(TypeScriptParser.EqualityExpressionContext ctx) { }

    @Override public void exitEqualityExpression(TypeScriptParser.EqualityExpressionContext ctx) { }

    @Override public void enterArguments(TypeScriptParser.ArgumentsContext ctx) { }

    @Override public void exitArguments(TypeScriptParser.ArgumentsContext ctx) { }

    @Override public void enterConstructorOverload(TypeScriptParser.ConstructorOverloadContext ctx) { }

    @Override public void exitConstructorOverload(TypeScriptParser.ConstructorOverloadContext ctx) { }

    @Override public void enterTypeBody(TypeScriptParser.TypeBodyContext ctx) { }

    @Override public void exitTypeBody(TypeScriptParser.TypeBodyContext ctx) { }

    @Override public void enterVariableDeclarationList(TypeScriptParser.VariableDeclarationListContext ctx) { }

    @Override public void exitVariableDeclarationList(TypeScriptParser.VariableDeclarationListContext ctx) { }

    @Override public void enterThrowStatement(TypeScriptParser.ThrowStatementContext ctx) { }

    @Override public void exitThrowStatement(TypeScriptParser.ThrowStatementContext ctx) { }

    @Override public void enterFunctionDeclaration(TypeScriptParser.FunctionDeclarationContext ctx) { }

    @Override public void exitFunctionDeclaration(TypeScriptParser.FunctionDeclarationContext ctx) { }

    @Override public void enterExpression(TypeScriptParser.ExpressionContext ctx) { }

    @Override public void exitExpression(TypeScriptParser.ExpressionContext ctx) { }

    @Override public void enterCallSignature(TypeScriptParser.CallSignatureContext ctx) { }

    @Override public void exitCallSignature(TypeScriptParser.CallSignatureContext ctx) { }

    @Override public void enterLeftHandSideExpression(TypeScriptParser.LeftHandSideExpressionContext ctx) { }

    @Override public void exitLeftHandSideExpression(TypeScriptParser.LeftHandSideExpressionContext ctx) { }

    @Override public void enterInterfaceNameList(TypeScriptParser.InterfaceNameListContext ctx) { }

    @Override public void exitInterfaceNameList(TypeScriptParser.InterfaceNameListContext ctx) { }

    @Override public void enterFunctionImplementation(TypeScriptParser.FunctionImplementationContext ctx) { }

    @Override public void exitFunctionImplementation(TypeScriptParser.FunctionImplementationContext ctx) { }

    @Override public void enterSourceElements(TypeScriptParser.SourceElementsContext ctx) { }

    @Override public void exitSourceElements(TypeScriptParser.SourceElementsContext ctx) { }

    @Override public void enterUnaryExpression(TypeScriptParser.UnaryExpressionContext ctx) { }

    @Override public void exitUnaryExpression(TypeScriptParser.UnaryExpressionContext ctx) { }

    @Override public void enterAmbientFunctionDeclaration(TypeScriptParser.AmbientFunctionDeclarationContext ctx) {
        fileOutput.insertLineBreak();
        fileOutput.writeToFile( TAB + "public function " );
    }

    @Override public void exitAmbientFunctionDeclaration(TypeScriptParser.AmbientFunctionDeclarationContext ctx) {
        fileOutput.writeToFile( " " );
        fileOutput.writeToFile( CLOSE_BRACE );
        fileOutput.insertLineBreak();
    }

    @Override public void enterAmbientElement(TypeScriptParser.AmbientElementContext ctx) { }

    @Override public void exitAmbientElement(TypeScriptParser.AmbientElementContext ctx) { }

    @Override public void enterReturnStatement(TypeScriptParser.ReturnStatementContext ctx) { }

    @Override public void exitReturnStatement(TypeScriptParser.ReturnStatementContext ctx) { }

    @Override public void enterPrimaryExpression(TypeScriptParser.PrimaryExpressionContext ctx) { }

    @Override public void exitPrimaryExpression(TypeScriptParser.PrimaryExpressionContext ctx) { }

    @Override public void enterType(TypeScriptParser.TypeContext ctx) { }

    @Override public void exitType(TypeScriptParser.TypeContext ctx) { }

    @Override public void enterCloseBrace(TypeScriptParser.CloseBraceContext ctx) {
        fileOutput.writeToFile( CLOSE_BRACE );
        fileOutput.insertLineBreak();
    }
    @Override public void exitCloseBrace(TypeScriptParser.CloseBraceContext ctx) { }

    @Override public void enterLogicalANDExpression(TypeScriptParser.LogicalANDExpressionContext ctx) { }

    @Override public void exitLogicalANDExpression(TypeScriptParser.LogicalANDExpressionContext ctx) { }

    @Override public void enterMemberFunctionOverload(TypeScriptParser.MemberFunctionOverloadContext ctx) { }

    @Override public void exitMemberFunctionOverload(TypeScriptParser.MemberFunctionOverloadContext ctx) { }

    @Override public void enterRelationalExpressionNoIn(TypeScriptParser.RelationalExpressionNoInContext ctx) { }

    @Override public void exitRelationalExpressionNoIn(TypeScriptParser.RelationalExpressionNoInContext ctx) { }

    @Override public void enterVariableDeclaration(TypeScriptParser.VariableDeclarationContext ctx) { }

    @Override public void exitVariableDeclaration(TypeScriptParser.VariableDeclarationContext ctx) { }

    @Override public void enterArrowFunctionExpression(TypeScriptParser.ArrowFunctionExpressionContext ctx) { }

    @Override public void exitArrowFunctionExpression(TypeScriptParser.ArrowFunctionExpressionContext ctx) { }

    @Override public void enterMemberFunctionOverloads(TypeScriptParser.MemberFunctionOverloadsContext ctx) { }

    @Override public void exitMemberFunctionOverloads(TypeScriptParser.MemberFunctionOverloadsContext ctx) { }

    @Override public void enterMemberFunctionDeclaration(TypeScriptParser.MemberFunctionDeclarationContext ctx) { }

    @Override public void exitMemberFunctionDeclaration(TypeScriptParser.MemberFunctionDeclarationContext ctx) { }

    @Override public void enterClassExtendsClause(TypeScriptParser.ClassExtendsClauseContext ctx) {
        System.out.println("enterClassExtendsClause: " + ctx.getText() );
        fileOutput.writeToFile( " extends " + ctx.className().getText() );
    }

    @Override public void exitClassExtendsClause(TypeScriptParser.ClassExtendsClauseContext ctx) { }

    @Override public void enterBitwiseXORExpressionNoIn(TypeScriptParser.BitwiseXORExpressionNoInContext ctx) { }

    @Override public void exitBitwiseXORExpressionNoIn(TypeScriptParser.BitwiseXORExpressionNoInContext ctx) { }

    @Override public void enterCaseClauses(TypeScriptParser.CaseClausesContext ctx) { }

    @Override public void exitCaseClauses(TypeScriptParser.CaseClausesContext ctx) { }

    @Override public void enterShiftExpression(TypeScriptParser.ShiftExpressionContext ctx) { }

    @Override public void exitShiftExpression(TypeScriptParser.ShiftExpressionContext ctx) { }

    @Override public void enterExternalModuleReference(TypeScriptParser.ExternalModuleReferenceContext ctx) { }

    @Override public void exitExternalModuleReference(TypeScriptParser.ExternalModuleReferenceContext ctx) { }

    @Override public void enterInitialiserNoIn(TypeScriptParser.InitialiserNoInContext ctx) {
        fileOutput.writeToFile( " = " + ctx.getText() );
    }

    @Override public void exitInitialiserNoIn(TypeScriptParser.InitialiserNoInContext ctx) { }

    @Override public void enterClassBody(TypeScriptParser.ClassBodyContext ctx) { }

    @Override public void exitClassBody(TypeScriptParser.ClassBodyContext ctx) { }

    @Override public void enterModuleElement(TypeScriptParser.ModuleElementContext ctx) { }

    @Override public void exitModuleElement(TypeScriptParser.ModuleElementContext ctx) { }

    @Override public void enterSetAccessorSignature(TypeScriptParser.SetAccessorSignatureContext ctx) { }

    @Override public void exitSetAccessorSignature(TypeScriptParser.SetAccessorSignatureContext ctx) { }

    @Override public void enterModuleBody(TypeScriptParser.ModuleBodyContext ctx) { }

    @Override public void exitModuleBody(TypeScriptParser.ModuleBodyContext ctx) { }

    @Override public void enterLabelledStatement(TypeScriptParser.LabelledStatementContext ctx) { }

    @Override public void exitLabelledStatement(TypeScriptParser.LabelledStatementContext ctx) { }

    @Override public void enterPropertyName(TypeScriptParser.PropertyNameContext ctx) { }

    @Override public void exitPropertyName(TypeScriptParser.PropertyNameContext ctx) { }

    @Override public void enterInterfaceDeclaration(TypeScriptParser.InterfaceDeclarationContext ctx) {
        isInterface = true;

        System.out.println("enterInterfaceDeclaration" + ctx.IDENT().getText());

        fileOutput.openFileForWriting( ctx.IDENT().getText() + ".as" );
        fileOutput.writeToFile( "package " + fileOutput.packagePath + SEMI_COLON );
        fileOutput.insertLineBreak();
        fileOutput.insertLineBreak();
        fileOutput.writeToFile( "public interface " + ctx.IDENT().getText() );
    }

    @Override public void exitInterfaceDeclaration(TypeScriptParser.InterfaceDeclarationContext ctx) {
        isInterface = false;

        System.out.println("exitInterfaceDeclaration" + ctx.IDENT().getText());
    }

    @Override public void enterComma(TypeScriptParser.CommaContext ctx){
        fileOutput.writeToFile( ", " );
    }

    @Override public void exitComma(TypeScriptParser.CommaContext ctx){}

    //Package that the class/interface/etc. is located in.
    @Override public void enterAmbientModuleDeclaration(TypeScriptParser.AmbientModuleDeclarationContext ctx) {
        System.out.println("enterAmbientModuleDeclaration " + ctx.ambientModuleIdentification().getText());
        fileOutput = new FileOutput();
        fileOutput.packagePath = ctx.ambientModuleIdentification().getText();
//        fileOutput.openFileForWriting( ctx.IDENT().getText() + ".as" );
    }

    @Override public void exitAmbientModuleDeclaration(TypeScriptParser.AmbientModuleDeclarationContext ctx) {
        fileOutput.closeFileForWriting();
    }

    @Override public void enterAmbientElements(TypeScriptParser.AmbientElementsContext ctx) {
    }

    @Override public void exitAmbientElements(TypeScriptParser.AmbientElementsContext ctx) {
    }

    @Override public void enterTypeMember(TypeScriptParser.TypeMemberContext ctx) { }

    @Override public void exitTypeMember(TypeScriptParser.TypeMemberContext ctx) { }

    @Override public void enterAmbientConstructorDeclaration(TypeScriptParser.AmbientConstructorDeclarationContext ctx) { }

    @Override public void exitAmbientConstructorDeclaration(TypeScriptParser.AmbientConstructorDeclarationContext ctx) { }

    @Override public void enterDebuggerStatement(TypeScriptParser.DebuggerStatementContext ctx) { }

    @Override public void exitDebuggerStatement(TypeScriptParser.DebuggerStatementContext ctx) { }

    @Override public void enterAdditiveExpression(TypeScriptParser.AdditiveExpressionContext ctx) { }

    @Override public void exitAdditiveExpression(TypeScriptParser.AdditiveExpressionContext ctx) { }

    @Override public void enterPredefinedType(TypeScriptParser.PredefinedTypeContext ctx) {
        String aType = ctx.getText();

        aType = getASType( aType );

        fileOutput.writeToFile( aType );
    }

    @Override public void exitPredefinedType(TypeScriptParser.PredefinedTypeContext ctx) { }

    @Override public void enterPostfixExpression(TypeScriptParser.PostfixExpressionContext ctx) { }

    @Override public void exitPostfixExpression(TypeScriptParser.PostfixExpressionContext ctx) { }

    @Override public void enterEmptyStatement(TypeScriptParser.EmptyStatementContext ctx) { }

    @Override public void exitEmptyStatement(TypeScriptParser.EmptyStatementContext ctx) { }

    @Override public void enterStatement(TypeScriptParser.StatementContext ctx) {
        System.out.println("enterStatement" + ctx);
    }

    @Override public void exitStatement(TypeScriptParser.StatementContext ctx) {
        System.out.println("exitStatement" + ctx);
    }

    @Override public void enterStatementList(TypeScriptParser.StatementListContext ctx) { }

    @Override public void exitStatementList(TypeScriptParser.StatementListContext ctx) { }

    @Override public void enterRestParameter(TypeScriptParser.RestParameterContext ctx) {
        fileOutput.writeToFile( "..." );
    }

    @Override public void exitRestParameter(TypeScriptParser.RestParameterContext ctx) { }

    @Override public void enterSourceFile(TypeScriptParser.SourceFileContext ctx) { }

    @Override public void exitSourceFile(TypeScriptParser.SourceFileContext ctx) { }

    @Override public void enterProgram(TypeScriptParser.ProgramContext ctx) {
        System.out.println("Entering Program" + ctx);
    }

    @Override public void exitProgram(TypeScriptParser.ProgramContext ctx) {
        System.out.println("Exiting Program" + ctx);
    }

    @Override public void enterLogicalORExpressionNoIn(TypeScriptParser.LogicalORExpressionNoInContext ctx) { }

    @Override public void exitLogicalORExpressionNoIn(TypeScriptParser.LogicalORExpressionNoInContext ctx) { }

    @Override public void enterElision(TypeScriptParser.ElisionContext ctx) { }

    @Override public void exitElision(TypeScriptParser.ElisionContext ctx) { }

    @Override public void enterMemberVariableDeclaration(TypeScriptParser.MemberVariableDeclarationContext ctx) { }

    @Override public void exitMemberVariableDeclaration(TypeScriptParser.MemberVariableDeclarationContext ctx) { }

    @Override public void enterCaseClause(TypeScriptParser.CaseClauseContext ctx) { }

    @Override public void exitCaseClause(TypeScriptParser.CaseClauseContext ctx) { }

    @Override public void enterRequiredParameter(TypeScriptParser.RequiredParameterContext ctx) {
        fileOutput.writeToFile( ctx.IDENT().getText() );
    }

    @Override public void exitRequiredParameter(TypeScriptParser.RequiredParameterContext ctx) { }

    @Override public void enterConstructorImplementation(TypeScriptParser.ConstructorImplementationContext ctx) { }

    @Override public void exitConstructorImplementation(TypeScriptParser.ConstructorImplementationContext ctx) { }

    @Override public void enterNewExpression(TypeScriptParser.NewExpressionContext ctx) { }

    @Override public void exitNewExpression(TypeScriptParser.NewExpressionContext ctx) { }

    @Override public void enterModuleOrTypeName(TypeScriptParser.ModuleOrTypeNameContext ctx) { }

    @Override public void exitModuleOrTypeName(TypeScriptParser.ModuleOrTypeNameContext ctx) { }

    @Override public void enterMultiplicativeExpression(TypeScriptParser.MultiplicativeExpressionContext ctx) { }

    @Override public void exitMultiplicativeExpression(TypeScriptParser.MultiplicativeExpressionContext ctx) { }

    @Override public void enterAssignmentOperator(TypeScriptParser.AssignmentOperatorContext ctx) { }

    @Override public void exitAssignmentOperator(TypeScriptParser.AssignmentOperatorContext ctx) { }

    @Override public void enterExpressionNoIn(TypeScriptParser.ExpressionNoInContext ctx) { }

    @Override public void exitExpressionNoIn(TypeScriptParser.ExpressionNoInContext ctx) { }

    @Override public void enterPropertyAssignment(TypeScriptParser.PropertyAssignmentContext ctx) { }

    @Override public void exitPropertyAssignment(TypeScriptParser.PropertyAssignmentContext ctx) { }

    @Override public void enterImplementsClause(TypeScriptParser.ImplementsClauseContext ctx) {
        System.out.println("enterClassExtendsClause: " + ctx.getText() );
        fileOutput.writeToFile( " implements " + ctx.interfaceNameList().getText() );
    }

    @Override public void exitImplementsClause(TypeScriptParser.ImplementsClauseContext ctx) { }

    @Override public void enterConditionalExpressionNoIn(TypeScriptParser.ConditionalExpressionNoInContext ctx) { }

    @Override public void exitConditionalExpressionNoIn(TypeScriptParser.ConditionalExpressionNoInContext ctx) { }

    @Override public void enterPropertySetParameterList(TypeScriptParser.PropertySetParameterListContext ctx) { }

    @Override public void exitPropertySetParameterList(TypeScriptParser.PropertySetParameterListContext ctx) { }

    @Override public void enterBitwiseANDExpressionNoIn(TypeScriptParser.BitwiseANDExpressionNoInContext ctx) { }

    @Override public void exitBitwiseANDExpressionNoIn(TypeScriptParser.BitwiseANDExpressionNoInContext ctx) { }

    @Override public void enterLogicalANDExpressionNoIn(TypeScriptParser.LogicalANDExpressionNoInContext ctx) { }

    @Override public void exitLogicalANDExpressionNoIn(TypeScriptParser.LogicalANDExpressionNoInContext ctx) { }

    @Override public void enterElementList(TypeScriptParser.ElementListContext ctx) { }

    @Override public void exitElementList(TypeScriptParser.ElementListContext ctx) { }

    @Override public void enterMemberDeclaration(TypeScriptParser.MemberDeclarationContext ctx) { }

    @Override public void exitMemberDeclaration(TypeScriptParser.MemberDeclarationContext ctx) { }

    @Override public void enterFunctionSignature(TypeScriptParser.FunctionSignatureContext ctx) {
        TokenStream tokens = parser.getTokenStream();

        //TODO:: putting 'function' here isn't right. In TS interfaces evidently the 'function' keyword is not used?
        //          This will need to change later.
        if ( isInterface ) {
            fileOutput.insertLineBreak();
            fileOutput.writeToFile( TAB + "function " );
        }

        fileOutput.writeToFile( ctx.IDENT().getText() );
    }

    @Override public void exitFunctionSignature(TypeScriptParser.FunctionSignatureContext ctx) {

    }

    @Override public void enterTryStatement(TypeScriptParser.TryStatementContext ctx) { }

    @Override public void exitTryStatement(TypeScriptParser.TryStatementContext ctx) { }

    @Override public void enterRelationalExpression(TypeScriptParser.RelationalExpressionContext ctx) { }

    @Override public void exitRelationalExpression(TypeScriptParser.RelationalExpressionContext ctx) { }

    @Override public void enterAmbientStaticDeclaration(TypeScriptParser.AmbientStaticDeclarationContext ctx) {
        fileOutput.insertLineBreak();
        fileOutput.writeToFile( TAB );
        fileOutput.writeToFile( "public static " );

        //TODO:: Need to determine if the next token set is a function or a property.
    }

    @Override public void exitAmbientStaticDeclaration(TypeScriptParser.AmbientStaticDeclarationContext ctx) {
        fileOutput.insertLineBreak();
    }

    @Override public void enterClassName(TypeScriptParser.ClassNameContext ctx) { }

    @Override public void exitClassName(TypeScriptParser.ClassNameContext ctx) { }

    @Override public void enterClassElements(TypeScriptParser.ClassElementsContext ctx) { }

    @Override public void exitClassElements(TypeScriptParser.ClassElementsContext ctx) { }

    @Override public void enterFunctionExpression(TypeScriptParser.FunctionExpressionContext ctx) { }

    @Override public void exitFunctionExpression(TypeScriptParser.FunctionExpressionContext ctx) { }

    @Override public void enterConstructorDeclaration(TypeScriptParser.ConstructorDeclarationContext ctx) { }

    @Override public void exitConstructorDeclaration(TypeScriptParser.ConstructorDeclarationContext ctx) { }

    @Override public void enterConstructSignature(TypeScriptParser.ConstructSignatureContext ctx) { }

    @Override public void exitConstructSignature(TypeScriptParser.ConstructSignatureContext ctx) { }

    @Override public void enterFunctionBody(TypeScriptParser.FunctionBodyContext ctx) { }

    @Override public void exitFunctionBody(TypeScriptParser.FunctionBodyContext ctx) { }

    @Override public void enterInterfaceExtendsClause(TypeScriptParser.InterfaceExtendsClauseContext ctx) {
        fileOutput.writeToFile( " extends " + ctx.interfaceNameList().getText() );
    }

    @Override public void exitInterfaceExtendsClause(TypeScriptParser.InterfaceExtendsClauseContext ctx) { }

    @Override public void enterAmbientClassDeclaration(TypeScriptParser.AmbientClassDeclarationContext ctx) {
        fileOutput.openFileForWriting( ctx.IDENT().getText() + ".as" );
        System.out.println("enterAmbientClassDeclaration" + ctx.IDENT().getText());

        fileOutput.writeToFile( "package " + fileOutput.packagePath + SEMI_COLON );
        fileOutput.insertLineBreak();
        fileOutput.insertLineBreak();
        fileOutput.writeToFile( "public class " + ctx.IDENT().getText() );

    }

    @Override public void exitAmbientClassDeclaration(TypeScriptParser.AmbientClassDeclarationContext ctx) {
        fileOutput.insertLineBreak();
        fileOutput.writeToFile( CLOSE_BRACE );
    }

    @Override public void enterContinueStatement(TypeScriptParser.ContinueStatementContext ctx) { }

    @Override public void exitContinueStatement(TypeScriptParser.ContinueStatementContext ctx) { }

    @Override public void enterArgumentList(TypeScriptParser.ArgumentListContext ctx) { }

    @Override public void exitArgumentList(TypeScriptParser.ArgumentListContext ctx) { }

    @Override public void enterAmbientClassBodyElement(TypeScriptParser.AmbientClassBodyElementContext ctx) { }

    @Override public void exitAmbientClassBodyElement(TypeScriptParser.AmbientClassBodyElementContext ctx) { }

    @Override public void enterReturnType(TypeScriptParser.ReturnTypeContext ctx) {
        String returnType = ctx.getText();
        if ( returnType.equals( "void" ) ) //The rest is handled in enterType
        {
            fileOutput.writeToFile( returnType );
        }
    }

    @Override public void exitReturnType(TypeScriptParser.ReturnTypeContext ctx) { }

    @Override public void enterIfStatement(TypeScriptParser.IfStatementContext ctx) { }

    @Override public void exitIfStatement(TypeScriptParser.IfStatementContext ctx) { }

    @Override public void enterAmbientMemberDeclaration(TypeScriptParser.AmbientMemberDeclarationContext ctx) {
        fileOutput.insertLineBreak();
        fileOutput.writeToFile( TAB );
    }

    @Override public void exitAmbientMemberDeclaration(TypeScriptParser.AmbientMemberDeclarationContext ctx) {
        fileOutput.insertLineBreak();
    }

    @Override public void enterExportDeclaration(TypeScriptParser.ExportDeclarationContext ctx) {
        System.out.println( "enterExportDeclaration: " + ctx.getText() );
    }

    @Override public void exitExportDeclaration(TypeScriptParser.ExportDeclarationContext ctx) { }

    @Override public void enterInitialiser(TypeScriptParser.InitialiserContext ctx) {
        fileOutput.writeToFile( " = " + ctx.getText() );
    }

    @Override public void exitInitialiser(TypeScriptParser.InitialiserContext ctx) { }

    @Override public void enterFunctionOverloads(TypeScriptParser.FunctionOverloadsContext ctx) { }

    @Override public void exitFunctionOverloads(TypeScriptParser.FunctionOverloadsContext ctx) { }

    @Override public void enterLogicalORExpression(TypeScriptParser.LogicalORExpressionContext ctx) { }

    @Override public void exitLogicalORExpression(TypeScriptParser.LogicalORExpressionContext ctx) { }

    @Override public void enterSourceElement(TypeScriptParser.SourceElementContext ctx) { }

    @Override public void exitSourceElement(TypeScriptParser.SourceElementContext ctx) { }

    @Override public void enterObjectType(TypeScriptParser.ObjectTypeContext ctx) {
        fileOutput.writeToFile( " " + OPEN_BRACE );
        fileOutput.insertLineBreak();
    }

    @Override public void exitObjectType(TypeScriptParser.ObjectTypeContext ctx) {
        fileOutput.writeToFile( CLOSE_BRACE );
        //TODO:: Determine if this is an interface or not. If it is, then we need to put a trailing ';'
    }

    @Override public void enterModuleDeclaration(TypeScriptParser.ModuleDeclarationContext ctx) { }

    @Override public void exitModuleDeclaration(TypeScriptParser.ModuleDeclarationContext ctx) { }

    @Override public void enterLiteral(TypeScriptParser.LiteralContext ctx) { }

    @Override public void exitLiteral(TypeScriptParser.LiteralContext ctx) { }

    @Override public void enterEveryRule(ParserRuleContext ctx) { }

    @Override public void exitEveryRule(ParserRuleContext ctx) { }

    @Override public void visitTerminal(TerminalNode node) { }

    @Override public void visitErrorNode(ErrorNode node) { }
}
