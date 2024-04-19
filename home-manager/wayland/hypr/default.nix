{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./binds.nix
    ./rules.nix
    ./settings.nix
    ./hyprpaper.nix
  ];

  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    pkgs.hyprpaper
  ];


  # enable hyprland
  wayland.windowManager.hyprland = {
    enable = true;

    # plugins = [inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix];

    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
