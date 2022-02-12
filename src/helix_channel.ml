type t = { display_name : string } [@@deriving yojson]

let route = Helix_route.make "channel"

let channel () =
  match Helix_utils.Http.get_sync route ~headers:Helix_auth.default_headers with
  | Ok data -> Some data
  | Error _ -> None
