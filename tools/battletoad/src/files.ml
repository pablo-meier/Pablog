(** "Imperative shell" functions for dealing with the filesystem. *)
open Core
open Re2.Std
open Re2.Infix

type file_with_contents = {
  name : string;
  lines : string list;
}


let to_record x =
  {name = x; lines = In_channel.read_lines x}


let whitelist = [".md$"; ".html$"]
let whitelist_regexes = List.map ~f:Re2.create_exn whitelist
let in_whitelist x = List.exists whitelist_regexes ~f:(fun y -> Re2.matches y x)

(** Retrieves files from a directory and their contents as lines *)
let file_contents_in_dir dirname =
  Sys.readdir dirname
    |> Array.to_list
    |> List.map ~f:(Filename.concat dirname)
    |> List.filter ~f:in_whitelist
    |> List.map ~f:to_record
