open Core

type blog_model = {
  title : string;
  description : string;
  author : string;
  hostname : string;
  input_fs_path : string;
  build_dir : string;

  posts : Post.post list;
  static_pages : Page.page list;
}


(** not exported, just a placeholder to read from the separate config file *)
type blog_metadata = {
  title : string;
  description : string;
  author : string;
  hostname : string;
  build_dir : string;
}


let read_config_values lines =
  {
    title = "More Pablo";
    description = "Description";
    author = "Pablo Meier";
    hostname = "https://morepablo.com";
    build_dir = "bt_build";
  }


let build_blog_model path =
  let conf = read_config_values (Filename.concat path "frog.rkt") in
  let posts = Files.file_contents_in_dir (Filename.concat path "posts")
    |> List.map ~f:(fun x -> Post.make_post x)
    |> List.sort ~cmp:Post.compare_post_dates
    |> Post.form_prev_next_links in
  {
    title = conf.title;
    description = conf.description;
    author = conf.author;
    input_fs_path = path;
    hostname = conf.hostname;
    build_dir = conf.build_dir;

    posts = posts;
    static_pages = [];
  }
