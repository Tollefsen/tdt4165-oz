functor
import
  Application(exit:Exit)
  System
  Module
define
  \insert mcd.oz
  \insert List.oz
  Lexemes = {Lex "1 2 3 +"}
  Tokens = {Tokenize Lexemes}
  Interpreted = {Interpret Tokens}
  {System.showInfo {Length Interpreted}}
  {Exit 0}
end
