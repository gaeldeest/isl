open Ctypes
open Foreign
open IslRaw_Types

let copy = foreign "isl_set_copy" (set @-> returning set)
let free = foreign "isl_set_free" (set @-> returning void)
let empty = foreign "isl_set_empty" (space @-> returning set)
let universe = foreign "isl_set_universe" (space @-> returning set)
let nat_universe = foreign "isl_set_nat_universe" (space @-> returning set)
let add_constraint = foreign "isl_set_add_constraint" (set @-> constrnt @-> returning set)
let from_basic_set = foreign "isl_set_from_basic_set" (basic_set @-> returning set)
let from_union_set = foreign "isl_set_from_union_set" (union_set @-> returning set)    
