module Raw = IslRaw 

module Sigs = Isl_Sigs

module Make () = struct
  type id = Raw.id
  type value = Raw.value
  type space = Raw.space
  type local_space = Raw.local_space
  type aff = Raw.aff
  type pw_aff
  type multi_aff
  type pw_multi_aff
  type matrix = Raw.matrix
  type constrnt_type = Equality | Inequality
  type constrnt = Raw.constrnt
  type basic_set = Raw.basic_set
  type set = Raw.set
  type union_set = Raw.union_set
  type basic_map = Raw.basic_map
  type map = Raw.map
  type union_map = Raw.union_map

  type dim_type = Isl_Types.dim_type
  type noparam = Isl_Types.noparam
  
  module CTX = struct
    let ctx = Raw.Ctx.(Isl_Utils.wrap free @@ alloc ())
  end

  module Id = Isl_Id.Make (CTX)
  module Value = Isl_Value.Make (CTX)
  module Space = Isl_Space.Make (CTX)      
  module LocalSpace = Isl_LocalSpace.Make (CTX)
  module Constraint = Isl_Constraint.Make (CTX)
  module Aff = Isl_Aff.Make (CTX)
  module Matrix = Isl_Matrix.Make (CTX)
  module BasicSet = Isl_BasicSet.Make (CTX)
  module Set = Isl_Set.Make (CTX)
  module UnionSet = Isl_UnionSet.Make (CTX)
  module BasicMap = Isl_BasicMap.Make (CTX)
  module Map = Isl_Map.Make (CTX)
  module UnionMap = Isl_UnionMap.Make (CTX)
end
