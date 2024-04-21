{ pkgs, ...}: {
  home.packages = with pkgs; [
    (vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = true;
    })
  ];
  xdg.desktopEntries = {
    vivaldi = {
      name = "Vivaldi";
      exec = "vivaldi --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "vivaldi";
      genericName = "Web Browser";
      categories = ["Network" "Application"];
    };
  };
}
