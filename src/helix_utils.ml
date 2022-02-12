module Http = struct
  open Piaf

  let get_sync url ~headers =
    let route = Helix_base.url ^ Helix_route.to_string url in

    let open Lwt_result.Syntax in
    Lwt_main.run
      (let* response = Client.Oneshot.get ~headers (Uri.of_string route) in

       if Status.is_successful response.status then
         Body.to_string response.body
       else
         let message = Status.to_string response.status in
         Lwt.return (Error (`Msg message)))
end
