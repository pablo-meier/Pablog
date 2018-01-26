open Printf
open Unix

open Core
open ISO8601.Permissive
open Re2.Std
open Re2.Infix
open Omd

(** Data/functions related to posts. *)

type post_body = Split of (Omd.t * Omd.t) | Whole of Omd.t

(** Record for what we read from the input files. *)
type post_input = {
  title : string;
  datetime : Unix.tm;
  tags : string list;
  og_image : string option;
  og_description : string option;
  content : post_body;
}

(** Record for a completed, publishable post *)
type post = {
  title : string;
  datetime : Unix.tm;
  tags : string list;
  og_image : string option;
  og_description : string option;
  content : post_body;

  reading_time : int;
}


let add_newlines = String.concat ~sep:"\n"


let all_content = function
  | Split (top, bottom) -> List.append top bottom
  | Whole all -> all


(** Doing the naive thing Medium stated they did way back when:
  *
  * > Read time is based on the average reading speed of an adult (roughly 275 WPM).
  * > We take the total word count of a post and translate it into minutes. Then, we
  * > add 12 seconds for each inline image. Boom, read time.
  *
  * May do the image count thing too, but for now, just naive split into words, ignore
  * inline Markdown or HTML.
  *)
let reading_time_for content =
  let rec words_in = function
    | [] -> 0
    | x::xs -> let rst = match x with
      | Omd.H1 x -> words_in x
      | Omd.H2 x -> words_in x
      | Omd.H3 x -> words_in x
      | Omd.H4 x -> words_in x
      | Omd.H5 x -> words_in x
      | Omd.H6 x -> words_in x
      | Omd.Paragraph x -> words_in x
      | Omd.Text x -> String.length x
      | Omd.Emph x -> words_in x
      | Omd.Bold x -> words_in x
      | Omd.Ul x -> List.map ~f:words_in x |> List.fold_left ~f:(+) ~init:0
      | Omd.Ol x -> List.map ~f:words_in x |> List.fold_left ~f:(+) ~init:0
      | Omd.Ulp x -> List.map ~f:words_in x |> List.fold_left ~f:(+) ~init:0
      | Omd.Olp x -> List.map ~f:words_in x |> List.fold_left ~f:(+) ~init:0
      | Omd.Blockquote x -> words_in x
      | _ -> 0
    in rst + words_in xs
  in
  let corpus = all_content content in
  words_in corpus
    |> Pervasives.float_of_int
    |> (fun x -> x /. 275.0)
    |> Pervasives.ceil
    |> Pervasives.int_of_float


let metadata_regex : Re2.regex = Re2.create_exn "^    ([^:]+): *(.+)$"


(** Given a bunch of non-metadata lines, returns it as either Whole or Split. We have to
 * do the Markdown parsing as whole since the links at the top might refer to links
 * at the bottom, so we pattern match the split later. *)
let handle_content contents = 
  let is_separator x = x <> Omd.Html_comment "<!-- more -->" in
  add_newlines contents
    |> Omd.of_string
    |> List.split_while ~f:is_separator
    |> function
      | (top, []) -> Whole top
      | (top, bottom) -> Split (top, List.drop bottom 3)
      (* We drop the first 3 here because they include the comment + newlines *)


(** At a high level, we go iterate through lines. First we take metadata
 * lines as long as possible. When they no longer match, we add to "prev"
 * until we optionally match the "<!-- more" signal, after which we
 * add to the end. *)
let split_contents lines =
  let rec split_meta remaining has_finished_meta meta rest =
    match remaining with
    | [] -> (List.rev meta, List.rev rest)
    | x::xs -> match (has_finished_meta, Re2.matches metadata_regex x) with
      | (false, true) -> split_meta xs false (x::meta) rest
      | (false, false) -> split_meta xs true meta rest
      | (true, _) -> split_meta xs has_finished_meta meta (x::rest) in
  let (meta, contents) = split_meta lines false [] [] in
  let parsed = handle_content contents in
  (meta, parsed)


(** Go through all your lines and eventually construct a tuple. This is designed inefficiently
 * but it's such a small amount of data anyways... *)
let handle_metadata data =

  let metadata_handle str = 
    let as_pair x = 
      let matches = Re2.find_submatches_exn metadata_regex x in
      (matches.(1) |> Option.value_exn, matches.(2) |> Option.value_exn)
    in
    List.map ~f:as_pair data
      |> List.filter ~f:(fun (x, _) -> String.equal x str)
      |> function
        | [(_, y)] -> Some (String.strip y)
        | _ -> None
  in

  let to_datetime = Fn.compose Unix.gmtime ISO8601.Permissive.datetime in

  let title = metadata_handle "Title" |> Option.value_exn in
  let datetime = metadata_handle "Date" |> Option.value_exn |> to_datetime in
  let tags = metadata_handle "Tags" |> Option.value_exn |> String.split ~on:',' |> List.map ~f:String.strip in
  let og_img = metadata_handle "og_image" in
  let og_desc = metadata_handle "og_description" in
  (title, datetime, tags, og_img, og_desc)


let make_post_input contents =
  let (metadata, content) = split_contents contents in
  let (title, datetime, tags, og_img, og_desc) = handle_metadata metadata in
  {
    title = title;
    datetime = datetime;
    tags = tags;
    og_image = og_img;
    og_description = og_desc;
    content = content;
  }


(** Once we've parsed the input, this does additional calculation *)
let post_from_input ({title; datetime; tags; og_image; og_description; content} : post_input)=
  {
    title = title;
    datetime = datetime;
    tags = tags;
    og_image = og_image;
    og_description = og_description;
    content = content;

    reading_time = reading_time_for content;
  }


(** Given a string input (presumably the contents of a file), produce a Post.
 *
 * The first thing we do is create a post_input which is a raw reading of
 * the contents, after which we can calculate the remaining values in a full-blown
 * post.
 * *)
let make_post contents = make_post_input contents |> post_from_input


(** Do JSON libraries make this any easier? _Still_ no Deriving Show? O_O *)
let post_to_string {title; datetime; tags; og_image; og_description;
                    content; reading_time } =
  let get_timestring x = Unix.mktime x |> (fun (x,_) -> x) |> ISO8601.Permissive.string_of_datetime in
  let time_str = get_timestring datetime in
  let content_str = match content with
    | Split (a,b) -> "Split(" ^ (Omd.to_html a) ^ " | " ^ (Omd.to_html b) ^ ")"
    | Whole x -> "Whole(" ^ (Omd.to_html x) ^ ")" in

  let tag_string = Utils.from_string_list tags in
  let og_img = Utils.option_maybe og_image in
  let og_desc = Utils.option_maybe og_description in
  Printf.sprintf "Post(title: %s; time: %s; tags: %s; og_image: %s; og_desc: %s; content: %s; reading_time: %d)"
                  title time_str tag_string og_img og_desc content_str reading_time