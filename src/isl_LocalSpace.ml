open Isl_Utils
open Isl_Sigs
open Isl_Types
open IslRaw

module Make (CTX: CTX) : LOCAL_SPACE with
  type t = local_space and type space = IslRaw.space
= struct
  type t = local_space
  type space = IslRaw.space

  let copy = LocalSpace.copy
  let wrap = wrap LocalSpace.free

  let from_space s = wrap @@ LocalSpace.from_space (Space.copy s)  
end
