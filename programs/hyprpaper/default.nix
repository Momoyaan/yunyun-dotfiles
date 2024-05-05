{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {

  home.packages = with pkgs; [
    hyprpaper
  ];
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = /home/yunyun/Pictures/wallpaper.jpg 
    wallpaper = DP-1,/home/yunyun/Pictures/wallpaper.jpg 

  '';

}
