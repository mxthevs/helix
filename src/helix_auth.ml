let token : string option ref = ref None
let client_id : string option ref = ref None

let default_headers =
  let token, client_id =
    match (!token, !client_id) with
    | Some t, Some c -> (t, c)
    | Some _, None -> failwith "Client-ID was not provided"
    | None, Some _ -> failwith "OAuth Token was not provided"
    | None, None -> failwith "Missing both OAuth Token and Client-ID"
  in

  [ ("Authorization", "OAuth " ^ token); ("Client-ID", client_id) ]
