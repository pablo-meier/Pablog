(** Ultimately, the content gets written as _something,_ usually as a page, or
 * part of a page. Every entity we write out gets written from here. *)

type page_type = PostPage | IndexPage | RssFeed | Homepage | StaticPage

type page = {
  file_loc : string;
  of_type : page_type;
  contents : string
}
