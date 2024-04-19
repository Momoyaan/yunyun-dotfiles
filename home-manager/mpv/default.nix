{ pkgs, config, ... }:

{
      programs.mpv.enable = true; 

      home.file.".config/mpv/mpv.conf".source = ./mpv.conf;
      home.file.".config/mpv/scripts".source = ./etc/scripts;
      home.file.".config/mpv/fonts".source = ./etc/fonts;
      home.file.".config/mpv/input.conf".source = ./etc/input.conf;
      home.file.".config/mpv/shaders".source = ./etc/shaders;

    }

