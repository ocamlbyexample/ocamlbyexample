open Sys
open Filename

let is_markdown filename = check_suffix filename ".md"

let read_file filename =
  let in_channel = open_in filename in
  let rec read_lines acc =
    try
      let line = input_line in_channel in
      read_lines (acc ^ "\n" ^ line)
    with
    | End_of_file ->
      close_in in_channel;
      acc
  in
  read_lines ""

let split_lines content =
  let files = Str.split (Str.regexp "---") content in

  match files with
  | [description; code] -> (description, code)
  | _ -> failwith "Expected 2 elements"

let markdown_files dir =
  let files = readdir dir in
  let files =
    Array.to_list files
    |> List.filter is_markdown
    |> List.map (fun filename ->
           (remove_extension filename, read_file (concat dir filename)))
  in

  List.map
    (fun (filename, content) ->
      let (description, code) = split_lines content in
      (filename, description, code))
    files
