functor
import
  System
  Application(exit:Exit)
define
  % a) function
  fun {Max X Y}
    if X > Y then
      X
    else
      Y
    end
  end
  % b) procedure
  proc {PrintGreater X Y}
    if X > Y then
      {System.showInfo X}
    else
      {System.showInfo Y}
    end
  end
  
  {System.showInfo {Max 10 89}}
  {PrintGreater 2 3}
  {Exit 0}
end
