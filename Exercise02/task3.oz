functor
import
  Application(exit:Exit)
  System
  Module
define
  \insert mcd.oz
  \insert List.oz
  \insert Shunt.oz
  Interpreted = {Shunt {Tokenize {Lex "3. - 10. * 9. + 0.3"}}}

  {System.showInfo " "}
  {System.showInfo "Ferdig Stack"}
  {PrintStack Interpreted}
  {Exit 0}
end
