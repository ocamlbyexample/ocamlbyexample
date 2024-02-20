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
         get "/" Sidewinder_trail.(live Layout.root (module Index));
      ];
  ]

let () =
  Riot.run @@ fun () ->

  set_log_level (Some Debug);

  let handler = Nomad.trail endpoint in
  let pid = Nomad.start_link ~port:8080 ~handler () |> Result.get_ok in

  wait_pids [pid] |> ignore;

  ()
 
