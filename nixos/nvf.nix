{
programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
	lsp.enable = true;
	languages = {
	  nix.enable = true;
	  rust.enable = true;
	  ts.enable = true;
	  go.enable = true;
	};
	telescope.enable = true;
      };
    };
  };
}
