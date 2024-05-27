{
  lib,
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;

      vim.lsp = {
        enable = true;
      };

      vim.languages = {

        nix = {
          enable = true;
          extraDiagnostics = {
            enable = true;
            types = [
              "statix"
              "deadnix"
            ];
          };

          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
       };

       ts = {
          enable = true;
          extraDiagnostics = {
            enable = true;
          };

          format = {
            enable = true;
          };

          lsp = {
            enable = true;
          };

          treesitter = {
            enable = true;
          };
       };

      };
    };
  };
}
