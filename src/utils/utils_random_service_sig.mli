module type SERVICE = sig
  include Core.Container.Service.Sig

  val base64 : bytes:int -> string
  (** Generate a base64 string containing number of [bytes] that is safe to use in URIs. *)

  val configure : Core.Configuration.data -> Core.Container.Service.t
end
