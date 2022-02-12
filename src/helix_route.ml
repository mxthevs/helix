type t = string

let make (route : string) : t = "/" ^ route
let to_string = Fun.id
