(* patterns *)

exception ListLengthMismatch

(* nested patterns *)
fun zip3 list_triple =
    case list_triple of
        ([], [], []) => [] (* pattern for a tuple with three patterns for lists in it *)
     | (hd1::tl1, hd2::tl2, hd3::tl3) => (hd1, hd2, hd3)::zip3(tl1, tl2, tl3)
     | _ => raise ListLengthMismatch

fun unzip3 lst =
    case lst of
        [] => ([], [], [])
      | (a,b,c):: t1 => let val (l1,l2,l3) = unzip3 t1 (* a,b,c is the head of list *)
                        in  (a::l1, b::l2, c::l3)
                        end


fun len xs =
    case xs of
        [] => 0
     | _::xs' => 1 + len xs'
