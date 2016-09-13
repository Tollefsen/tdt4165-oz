functor
import
  System
  Application(exit:Exit)
define
  \insert List.oz
  List = 1|2|3|nil
  List2 = 4|5|6|nil
  {System.showInfo {Length List}}
  {System.showInfo {Length {Take List 5}}}
  {System.showInfo {Length {Drop List 5}}}
  {System.showInfo {Length {Append List List2}}}
  if {Member List 4} then
    {System.showInfo 'true'}
  else
    {System.showInfo 'false'}
  end
  {System.showInfo {Position List 3}}
  {Exit 0}
end
