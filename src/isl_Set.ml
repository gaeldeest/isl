open Isl_Types
open Isl_Sigs

module Make (CTX: CTX): SET
  with type t = IslRaw.set
   and type space = IslRaw.space
   and type basic_set = IslRaw.basic_set
   and type union_set = IslRaw.union_set
   and type constrnt = IslRaw.constrnt
= struct
  type t = IslRaw.set
  type space = IslRaw.space
  type basic_set = IslRaw.basic_set
  type union_set = IslRaw.union_set
  type constrnt = IslRaw.constrnt

  module M = IslRaw.Set
  
  let copy = M.copy
  let wrap = Isl_Utils.wrap M.free

  let empty s = wrap @@ M.empty (IslRaw.Space.copy s)
  let universe s = wrap @@ M.universe (IslRaw.Space.copy s)
  let nat_universe s = wrap @@ M.nat_universe (IslRaw.Space.copy s)
  let add_constraint s c = wrap @@ M.add_constraint (copy s) (IslRaw.Constraint.copy c)

  let from_basic_set bs = wrap @@ M.from_basic_set (IslRaw.BasicSet.copy bs)
  let from_union_set us = wrap @@ M.from_union_set (IslRaw.UnionSet.copy us)        

  let to_string = Isl_Utils.print_with CTX.ctx IslRaw.Printer.print_set
end
