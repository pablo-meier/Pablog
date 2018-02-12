open Core


(** not exported, just a placeholder to read from the separate config file *)
type blog_metadata = {
  title : string;
  description : string;
  author : string;
  hostname : string;
  build_dir : string;
}


type blog_model = {
  title : string;
  description : string;
  author : string;
  hostname : string;
  input_fs_path : string;
  build_dir : string;

  posts_by_tag : Post.post list String.Map.t;
  static_pages : Page.page list;
}


let read_config_values lines = {
    title = "More Pablo";
    description = "Description";
    author = "Pablo Meier";
    hostname = "https://morepablo.com";
    build_dir = "bt_build";
}


(* Takes a list of posts and produces a map of each post in list
 * *)
let build_tags_map posts =
  let conditional_add k d m = match Map.find m k with
    | None -> Map.add m ~key:k ~data:[d]
    | Some xs -> Map.add m ~key:k ~data:(d::xs) in
  let tag_adder map (post:Post.post) =
    List.fold_left ~f:(fun m tag -> conditional_add tag post m) ~init:map ("all"::post.tags)
  in
  posts
    |> List.fold_left ~f:tag_adder ~init:String.Map.empty
    |> Map.map ~f:List.rev


let build_blog_model path =
  let conf = read_config_values (Filename.concat path "frog.rkt") in
  let posts = Files.file_contents_in_dir (Filename.concat path "posts")
    |> List.map ~f:Post.make_post
    |> List.sort ~cmp:Post.compare_post_dates
    |> Post.form_prev_next_links in
  let statics = Files.file_contents_in_dir (Filename.concat path "pages")
    |> List.map ~f:Page.to_page in
  {
    title = conf.title;
    description = conf.description;
    author = conf.author;
    input_fs_path = path;
    hostname = conf.hostname;
    build_dir = conf.build_dir;

    posts_by_tag = build_tags_map posts;
    static_pages = statics;
  }
