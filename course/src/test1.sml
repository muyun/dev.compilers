
(* tuples *)
val x = ((3,5), ((4, 8), (0, 0)))

fun div_mod (x: int, y : int)=
    (x div y, x mod y)

fun swap (pr : int*bool) =
    (#2 pr, #1 pr)
