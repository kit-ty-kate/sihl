module Service = Email_service
module Sig = Email_sig

module Template : sig
  module Data : sig
    type t

    val pp : Format.formatter -> t -> unit

    val show : t -> string

    val equal : t -> t -> bool

    val empty : t

    val add : key:string -> value:string -> t -> t

    val make : (string * string) list -> t
  end

  type t

  val make : ?text:string -> ?html:string -> string -> t

  val created_at : t -> Ptime.t

  val content_html : t -> string

  val content_text : t -> string

  val name : t -> string

  val id : t -> string

  val pp : Format.formatter -> t -> unit

  val show : t -> string

  val equal : t -> t -> bool

  val t : t Caqti_type.t

  val render : Data.t -> t -> string
end

module DevInbox = Email_core.DevInbox

type t = Email_core.t

val make :
  sender:string ->
  recipient:string ->
  subject:string ->
  content:string ->
  ?cc:string list ->
  ?bcc:string list ->
  html:bool ->
  ?template_id:string ->
  ?template_data:Template.Data.t ->
  unit ->
  t

val template_data : t -> Template.Data.t

val template_id : t -> string option

val html : t -> bool

val bcc : t -> string list

val cc : t -> string list

val content : t -> string

val subject : t -> string

val recipient : t -> string

val sender : t -> string

val set_content : string -> t -> t

val pp : Format.formatter -> t -> unit

val show : t -> string

val equal : t -> t -> bool
