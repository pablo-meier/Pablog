open Core
open ISO8601.Permissive
open Re2.Std
open Re2.Infix
open Omd


(* Static pages are simpler *)
type page = {
  title : string;
  description : string;
  fs_path : string;
  contents : Omd.t;
}


let to_page (record:Files.file_with_contents) =
  let contents =
    record.lines
    |> Utils.add_newlines
    |> Omd.of_string
  in
  {
    title = "Static Page";
    description = "Description";
    fs_path = record.name;
    contents = contents;
  }
