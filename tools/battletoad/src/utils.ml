open Core

(** Writable list from a string list *)
let from_string_list input =
  let folded = String.concat ~sep:"," input in
  "[" ^ folded ^ "]"


(** Writable String from string option *)
let option_maybe x = match x with
  | Some v -> v
  | None -> "None"


let fst (x,_) = x
let snd (_,y) = y
