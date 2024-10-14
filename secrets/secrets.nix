let
  minipc = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJg4QlEaJ99AZBur94OTqtu1tJSX2WkuS8OSn4+qq61f minipc@nixos";
in {
  "lastfmkey.age".publicKeys = [minipc];
  "lastfmsecret.age".publicKeys = [minipc];
  "spotifyid.age".publicKeys = [minipc];
  "spotifysecret.age".publicKeys = [minipc];
}
