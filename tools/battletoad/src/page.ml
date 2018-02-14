open Core
open ISO8601.Permissive
open Re2.Std
open Re2.Infix
open Omd


type page = {
  title : string;
  description : string;
  fs_path : string;
  contents : Omd.t;
}

type t = page


let title {title; _} = title
let description {description; _} = description
let fs_path {fs_path; _} = fs_path
let contents {contents; _} = contents


(** TODO: Smarter way to get a proper title + description for pages *)
let to_page record =
  let contents =
    Files.lines record
    |> Utils.add_newlines
    |> Omd.of_string
  in
  {
    title = "Static Page";
    description = "Description";
    fs_path = Files.name record;
    contents = contents;
  }
