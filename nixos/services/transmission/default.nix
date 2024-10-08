{
  services.transmission = {
    enable = true;
    user = "minipc";
    group = "users";
    openFirewall = true;
    openRPCPort = true;
    openPeerPorts = true;
    settings = {
      lpd-enabled = true;
      dht-enabled = true;
      pex-enabled = true;
      utp-enabled = true;
      bind-address-ipv4 = "0.0.0.0";
      bind-address-ipv6 = "::1"; # Disable ipv6
      rpc-bind-address = "0.0.0.0";
      rpc-port = 9091;
      rpc-url = "/transmission/rpc/";
      rpc-whitelist-enabled = true;
      rpc-host-whitelist-enabled = true;
      rpc-authentication-required = false;
      rpc-host-whitelist = "*";
      rpc-whitelist = "*";
      incomplete-dir = "/mnt/media/Downloads/.incomplete";
      incomplete-dir-enabled = true;
      download-dir = "/mnt/media/Downloads";
    };
  };

}
