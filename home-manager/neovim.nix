{ pkgs, config, lib, ... }:

{
      programs.nixvim = {
        enable = true;
        vimAlias = true;
        viAlias = true;


         /* Plugins */
        colorschemes.tokyonight.enable = true;
        plugins.lightline.enable = true;
        plugins.presence-nvim.enable = true;
        extraPlugins = with pkgs.vimPlugins; [
          vim-nix
        ];


        options = {
          autoread = true;  # Reload a file when it is changed from the outside 
          syntax = "on";  # enable syntax highlightning see :h syntax
          number = true; # Show line number
          cursorline = true; # Highlight current line
          showmode = true; # Show current mode
          wildmenu = true; # Enhance commande line completion
          showmatch = true; # Briefly show matching braces, parens, etc
          tabstop = 8;
          laststatus = 2; 



        };
        extraConfigVim = ''
          function! StripTrailingWhitespace()
          if !&binary && &filetype != 'diff'
          normal mz
          normal Hmy
          %s/\s\+$//e
          normal 'yz<CR>
          normal `z
          endif
          endfunction
          filetype plugin indent on
          set backspace=eol,indent,start
        '';
      };

    }

