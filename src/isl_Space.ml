open Isl_Utils
open Isl_Sigs
open Isl_Types
open IslRaw

module Make (CTX: CTX) : SPACE with
  type t = space and type id = IslRaw.id 
= struct
  open CTX
  
  type t = space
  type id = IslRaw.id

  let wrap = wrap Space.free
  let copy = Space.copy

  let of_int = Unsigned.UInt.of_int

  let alloc ~nparam ~nin ~nout = wrap @@ Space.alloc ctx (of_int nparam) (of_int nin) (of_int nout)
  let params_alloc ~nparam = wrap @@ Space.params_alloc ctx (of_int nparam)
  let set_alloc ~nparam ~ndim = wrap @@ Space.set_alloc ctx (of_int nparam) (of_int ndim)

  let num_dims space dim_type = Unsigned.UInt.to_int @@
    Space.dim space (to_raw_dt dim_type)

  let is_map = Space.is_map
  let is_set = Space.is_set
  let is_params = Space.is_params

  let is_equal = Space.is_equal
  let is_domain = Space.is_domain
  let is_range = Space.is_range
  let tuple_is_equal s1 t1 s2 t2 = Space.tuple_is_equal s1 (to_raw_dt t1) s2 (to_raw_dt t2)

  let set_dim_id s dim_type pos id =  wrap @@
    Space.set_dim_id (copy s) (to_raw_dt dim_type) (Unsigned.UInt.of_int pos) id
  let has_dim_id s dim_type pos = Space.has_dim_id s (to_raw_dt dim_type) (Unsigned.UInt.of_int pos)
  let get_dim_id s dim_type pos =
    if has_dim_id s dim_type pos then
      Some (Space.get_dim_id s (to_raw_dt dim_type) (Unsigned.UInt.of_int pos))
    else None
  let set_dim_name s dim_type pos name =  wrap @@
    Space.set_dim_name (copy s) (to_raw_dt dim_type) (Unsigned.UInt.of_int pos) name
  let has_dim_name s dim_type pos = Space.has_dim_name s (to_raw_dt dim_type) (Unsigned.UInt.of_int pos)
  let get_dim_name s dim_type pos = Space.get_dim_name s (to_raw_dt dim_type) (Unsigned.UInt.of_int pos)

  let find_dim_by_id s dim_type id =
    let pos = Space.find_dim_by_id s (to_raw_dt dim_type) id in
    if (pos < 0) then None else Some pos

  let find_dim_by_name s dim_type name =
    let pos = Space.find_dim_by_name s (to_raw_dt dim_type) name in
    if (pos < 0) then None else Some pos          

  let set_tuple_id s dim_type id = wrap @@
    Space.set_tuple_id (copy s) (to_raw_dt dim_type) (Id.copy id)

  let reset_tuple_id s dim_type = wrap @@
    Space.reset_tuple_id (copy s) (to_raw_dt dim_type)

  let has_tuple_id s dim_type = Space.has_tuple_id s (to_raw_dt dim_type)
  let get_tuple_id s dim_type =
    if has_tuple_id s dim_type then
      Some (Space.get_tuple_id s (to_raw_dt dim_type))
    else None

  let set_tuple_name s dim_type name = wrap @@
    Space.set_tuple_name (copy s) (to_raw_dt dim_type) name

  let has_tuple_name s dim_type = Space.has_tuple_name s (to_raw_dt dim_type)
  let get_tuple_name s dim_type = Space.get_tuple_name s (to_raw_dt dim_type)

  let domain s = wrap @@ Space.domain (copy s)
  let from_domain s = wrap @@ Space.from_domain (copy s)
  let range s = wrap @@ Space.range (copy s)
  let from_range s = wrap @@ Space.from_range (copy s)
  let domain_map s = wrap @@ Space.domain_map (copy s)
  let range_map s = wrap @@ Space.range_map (copy s)
  let params s = wrap @@ Space.params (copy s)
  let set_from_params s = wrap @@ Space.set_from_params (copy s)
  let reverse s = wrap @@ Space.reverse (copy s)
  let join s1 s2 = wrap @@ Space.join (copy s1) (copy s2)
  let align_params s1 s2 = wrap @@ Space.join (copy s1) (copy s2)
  let insert_dims s dim_type ~at ~n = wrap @@
    Space.insert_dims (copy s) (to_raw_dt dim_type) (Unsigned.UInt.of_int at) (Unsigned.UInt.of_int n)
  let add_dims s dim_type ~n = wrap @@
    Space.add_dims (copy s) (to_raw_dt dim_type) (Unsigned.UInt.of_int n)
  let drop_dims s dim_type ~at ~n = wrap @@
    Space.drop_dims (copy s) (to_raw_dt dim_type) (Unsigned.UInt.of_int at) (Unsigned.UInt.of_int n)
  let move_dims s ~to_tuple ~to_pos ~from_tuple ~from_pos ~n = wrap @@
    Space.move_dims (copy s) (to_raw_dt to_tuple) (Unsigned.UInt.of_int to_pos) (to_raw_dt from_tuple) (Unsigned.UInt.of_int from_pos) (Unsigned.UInt.of_int n)

  let map_from_set s = wrap @@ Space.map_from_set (copy s)
  let map_from_domain_and_range domain range = wrap @@ Space.map_from_domain_and_range (copy domain) (copy range)
  let zip s = wrap @@ Space.zip (copy s)
  let curry s = wrap @@ Space.curry (copy s)
  let uncurry s = wrap @@ Space.uncurry (copy s)

  let to_string = print_with ctx IslRaw.Printer.print_space
end
