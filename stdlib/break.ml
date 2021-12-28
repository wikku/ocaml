open EffectHandlers

type breaklist =
  | (::) : (string * 'a) * breaklist -> breaklist
  | [] : breaklist

type _ eff += Break : breaklist -> unit eff

(* TODO: check for illegal variable names *)
let break bl = perform (Break bl)
