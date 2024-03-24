let template : ('a -> 'b -> 'c, unit, string) format =
  {|
    <html>
      <head>
        <title>OCaml</title>
        <script id="playground-script" data-merlin-url="https://ocaml.org/play/_/v5RDYx588Q6Ng7p8mWrKyg/merlin.min.js" data-worker-url="https://ocaml.org/play/_/ES_yhQR43HdaKIkjQbSeuA/worker.min.js" data-default-code="%s" src="https://ocaml.org/play/_/C3DqQnnnTkxnGUaY8cyREQ/playground.min.js" defer=""></script>
      </head>
      <body>
      <div> 
        %s
        <div style="">
          <div id="editor1" style=""></div>
          <button id="share">Share</button>
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
