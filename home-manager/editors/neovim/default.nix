{
  lib,
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [inputs.neovim-flake.homeManagerModules.default];

  programs.neovim-flake = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.enableEditorconfig = true;
      vim.preventJunkFiles = true;
      vim.enableLuaLoader = true;
      vim.useSystemClipboard = true;
      vim.spellChecking.enable = false;
      vim.autopairs.enable = true;
      vim.comments.comment-nvim.enable = true;
      vim.telescope.enable = true;
      vim.treesitter = {
        fold = true;
        context.enable = true;

        # extra grammars that will be installed by Nix
        grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          regex # for regexplainer
          kdl # zellij configurations are in KDL, I want syntax highlighting
        ];
      };
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = false;
      };
      vim.terminal = {
        toggleterm = {
          enable = true;
          mappings.open = "<C-t>";
        };
      };
      vim.tabline = {
        nvimBufferline.enable = true;
      };
      vim.statusline = {
        lualine = {
          enable = true;
          theme = "catppuccin";
        };
      };
      vim.session.nvim-session-manager = {
        enable = false;
      };
      vim.projects = {
        project-nvim = {
          enable = true;
        };
      };
      vim.notify = {
        nvim-notify.enable = true;
      };
      vim.languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        markdown.enable = true;
        nix.enable = true;
        html.enable = true;
        css.enable = true;
        tailwind.enable = true;
        ts.enable = true;
        go.enable = true;
        python.enable = true;
        bash.enable = true;
        zig.enable = false;
        svelte.enable = false;
        sql.enable = false;
        java = let
          jdtlsCache = "${config.xdg.cacheHome}/jdtls";
        in {
          enable = true;
          lsp.package = [
            "${lib.getExe pkgs.jdt-language-server}"
            "-configuration ${jdtlsCache}/config"
            "-data ${jdtlsCache}/workspace"
          ];
        };
        lua = {
          enable = true;
          lsp.neodev.enable = true;
        };

        rust = {
          enable = true;
          crates.enable = true;
        };

        clang = {
          enable = true;
          lsp = {
            enable = true;
            server = "clangd";
          };
        };
      };
      vim.git = {
        enable = true;
        gitsigns = {
          enable = true;
          codeActions = false;
        };
      };
      vim.debugger.nvim-dap = {
        enable = true;
        ui.enable = true;
      };
      vim.dashboard = {
        alpha.enable = true;
      };
      vim.binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };
      vim.ui = {
        noice.enable = true;
        colorizer.enable = true;
        modes-nvim.enable = false;
        illuminate.enable = true;

        breadcrumbs = {
          enable = true;
          source = "nvim-navic";
          navbuddy.enable = false;
        };

        borders = {
          enable = true;
          globalStyle = "rounded";
        };
      };
      vim.utility = {
        ccc.enable = true;
        icon-picker.enable = true;
        diffview-nvim.enable = true;

        motion = {
          hop.enable = true;
          leap.enable = false;
        };

        preview = {
          glow.enable = true;
          markdownPreview.enable = true;
        };
      };
      vim.visuals = {
        enable = true;
        nvimWebDevicons.enable = true;
        scrollBar.enable = true;
        smoothScroll.enable = false;
        cellularAutomaton.enable = false;
        highlight-undo.enable = true;

        indentBlankline = {
          enable = true;
          fillChar = null;
          eolChar = null;
          scope.enabled = true;
        };

        cursorline = {
          enable = true;
          lineTimeout = 0;
        };

        fidget-nvim = {
          enable = true;
        };
      };
      vim.filetree = {
        nvimTree = {
          enable = true;
          openOnSetup = true;
          disableNetrw = true;

          mappings = {
            toggle = "<C-w>";
          };

          git = {
            enable = true;
          };

          view = {
            cursorline = false;
            width = 35;
          };

          diagnostics.enable = true;
        };
      };
      vim.lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
        lsplines.enable = true;
        lightbulb.enable = true;
        lspsaga.enable = false;
        lspSignature.enable = true;
        nvimCodeActionMenu.enable = true;
        trouble.enable = false;
        nvim-docs-view.enable = true;
      };
      vim.autocomplete = {
        enable = true;
        type = "nvim-cmp";
        mappings = {
          # close = "<C-e>";
          confirm = "<C-y>";
          next = "<C-n>";
          previous = "<C-p>";
          scrollDocsDown = "<C-j>";
          scrollDocsUp = "<C-k>";
        };
      };
    };
  };
}
