// Generated from Expr.g4 by ANTLR 4.0
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.Token;

public interface ExprListener extends ParseTreeListener {
	void enterProg(ExprParser.ProgContext ctx);
	void exitProg(ExprParser.ProgContext ctx);

	void enterExpr(ExprParser.ExprContext ctx);
	void exitExpr(ExprParser.ExprContext ctx);

	void enterStat(ExprParser.StatContext ctx);
	void exitStat(ExprParser.StatContext ctx);
}