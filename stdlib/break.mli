open EffectHandlers

type breaklist =
  | (::) : (string * 'a) * breaklist -> breaklist
  | [] : breaklist

type _ eff += private Break : breaklist -> unit eff

val break : breaklist -> unit

val list_of_breaklist : breaklist -> (string * Obj.t) list
