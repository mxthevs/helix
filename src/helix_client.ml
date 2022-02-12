let init ~token ~client_id =
  Helix_auth.token := Some token;
  Helix_auth.client_id := Some client_id
