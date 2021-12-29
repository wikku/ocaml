open EffectHandlers

type breaklist =
  | (::) : (string * 'a) * breaklist -> breaklist
  | [] : breaklist

type _ eff += Break : breaklist -> unit eff

(* TODO: check for illegal variable names *)
let break bl = perform (Break bl)

let rec list_of_breaklist = function
  | [] -> List.[]
  | (n, v) :: tl -> List.(::) ((n, Obj.repr v), list_of_breaklist tl)
