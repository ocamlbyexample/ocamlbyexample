let template : ('a -> 'b -> 'c, unit, string) format =
  {|
    <html>
      <head>
        <title>OCaml</title>
        <script id="playground-script" data-merlin-url="playground/merlin.min.js" data-worker-url="playground/worker.min.js" data-default-code="%s" src="playground/playground.min.js" defer=""></script>
        <style>
           
        </style>
      </head>
      <body>
      <div> 
        %s
        <div style="">
          <div id="editor1" style=""></div>
          <button style="display:none" id="share">Share</button>
          <button id="run">Run</button>
        </div>
        <div id="output"> </div>
      </body>
    </html>
  |}

let make file_name description code =
  let file = open_out (Printf.sprintf "dist/%s.html" file_name) in
  let content = Printf.sprintf template (String.trim code) description in
  Printf.fprintf file "%s" content;
  close_out file
