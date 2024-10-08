{ config, lib, pkgs, ... }:



{

  imports = [
    ../nixos/minimal.nix
  ];


  users = {
    users.minipc= {
      isNormalUser = true;
      description = "minipc";
      createHome = true;
      home = "/home/minipc";
      extraGroups = [ "wheel" "users" "networkmanager" ];
    };
  };
}


