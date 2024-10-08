# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hosts/hardware.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Manila";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_PH.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_PH.UTF-8";
    LC_IDENTIFICATION = "en_PH.UTF-8";
    LC_MEASUREMENT = "en_PH.UTF-8";
    LC_MONETARY = "en_PH.UTF-8";
    LC_NAME = "en_PH.UTF-8";
    LC_NUMERIC = "en_PH.UTF-8";
    LC_PAPER = "en_PH.UTF-8";
    LC_TELEPHONE = "en_PH.UTF-8";
    LC_TIME = "en_PH.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
#  users.users.minipc = {
#    isNormalUser = true;
#    description = "minipc";
#    extraGroups = [ "networkmanager" "wheel" ];
#    packages = with pkgs; [];
#  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions =
      lib.optionalString (config.nix.package == pkgs.nixFlakes)
      "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     curl
     git
     fastfetch
     onefetch
     btop
     streamrip
     beets
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /export         192.168.254.107(rw,fsid=0,insecure,no_subtree_check)
    /export/media   192.168.254.107(rw,nohide,insecure,no_subtree_check) 
    /export/media2  192.168.254.107(rw,nohide,insecure,no_subtree_check)
  '';

    services = {
      # Network shares
      samba = {
        package = pkgs.samba4Full;
        # ^^ `samba4Full` is compiled with avahi, ldap, AD etc support (compared to the default package, `samba`
        # Required for samba to register mDNS records for auto discovery 
        # See https://github.com/NixOS/nixpkgs/blob/592047fc9e4f7b74a4dc85d1b9f5243dfe4899e3/pkgs/top-level/all-packages.nix#L27268
        enable = true;
        openFirewall = true;
        shares.testshare = {
          path = "/export";
          writable = "true";
          comment = "Hello World!";
        };
      };
      avahi = {
        publish.enable = true;
        publish.userServices = true;
        # ^^ Needed to allow samba to automatically register mDNS records (without the need for an `extraServiceFile`
        #nssmdns4 = true;
        # ^^ Not one hundred percent sure if this is needed- if it aint broke, don't fix it
        enable = true;
        openFirewall = true;
      };
      samba-wsdd = {
      # This enables autodiscovery on windows since SMB1 (and thus netbios) support was discontinued
        enable = true;
        openFirewall = true;
      };
    };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "server";
  };

  services.gonic = {
    enable = true;
    settings = {
      music-path = [ "/mnt/media/Music" ];
      podcast-path = "/mnt/media/Music/podcast";
      playlists-path = "/mnt/media/Music/playlists";
      listen-addr = "0.0.0.0:4747";
    };
   };
  
  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 4747 4000 4001 4002 20048 2049 111 139 445];
    allowedUDPPorts = [ 4747 4000 4001 4002 20048 2049 111 137 138];
    #allowedUDPPortRanges = [
    #  { from = 8000; to = 8010; }
    #];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
