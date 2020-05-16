(* datatype bindings can describe recursive structures *)
(* it is a better style to use pattern-matching for accessing list and option values *)
datatype int_list = Empty
                  | Cons of int * int_list

val x:int_list = Cons(4, Cons(23, Cons(2008, Empty)))


fun append(xs : int list, ys : int list)=
    if null xs
    then ys
    else (hd xs) :: append(tl xs, ys)

fun append1(xs, ys) =
    case xs of
        [] => ys
      | x :: xs' => x :: append(xs', ys)

val y = append( [1], [2,3,5])
val y1  = append1 ([5,8], [2,3,5])


fun inc_or_zero intoption =
    case intoption of
        NONE => 0
      | SOME i => i+1

val z = inc_or_zero (SOME 5)
