{ config, lib, pkgs, ... }:

{

  imports = [
    ../nixos/minimal.nix
    ./hardware.nix
  ];

  users = {
    users.yunyun = {
      isNormalUser = true;
      createHome = true;
      home = "/home/yunyun";
      extraGroups = [ "wheel" "users" "audio" "video" "networkmanager" "adbusers" ];
    };
  };
}


