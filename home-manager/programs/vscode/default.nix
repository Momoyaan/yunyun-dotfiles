{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
  ];

  xdg.desktopEntries = {
    vscode = {
      name = "vscode";
      exec = "code --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "vscode";
      genericName = "Text Editor";
      categories = ["Network" "Application"];
    };
  };
}
