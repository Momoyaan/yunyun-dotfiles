{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
  ];

  xdg.desktopEntries = {
    vesktop = {
      name = "Vesktop";
      exec = "vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "vesktop";
      genericName = "Internet Messenger";
      categories = ["Network" "InstantMessaging" "Chat"];
    };
  };
}
