---
layout: post
title: "Notes on programming language"
date: 2020-04-06
comments: true
categories: [home,notes]
abstract: "[Updating] Notes on the core ideas programming languages, especially on functional programming"
---

#### functional programming

#### Standard ML
  * functional programming

  * sml-ch1
    - syntax is how you write sth
    - **semantics** is what that something means
      + **Type-checking** rules (before program runs) in current static environment
        - what type a binding has
        - produces a type or fail
        -
      + **Evaluating** the bindings (in the dynamic environment)
        - a value or an error or an infinite loop of the preceding bindings
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
    - tuples are syntactic sugar for records with field names 1, 2, ...

    - type synonyms -> a convenience for talking about types
    - datatypes bindings
      + better to use pattern-matching ofr accessing list and option

    -
