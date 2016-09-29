functor
import
  Application(exit:Exit)
  System
define
  local
    StreamMap
    StreamScale
    StreamZip
    StreamAdd
    StreamIntegrate
    MakeRC
    RC
  in
    fun lazy {StreamMap S F}
     case S
     of H|T then
      {F H}|{StreamMap T F}
     end
    end

    fun lazy {StreamZip S1 S2 F}
      case S1
      of H1|T1 then
        case S2
        of H2|T2 then
          {F H1 H2}|{StreamZip T1 T2 F}
        end
      end
    end

    fun lazy {StreamScale S Factor}
      {StreamMap S fun {$ H}H*Factor end}
    end

    fun lazy {StreamAdd S1 S2}
      {StreamZip S1 S2 fun {$ H1 H2} H1+H2 end}
    end

    fun lazy {StreamIntegrate Init S Dt}
      Init|{StreamIntegrate (Init+(S.1*Dt)) S.2 Dt}
    end

    fun {MakeRC R C Dt}
      fun lazy {$ S V0}
        {StreamAdd {StreamScale S R} {StreamIntegrate V0 {StreamScale S (1.0/C)} Dt}}
      end
    end

    local A = 2|3|4|A X in
      X = {StreamMap A fun {$ X} X*X end}
      if {Nth X 10} > 0 then skip end
      {System.show X}
    end

    local A = 2|3|4|A B = 9|~3|B X in
      X = {StreamZip A B fun {$ X Y} X*Y end}
      if {Nth X 10} > 0 then skip end
      {System.show X}
    end

    local A = 2|3|4|A X in
      X = {StreamScale A 5}
      if {Nth X 10} > 0 then skip end
      {System.show X}
    end

    local A = 2|3|4|A B = 9|~3|B X in
      X = {StreamAdd A B}
      if {Nth X 10} > 0 then skip end
      {System.show X}
    end

    local A = 1.0|0.0|A X in
      X = {StreamIntegrate 5.0 A 1.0}
      if {Nth X 10} > 0.0 then skip end
      {System.show X}
    end

    local A = 5.0|6.0|7.0|A X in
      X = {StreamIntegrate 2.0 A 3.0}
      if {Nth X 10} > 0.0 then skip end
      {System.show X}
    end

    local
      Ones = 1.0|Ones
      RC = {MakeRC 5.0 1.0 0.2}
      V = {RC Ones 2.0}
    in
      if {Nth V 5} > 0.0 then skip end {System.show V}
    end
  end
  {Exit 0}
end
