{
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      Address = "0.0.0.0";
      MusicFolder = "/mnt/media/beets/Music";
      LastFM.ApiKey = "7db00f1a7fd45e997b3ea43f0a034cab";
      LastFM.Secret = "b13734a2a09a5f9c6dd6871d9d9ae327";
    };
    
  };
}
