{pkgs, ...}: {
  home.packages = with pkgs; [
    (catppuccin-kvantum.override {
      accent = "Rosewater";
      variant = "Mocha";
    })
  ];
  qt = {
    enable = true;
    platformTheme = "qtct";
    style.name = "kvantum";
  };
  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Catppuccin-Mocha-Rosewater
    '';

    "Kvantum/Catppuccin-Mocha-Rosewater".source = "${(pkgs.catppuccin-kvantum.override {
      accent = "Rosewater";
      variant = "Mocha";
    })}/share/Kvantum/Catppuccin-Mocha-Rosewater";
  };
}
