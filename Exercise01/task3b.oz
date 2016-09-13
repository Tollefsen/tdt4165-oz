functor
import
  System
  Application(exit:Exit)
define
  X = "This is a string"
  thread {System.showInfo Y} end
  Y = X
  {Exit 0}
end
/*
Why do you think showInfo can print Y before it is assigned?
  The statement "thread S end" starts a new thread that runs concurrently with the current thread. Threads suspends when encountering unbound variables, and then resumes when the variable is bound.
Why is this behaviour useful?
  This behaviour can help if we want a specific part of our program to wait for an input.
What does the statement Y = X do?
  It makes Y point to the same memory as X. I believe that the exact operation is a lot more complicated, but I guess that you dont want the long answear.
*/
