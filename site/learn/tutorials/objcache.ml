(* Example of finalisation and weak pointers.
 * ocamlc unix.cma objcache.ml -o objcache
 *)

open Printf

(* In-memory format. *)
type record = { mutable name : string; mutable address : string }

(* On-disk format. *)
let record_size = 256
let name_size = 64
let addr_size = 192

(* Create a new, empty record. *)
let new_record () =
  { name = String.make name_size ' ';
    address = String.make addr_size ' ' }

(* Low-level load/save records to file. *)
let seek_record n fd =
  ignore(Unix.lseek fd (n * record_size) Unix.SEEK_SET)

let write_record record n fd =
  seek_record n fd;
  ignore(Unix.write fd record.name 0 name_size);
  ignore(Unix.write fd record.address 0 addr_size)

let read_record record n fd =
  seek_record n fd;
  ignore(Unix.read fd record.name 0 name_size);
  ignore(Unix.read fd record.address 0 addr_size)

(* Lock/unlock the nth record in a file. *)
let lock_record n fd =
  seek_record n fd;
  Unix.lockf fd Unix.F_LOCK record_size

let unlock_record n fd =
  seek_record n fd;
  Unix.lockf fd Unix.F_ULOCK record_size

(* Total number of records. *)
let nr_records = 10000

(* On-disk file. *)
let diskfile =
  Unix.openfile "users.bin" [ Unix.O_RDWR; Unix.O_CREAT ] 0o666

(* Cache of records. *)
let cache = Weak.create nr_records


(* The finaliser function. *)
let finaliser n record =
  printf "*** objcache: finalising record %d\n%!" n;
  write_record record n diskfile;
  unlock_record n diskfile

(* Get a record from the cache or off disk. *)
let get_record n =
  match Weak.get cache n with
  | Some record ->
      printf "*** objcache: fetching record %d from memory cache\n%!" n;
      record
  | None ->
      printf "*** objcache: loading record %d from disk\n%!" n;
      let record = new_record () in
      Gc.finalise (finaliser n) record;
      lock_record n diskfile;
      read_record record n diskfile;
      Weak.set cache n (Some record);
      record

(* Synchronise all records. *)
let sync_records () =
  Weak.fill cache 0 nr_records None;
  Gc.full_major ()

(* Run finalisers on exit. *)
let () =
  at_exit Gc.full_major

(* Pad or truncate a string to a particular fixed length. *)
let fix_string str size =
  let len = String.length str in
  if len < size then
    str ^ String.make (size - len) ' '
  else
    String.sub str 0 size

(* Test code. *)
let rec loop () =
  printf "Type the record number to load (0 - %d) or s to sync or q to quit: "
         (nr_records-1);
  let line = read_line () in
  if line.[0] = 's' then (
    sync_records ();
    loop ()
  )
  else if line.[0] <> 'q' then (
    let n = int_of_string line in
    let record = get_record n in
    printf "Record %d:\n  Name: %s\n  Address:\n%s\n\n"
           n record.name record.address;
    print_string "Update this record (y/n)? [n] ";
    let answer = read_line () in
    if answer.[0] = 'y' then (
      print_string "Name: ";
      let name = read_line () in
      print_string "Address: ";
      let address = read_line () in
      record.name <- fix_string name name_size;
      record.address <- fix_string address addr_size
     );
    loop ()
   )

let () =
  loop ()
