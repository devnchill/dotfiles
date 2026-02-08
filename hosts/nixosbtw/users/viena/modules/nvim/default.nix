{config,pkgs,...}:

{
  programs.neovim = {
  	enable = true;
	viAlias=true;
	vimAlias=true;
	vimdiffAlias=true;
	plugins = with pkgs.vimPlugins;[
		gruvbox-nvim
		snacks-nvim
	];
  };
	home.packages = with pkgs;[
		lua-language-server
	];
}
