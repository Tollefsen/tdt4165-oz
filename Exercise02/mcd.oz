fun {Lex Input}
  Output
in
  {String.tokens Input &  Output}
  /*{Map Output
  fun {$ Lexeme}
    {String.toAtom Lexeme}
  end}*/
  Output
end

fun {Tokenize Lexemes}
  Operators = ['+' '-' '*' '/']
in
  case Lexemes
  of nil then
    nil
  [] H|T then
    if {Member Operators {String.toAtom H}} then
      case {String.toAtom H}
      of '+' then
        operator(type:plus)|{Tokenize T}
      [] '-' then
        operator(type:minus)|{Tokenize T}
      [] '*' then
        operator(type:multiply)|{Tokenize T}
      [] '/' then
        operator(type:divide)|{Tokenize T}
      end
    else
      number(H)|{Tokenize T}
    end
  end
end

fun {Interpret Tokens}
  Operations = op(plus:Number.'+'
    minus:Number.'-'
    multiply:Number.'*'
    divide:Int.'div')
  fun {Iterate Stack Tokens}
    case Tokens
    of nil then
      Stack
    [] number(Number)|Tail then
      {Iterate {String.toInt Number}|Stack Tail}
    [] operator(type:Operator)|Tail then
      Top|NextToTop|Rest = Stack in
      {Iterate {Operations.Operator NextToTop Top}|Rest Tail}
    end
  end
in
  {Iterate nil Tokens}
end
