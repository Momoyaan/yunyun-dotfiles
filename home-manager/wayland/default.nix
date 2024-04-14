# Wayland config
{
  imports = [
    ./hypr
    ./wlogout.nix
    ./system/dunst.nix
    ./system/polkit-agent.nix
  ];


  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
