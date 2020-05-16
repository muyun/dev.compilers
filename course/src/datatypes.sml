(* datatype bindings can describe recursive structures *)

datatype int_list = Empty
                  | Cons of int * int_list

val x = Cons(4, Cons(23, Cons(2008, Empty)))
