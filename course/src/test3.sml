(* records *)
val my_niece = {name = "Amelia", id = 41123-12}

(* Datatype Binding *)
datatype mytype = TwoInts of int * int
                |  Str of string
                |  Pizza

fun f x = (* f has type mytype -> int *)
    case x of
        Pizza => 3
      | TwoInts(i1, i2) => i1+i2
      | Str s => 8


datatype exp = Constant of int (* use self-reference *)
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp

(* fun eval to evaluates the datatype, a case-expression *)
fun eval e = (* eval has type exp -> int *)
    case e of
        Constant i => i
      | Negate e2 => ~ (eval e2)
      | Add(e1, e2) => (eval e1) + (eval e2)
      | Multiply(e1, e2) => (eval e1) * (eval e2)

val example_exp : exp = Add (Constant 19, Negate (Constant 4))
val example_ans : int = eval example_exp
