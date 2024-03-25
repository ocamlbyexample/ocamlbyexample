let read_lines_from_file filename =
  let ic = open_in filename in
  let rec loop acc =
    try
      let line = input_line ic in
      loop (line :: acc)
    with
    | End_of_file -> List.rev acc
  in
  try
    let lines = loop [] in
    close_in ic;
    lines
  with
  | e ->
    close_in_noerr ic;
    raise e

let write_to_file filename text =
  let oc = open_out filename in
  try
    output_string oc text;
    flush oc;
    close_out oc
  with
  | e ->
    close_out_noerr oc;
    raise e

let make file_name description code =
  let template =
    read_lines_from_file "templates/template.html" |> String.concat ""
  in
  let content =
    Str.global_replace (Str.regexp "{{title}}") "Hello World" template
    |> Str.global_replace (Str.regexp "{{content}}") description
    |> Str.global_replace (Str.regexp "{{code}}") (String.trim code)
  in

  write_to_file (Printf.sprintf "dist/%s/index.html" file_name) content
