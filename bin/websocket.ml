open Trail

module Handler = struct
  include Sock.Default

  type args = unit
  type state = unit

  let init () = `ok ()

  let handle_frame frame _conn state =
    Riot.Logger.info (fun f -> f "frame: %a" Frame.pp frame);
    `push ([], state)
end
