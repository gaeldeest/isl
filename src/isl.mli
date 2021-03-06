module Sigs : module type of Isl_Sigs
  
module Make : functor () -> sig
  type id
  type value
  type space
  type local_space
  type aff
  type pw_aff
  type multi_aff
  type pw_multi_aff
  type matrix
  type constrnt_type = Equality | Inequality
  type constrnt
  type basic_set
  type set
  type union_set
  type basic_map
  type map
  type union_map

  type dim_type =  [ `Param | `In | `Out | `Set ]
  type noparam = [ `In | `Out | `Set ]

  module Id : Sigs.ID
    with type t = id

  module Value : Sigs.VALUE
    with type t = value

  module Space : Sigs.SPACE
    with type t = space
     and type id := id  
  
  module LocalSpace : Sigs.LOCAL_SPACE
    with type t = local_space
     and type space := space

  module Constraint : Sigs.CONSTRAINT
    with type t = constrnt
     and type value := value
     and type local_space := local_space
     and type aff := aff

  module Aff : Sigs.AFF
    with type t = aff

  module Matrix : Sigs.MATRIX
    with type t = matrix

  module BasicSet : Sigs.BASIC_SET
    with type t = basic_set
     and type space := space
     and type local_space := local_space
     and type matrix := matrix
     and type constrnt := constrnt

  module Set : Sigs.SET
    with type t = set
     and type space := space
     and type basic_set := basic_set
     and type union_set := union_set
     and type constrnt := constrnt

  module UnionSet : Sigs.UNION_SET
    with type t = union_set
     and type space := space
     and type set := set

  module BasicMap : Sigs.BASIC_MAP
    with type t = basic_map
     and type space := space
     and type local_space := local_space
     and type constrnt := constrnt

  module Map : Sigs.MAP
    with type t = map
     and type space := space
     and type basic_map := basic_map
     and type union_map := union_map
     and type constrnt := constrnt

  module UnionMap : Sigs.UNION_MAP
    with type t = union_map
     and type space := space
     and type map := map
end
