fun {Length List}
  case List of H|T then
    1 + {Length T}
  else
    0
  end
end

fun {Take List Count}
  if {Length List} < Count then
    List
  else
    case List
    of H|T then
      if Count == 0 then
        nil
      else
        H|{Take T Count-1}
      end
    else
      nil
    end
  end
end

fun {Drop List Count}
  if Count >= {Length List} then
    nil
  else
    case List
    of H|T then
      if Count == 0 then
        H|T
      elseif Count == 1 then
        T
      else
        {Drop T Count-1}
      end
    end
  end
end

fun {Append List1 List2}
  case List1
  of H|T then
    H|{Append T List2}
  else
    List2
  end
end

fun {Member List Element}
  case List
  of H|T then
    if H == Element then
      true
    else
      {Member T Element}
    end
  else
    if List == Element then
      true
    else
      false
    end
  end
end

fun {Position List Element}
case List
of H|T then
  if H == Element then
    1
  else
    1 +{Position T Element}
  end
else
  if List == Element then
    1
  else
    0
  end
end
end
