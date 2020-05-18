(* patter matching - type check will be able to figure out the type of thing you're matching against,
no longer need to write down any explicit types for the arguments to functions or any variables  *)
fun sum_triple triple =
    case triple of
        (x, y, z) => x + y + z

(* val-binding *)
fun sum_triple1 triple =
    let val (x, y, z) = triple (* x,y,z is the pattern *)
    in
        x + y + z
    end

(* function binding - a more elegant version *)
fun sum_triple2 (x, y, z) = (* function argument x,y,z can also be a pattern *)
    x + y + z
