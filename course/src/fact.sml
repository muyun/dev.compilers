(* recursion *)
fun fact n =
    if n = 0
    then 1
    else n*fact(n-1)  (* after the recursive call, the caller had more work to do, it has to multiply n *)


fun fact1 n =
    let fun aux(n, acc) =
            if n = 0
            then acc
            else aux(n-1,acc*n) (* the result of recursive calls is the result for the caller, no remaining multiplication; no more work for the caller, the result of the recursive call is the result *)
    in
        aux(n, 1)
    end

(* note: a key idea of the optimization is that it can get a callee's result and return it immediately *)
(* tail calls: allow callee to reuse the same stack space *)

 (* this call for fact1 3, then it calls aux(3, 1) and return it, so we reuse the stack space, we replace the stack frame for fact1 3 with the stack frame for aux(3,1), now we evaluate the aux function aux(3,1) *)
val x = fact1 3

fun sum xs =
    case xs of
        [] => 0
      | x::xs' => x + sum xs'

fun sum1 xs  =
    let fun aux(xs, acc) =
            case xs of
                [] > acc
             | x::xs' =>  aux(xs', x+acc)

    in
        aux(xs, 0)
    end

val y = sum1 [3,5,4]
