open Core

type blog_model = {
  title : string;
  description : string;
  author : string;
  posts : Post.post list;
  static_pages : Page.page list;
  root_path : string;
}


(** not exported, just a placeholder to read from the separate config file *)
type blog_metadata = {
  title : string;
  description : string;
  author : string;
}


let read_config_values lines =
  {
    title = "More Pablo";
    description = "Description";
    author = "Pablo Meier";
  }


let build_blog_model path =
  let conf = read_config_values (Filename.concat path "frog.rkt") in
  let posts = Files.file_contents_in_dir (Filename.concat path "posts")
    |> List.map ~f:(fun x -> Post.make_post x)
    |> List.sort ~cmp:Post.compare_post_dates in
  {
    title = conf.title;
    description = conf.description;
    author = conf.author;
    posts = posts;
    static_pages = [];
    root_path = path;
  }
