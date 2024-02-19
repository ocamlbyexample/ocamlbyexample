open Riot
open Trail
open Router

open Riot.Logger.Make (struct
  let namespace = ["dbcaml"]
end)

let endpoint =
  [
    use (module Logger) Logger.(args ~level:Debug ());
    router
      [
        socket "/ws" (module Websocket.Handler) ();
        get "/" (fun conn -> Conn.send_response `OK {%b|"hello world"|} conn);
        scope "/api"
          [
            get "/version" (fun conn ->
                Conn.send_response `OK {%b|"none"|} conn);
          ];
      ];
  ]

let () =
  Riot.run @@ fun () ->

  set_log_level (Some Debug);

  let handler = Nomad.trail endpoint in
  let pid = Nomad.start_link ~port:8080 ~handler () |> Result.get_ok in

  wait_pids [pid] |> ignore;

  ()
 
