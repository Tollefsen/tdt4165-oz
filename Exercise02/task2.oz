functor
import
  Application(exit:Exit)
  System
  Module
define
  \insert mcd.oz
  \insert List.oz
  Lexemes = {Lex "1. 2. 3. d ^ p"}
  Tokens = {Tokenize Lexemes}
  Interpreted = {Interpret Tokens}
  {Exit 0}
end
