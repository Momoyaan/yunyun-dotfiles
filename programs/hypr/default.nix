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

  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };



  home.file.".config/hyprland/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hyprland/binds.conf".source = ./binds.conf;
  home.file.".config/hyprland/env.conf".source = ./env.conf;
  home.file.".config/hyprland/execs.conf".source = ./execs.conf;
  home.file.".config/hyprland/hyprpaper.conf".source = ./hyprpaper.conf;

}
