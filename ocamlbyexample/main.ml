let () =
  Markdown.markdown_files "./content/"
  |> List.iter (fun (filename, description, code) ->
         Generate.make filename description code)
