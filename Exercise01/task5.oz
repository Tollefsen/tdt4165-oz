functor
import
  System
  Application(exit:Exit)
define
  local
    PI Area Diameter Circumference
  in
    proc {Circle R}
      PI = 355. / 113.
      Area = PI * R * R
      Diameter = 2. * R
      Circumference = PI * Diameter
      {System.showInfo Area}
      {System.showInfo Diameter}
      {System.showInfo Circumference}
    end
  end
  {Circle 4.0}
  {Exit 0}
end
