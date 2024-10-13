{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    group = "aria2";
  };
}
