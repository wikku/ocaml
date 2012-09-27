(* with module *)

module type S = sig type t and s = t end;;
module type S' = S with type t := int;;

module type S = sig module rec M : sig end and N : sig end end;;
module type S' = S with module M := String;;

(* with module type *)
(*
module type S = sig module type T module F(X:T) : T end;;
module type T0 = sig type t end;;
module type S1 = S with module type T = T0;;
module type S2 = S with module type T := T0;;
module type S3 = S with module type T := sig type t = int end;;
module H = struct
  include (Hashtbl : module type of Hashtbl with
           type statistics := Hashtbl.statistics
           and module type S := Hashtbl.S
           and module Make := Hashtbl.Make
           and module MakeSeeded := Hashtbl.MakeSeeded
           and module type SeededS := Hashtbl.SeededS
           and module type HashedType := Hashtbl.HashedType
           and module type SeededHashedType := Hashtbl.SeededHashedType)
end;;
*)

(* A subtle problem appearing with -principal *)
type -'a t
class type c = object method m : [ `A ] t end;;
module M : sig val v : (#c as 'a) -> 'a end =
  struct let v x = ignore (x :> c); x end;;

(* PR#4838 *)

let id = let module M = struct end in fun x -> x;;

(* PR#4511 *)

let ko = let module M = struct end in fun _ -> ();;
