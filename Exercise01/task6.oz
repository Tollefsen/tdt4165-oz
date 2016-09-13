functor
import
  System
  Application(exit:Exit)
define
  fun {Factorial N} A in
    if N > 1 then
      A = N * {Factorial N-1}
    else
      A = 1
    end
    A
  end
  {System.showInfo {Factorial 5}}
  {Exit 0}
end
