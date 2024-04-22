{
  config,
  pkgs,
  inputs,
  lib,
  super,
  self,
  ...
}: {
  imports = [
    inputs.hyprlock.homeManagerModules.default
    inputs.hypridle.homeManagerModules.default
    inputs.hyprpaper.homeManagerModules.default
    inputs.catppuccin.homeManagerModules.catppuccin
    ./mpv
    ./editors/helix
    ./editors/neovim
    ./anyrun
    ./terminal
    ./wayland
    ./ags
    ./gtk.nix
    ./qt.nix
    ./programs
  ];
  # TODO please change the username & home directory to your own
  home.username = "yunyun";
  home.homeDirectory = "/home/yunyun";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    firefox
    fastfetch
    pfetch-rs
    droidcam
    obs-studio
    qbittorrent
    kdenlive
    foliate
    libreoffice-fresh
    easyeffects
    komikku
    musikcube
    mission-center
    gnome.nautilus
    pcmanfm
    nwg-look
    bottles
    wineWowPackages.stableFull
    chromium
    android-studio

    # archives
    zip
    unzip
    p7zip
    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    grim
    slurp
    wl-clipboard
    wl-screenrec
    wf-recorder
    libva-utils
    ack
    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    kdeconnect
    cinnamon.warpinator
    gamescope

    #lang
    jdk17
    spring-boot-cli
    maven
    gradle
    postman
    nodejs_21
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Momoyaan";
    userEmail = "ianmathewaviso@gmail.com";
  };
  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
