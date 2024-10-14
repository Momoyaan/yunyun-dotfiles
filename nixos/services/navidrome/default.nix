{ config, lib, ... }: {
  services.navidrome = {
    enable = true;
    openFirewall = true;
    user = "minipc";
    group = "users";
    settings = {
      MusicFolder = "/mnt/media/beets/Music";
      Address = "0.0.0.0";
      LastFM.Enabled = true;
      ListenBrainz.Enabled = true;
      LastFM.ApiKey = lib.strings.removeSuffix "\n" (builtins.readFile config.age.secrets.LastFMApiKey.path); 
      LastFM.Secret = lib.strings.removeSuffix "\n" (builtins.readFile config.age.secrets.LastFMApiSecret.path);
      Spotify.ID = lib.strings.removeSuffix "\n" (builtins.readFile config.age.secrets.SpotifyID.path);
      Spotify.Secret = lib.strings.removeSuffix "\n" (builtins.readFile config.age.secrets.SpotifySecret.path);
    };
  };
}
