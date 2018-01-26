open Printf
open Unix

open Core
open Jg_template
open Jg_types

open Post
open Model

(** TODOs:
  * Parallelization. *)

(** Generates the blog's index pages *)
let generate_index_pages blog_model =
    blog_model

(** Generates the blog's RSS feed *)
let generate_rss_feeds blog_model =
    blog_model

let format_date {tm_wday; tm_mon; tm_mday; tm_year; _} = 
  let day_of_week = match tm_wday with
    | 0 -> "Sunday"
    | 1 -> "Monday"
    | 2 -> "Tuesday"
    | 3 -> "Wednesday"
    | 4 -> "Thursday"
    | 5 -> "Friday"
    | _ -> "Saturday" in
  let month = match tm_mon with
    | 0 -> "January"
    | 1 -> "February"
    | 2 -> "March"
    | 3 -> "April"
    | 4 -> "May"
    | 5 -> "June"
    | 6 -> "July"
    | 7 -> "August"
    | 8 -> "September"
    | 9 -> "October"
    | 10 -> "November"
    | _ -> "December" in
  Printf.sprintf "%s, %s %d, %d" day_of_week month tm_mday (tm_year + 1900)

(** Generates the blog's individual post pages *)
let generate_post_pages (blog_model:blog_model) =
  let () = Printf.printf "Building post pages" in
  let today_now = Unix.time () |> Unix.gmtime in
  let is_old x = (today_now.tm_year - x.tm_year) > 1 in
  let or_string x default = match x with
    | Some y -> Jg_types.Tstr y
    | None -> Jg_types.Tstr default
  in
  let tag_url tag = Jg_types.Tobj [
        ("name", Jg_types.Tstr tag);
        ("url", Jg_types.Tstr (String.concat ["/tags/"; tag; ".html"]))] in

  let make_model {title; datetime; tags; og_image; og_description; content; reading_time} =
    [("title", Jg_types.Tstr title);
     ("author", Jg_types.Tstr blog_model.author);
     ("keywords_list", Jg_types.Tstr "Pablo Meier engineering management tech");
     ("description_abridged", or_string og_description blog_model.description);
     ("og_description", or_string og_description blog_model.description);
     ("og_image", or_string og_image "https://morepablo.com/pabloface.png");
     ("full_uri", Jg_types.Tstr "https://morepablo.com/my-special-blog-post.html");
     ("rss_feed_uri", Jg_types.Tstr "/feeds.xml");
     ("formatted_date", Jg_types.Tstr (format_date datetime));
     ("tags", Jg_types.Tlist (List.map ~f:tag_url tags));
     ("reading_time", Jg_types.Tint reading_time);
     ("if_old", Jg_types.Tbool (is_old datetime));
     ("content", Post.all_content content |> Omd.to_html |> Jg_types.Tstr);
     ("link_to_newer", Jg_types.Tnull);
     ("link_to_older", Jg_types.Tobj [("name", Jg_types.Tstr "Go Right, man"); ("url", Jg_types.Tstr "2018/01/blockchain.html")]);
    ]
  in
  let post_page p =
    let models = make_model p in
    Jg_template.from_file ~models:models (Filename.concat blog_model.root_path "post_template.tmpl")
  in
  let page_contents = List.map ~f:post_page blog_model.posts in
  let _unused = List.map ~f:(fun x -> Printf.printf "=======\nPost:\n\n%s\n" x) page_contents in
  blog_model

(** Generates the blog's toplevel homepage *)
let generate_homepage blog_model =
    blog_model

(** Generates the blog's toplevel homepage *)
let generate_statics blog_model =
    blog_model

let build model =
    generate_index_pages model
    |> generate_rss_feeds
    |> generate_post_pages
    |> generate_homepage
    |> generate_statics
