(* this is my first sml program. *)

val x = 34;
(* static env: x : int *)
(* dynamic env: x -> 34 *)

val y = 17;
(* static env: x:int, y:int *)
(* dynamic env: x ->34, y -> 17 *)

val x = 5; (* not an assignment statement *)
(* shadow: a different mapping for a in a different environment *)
(* create a new dynamic env: x->34, y->17, shadowing x-> 5 *)

val z = (x + y) + (y + 2);
(* static env: *)
(* type checking: dynamic environment: x -> 34, y-> 17, z -> 71 *)
