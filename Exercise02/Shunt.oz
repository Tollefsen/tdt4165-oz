fun {ShuntInternal Tokens OperatorStack OutputStack}
  case Tokens
  of nil then
    {ReverseList {Append OperatorStack OutputStack}}
  [] H|T then
    case H
    of number(N) then
      {ShuntInternal T OperatorStack H|OutputStack}
    [] operator(type:O) then
      if OperatorStack == nil then
        {ShuntInternal T operator(type:O)|OperatorStack OutputStack}
      else
        if {OpLeq operator(type:O) OperatorStack.1} then
          {ShuntInternal Tokens OperatorStack.2 OperatorStack.1|OutputStack}
        else
          {ShuntInternal T operator(type:O)|OperatorStack OutputStack}
        end
      end
    end
  end
end

fun {ReverseList List}
  fun {Ite Output Input}
    case Input
    of nil then
      Output
    [] H|T then
      {Ite H|Output T}
    end
  end
in
  {Ite nil List}
end

fun {OpLeq Pushing Top}
  Lower = [operator(type:plus) operator(type:minus)]
  Upper = [operator(type:multiply) operator(type:divide)]
in
  if {Member Lower Pushing} then
    true
  else
    if {Member Upper Top} then
      true
    else
      false
    end
  end
end

fun {Shunt Tokens}
  {ShuntInternal Tokens nil nil}
end
