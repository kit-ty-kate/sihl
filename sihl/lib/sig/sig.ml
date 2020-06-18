type repo = {
  clean : Core_db.connection -> unit Core_db.db_result;
  migration : Migration_sig.t;
}

module type REPO = sig
  val migrate : unit -> Migration_sig.t

  val clean : Core_db.connection -> unit Core_db.db_result
end
