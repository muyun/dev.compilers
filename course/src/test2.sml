
(* no mutation in ML *)
(* In ML, we create aliases all the time *)
fun append (xs : int list, ys : int list) =
    if null xs
    then ys (* return ys, not a copy of ys *)
    else hd xs :: append (tl(xs), ys)

val x = [2,4]
val y = [5, 3, 0]
val z = append(x,y) (* *)

(* tuples are immutable, so the next two are indistinguish *)
fun sort_pair (pr : int * int) =
    if #1 pr < #2 pr
    then pr (* a bit better, avoid making a new pair, **tuples are not changed** *)
    else (#2 pr, #1 pr)

fun sort_pair_2 (pr : int * int) =
    if #1 pr < #2 pr
    then (#1 pr, #2 pr)
    else (#2 pr, #1 pr)

val x = (3, 4)
val y = sort_pair x
val z = #1 y
