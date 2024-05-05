{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  requiredDeps = with pkgs; [
    bash
    coreutils
    dart-sass
    gawk
    imagemagick
    procps
    ripgrep
    util-linux
  ];

  guiDeps = with pkgs; [
    gnome.gnome-control-center
    mission-center
    overskride
    wlogout
  ];

  dependencies = requiredDeps ++ guiDeps;

  cfg = config.programs.ags;
in {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags.enable = true;

}
