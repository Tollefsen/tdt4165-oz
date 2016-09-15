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
  Commands = ['p' 'd' 'i' '^']
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
    elseif {Member Commands {String.toAtom H}} then
      case {String.toAtom H}
      of 'p' then
        command(print)|{Tokenize T}
      [] 'd' then
        command(duplicate)|{Tokenize T}
      [] 'i' then
        command(flip)|{Tokenize T}
      [] '^' then
        command(inverse)|{Tokenize T}
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
      {Iterate {String.toFloat Number}|Stack Tail}
    [] operator(type:Operator)|Tail then
      Top|NextToTop|Rest = Stack in
      {Iterate {Operations.Operator NextToTop Top}|Rest Tail}
    [] command(Command)|Tail then
      Top|Rest = Stack in
      case Command
      of print then
        {PrintStack Stack}
        {Iterate Stack Tail}
      [] duplicate then
        {Iterate Top|Stack Tail}
      [] flip then
        {Iterate {Number.'~' Top}|Rest Tail}
      [] inverse then
        {Iterate {Float.'/' 1. Top}|Rest Tail}
      end
    end
  end
in
  {Iterate nil Tokens}
end
