{
  services.aria2 = {
    enable = true;
    openPorts = true;
    rpcSecretFile = "/home/minipc/.config/aria2/token.txt";
    settings = {
      rpc-listen-all = true;
      rpc-allow-origin-all = true;
      enable-rpc = true;
      dir = "/mnt/media/Downloads/aria2";
    };
  };
}
