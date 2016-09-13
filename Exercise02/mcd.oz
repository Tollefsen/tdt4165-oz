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
      number(H)|{Tokenize T}
    end
  end
end

fun {Interpret Tokens}
  fun {Iterate Stack Tokens}
    case Tokens
    of nil then
      Stack
    [] number(Number)|Tail then
      {Iterate Number|Stack Tokens}
    [] operator(Operator)|Tail then
      Top|NextToTop|Rest = Stack in
      case Operator
      of plus then
        {Iterate Top+NextToTop|Rest Tail}
      [] minus then
        {Iterate NextToTop-Top|Rest Tail}
      [] multiply then
        {Iterate Top*NextToTop|Rest Tail}
      [] divide then
        {Iterate NextToTop/Top|Rest Tail}
      end
    end
  end
in
  try
    {Iterate nil Tokens}
  catch _ then
    raise "stack empty" end
  end
end
