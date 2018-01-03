open Printf
open Core


(** Given a source path, generates the destination path.*)
let generate_dest_path srcpath =
    let filename =  Filename.basename srcpath in
    let {Core.Unix.tm_year = year_unchanged; Core.Unix.tm_mon = month_unchanged; _} = Unix.time () |> Unix.gmtime in
    let (year, month) = (year_unchanged + 1900, month_unchanged + 1) in
    let destpath = Printf.sprintf "static/img/%d/%d/%s" year month filename in
    (srcpath, destpath)

(** Moves the source file to dest file location, creating directories as necessary.
 * Returns the path of copied file. 
 *
 * Also, Bing the phrase "copy file ocaml" for a cry *)
let copy_original (srcpath, destpath) =
    let () = Filename.dirname destpath |> Unix.mkdir_p in
    let _status = Printf.sprintf "cp %s %s" srcpath destpath |> Sys.command in
    destpath

(** Preserves the directory, takes last bit and appends _THUMB (or somesuch). *)
let thumbnail_path_from img = 
    let suffix = "_THUMB" in
    let (prefix, ext_maybe) = Filename.split_extension img in
    let non_ext = prefix ^ suffix in
    match ext_maybe with
    | None -> non_ext
    | Some x -> non_ext ^ "." ^ x

(** Returns a pair for the thumbnail and fullsize versions of an image. If an image
 * is already under the width threshold, they are equivalent. If it is over the
 * width threshold, we rename the original to <file>_FULLSIZE or somesuch and replace
 * the original file with a resized version. *)
let thumbnail_and_fullsize fullsize =
    let total_width = 700 in
    let thumb_path = thumbnail_path_from fullsize in
    let _status = Printf.sprintf "magick %s -resize '%d' %s" fullsize total_width thumb_path |> Sys.command in
    (thumb_path, fullsize)

(** Remove the first part of the path *)
let strip_first path =
    Filename.parts path
    |> List.tl_exn
    |> List.fold_left ~f:Filename.concat ~init:"/"

(** Given a relative path to thumbnail and fullsize, produce a snippet of HTML that we
 * can introduce into our Markdown file to include the image. *)
let write_html_output (thumbnail, fullsize) =
    let without_static_fullsize = strip_first fullsize in
    let without_static_thumbnail = strip_first thumbnail in
    Printf.sprintf
{|<div class="caption-img-block" style="margin: 25px auto">
  <a href="%s" target="blank"><img src="%s" alt="FILLME. Click for full size." style="margin: 15px auto;" /></a>
  <p style="font-style: italic; text-align: center; font-size: small">CAPTION</p>
</div>|} without_static_fullsize without_static_thumbnail


(** Toplevel flow *)
let process_image srcpath =
    generate_dest_path srcpath
    |> copy_original
    |> thumbnail_and_fullsize 
    |> write_html_output
    |> Printf.printf "%s\n"



let spec =
    let open Command.Spec in
    empty
    +> anon ("filename" %: file)

let command =
    Command.basic
      ~summary:"EZ image insertion for Pablo's blog"
      ~readme:(fun () ->
{|My blog is built on a static site generator, so images don't really have a UI
to get added, per se. This program takes a file I'd like to insert into a blog
post and gives me markup to insert it apppropriately.

By "appropriately" I mean per Ye Olde WordPress upload standards, which is
what I decided way long ago. URLs look like /img/<year>/<month>/image.ext, and
I have both a thumbnail version and a full-size. Finally I need it in decent
directory structure, with the ability to caption.|})
      spec
      (fun filename () -> process_image filename)

let () = Command.run ~version:"1.0" ~build_info:"RWO" command
