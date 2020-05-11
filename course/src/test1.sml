
(* tuples *)
val x = ((3,5), ((4, 8), (0, 0)))

fun div_mod (x: int, y : int)=
    (x div y, x mod y)

fun swap (pr : int*bool) =
    (#2 pr, #1 pr)


fun append (xs : int list, ys : int list) =
    if null xs
    then ys
    else (hd xs) :: append(tl xs, ys)

(* local binding *)
fun silly () =
    let val x = 1
    in
        (let val x =2 in x+1 end) + (let val y=x+2 in y+1 end )
    end

fun countup_from1 (x : int) =
    let fun count (from : int, to : int) = (* local function binding *)
            if from = to
            then to :: []
            else from :: count(from+1, to)
    in
        count (1, x)
    end

fun countup_from1_better (x : int) =
    let fun count (from : int) =
            if from = x
            then x :: []
            else from :: count(from+1)
    in
        count 1
    end

(* do not do repeated work that might do repeated work, just save the recursive results*)

(* options *)
fun better_max(xs : int list) =
    if null xs
    then NONE (* option value carrying nothing *)
    else
        let val tl_ans = better_max(tl xs)
        in if isSome tl_ans andalso valOf tl_ans > hd xs
           then tl_ans
           else SOME (hd xs) (* option carrying the one value *)
        end
