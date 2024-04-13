{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = /home/yunyun/Pictures/wallpaper.jpg 
    wallpaper = DP-1,/home/yunyun/Pictures/wallpaper.jpg 

  '';

  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Hyprland wallpaper daemon";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${lib.getExe inputs.hyprpaper.packages.${pkgs.system}.default}";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
