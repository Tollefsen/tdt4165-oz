fun {Lex Input}
  Output
in
  {String.tokens Input &  Output}
  {Map Output
  fun {$ Lexeme}
    {String.toAtom Lexeme}
  end}
end

fun {Tokenize Lexemes}
  Operators = ['+' '-' '*' '/']
in
  case Lexemes
  of nil then
    nil
  [] H|T then
    if {Member Operators H} then
      case H
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
      number({String.toInt H})|{Tokenize T}
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
      {Iterate Number|Stack Tail}
    [] operator(type:Operator)|Tail then
      Top|NextToTop|Rest = Stack in
      {Iterate {Operations.Operator NextToTop Top}|Rest Tail}
    end
  end
in
  {Iterate nil Tokens}
end
