#### notes about the code ideas in programming languages
  * functional programming

  * sml-ch1
    - syntax is just how you write sth
    - **semantics** is what that something means
      + Type-checking rules (before program runs) in current static environment
        - what type a binding has
        - produces a type or fail
        -

      + Evaluation rules (**assuming it does type check**, how does it perform computation in order to produce a result
        - how a binding is evaluated
        - a value or an error or an infinite loop
        - look up value in current dynamic environment

    - **idioms** are the common approaches to using langguage features
      + Recursion
      + Let -> local binding

    - libraries
      + standard

    - tools
      + REPL  -> quick try-something-out
      + debugger

    - **immutation data**
      + **it is just a mapping, not assignment statement**, a tuple, or a list
      + No constructs for mutating the data we have build. No way to change the contents of a binding, a tuple,or a list
      + don't worry about the alias or copy like in java
      + or, like java, you have to care whether alias or copy, and in order to avoid the mutable data is been changed

  * sml-ch2




#### docs
  * standard ML
    - SPC m s b -> Send buffer to REPL
    - ctr-c ctr-s -> send buffer to REPL
    - C-c M-o in the REPL buffer

  * spacemacs
    - y y -> copy line
    - y d -> copy the line
