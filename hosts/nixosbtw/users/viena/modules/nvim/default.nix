{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      gruvbox-material
      snacks-nvim
      mini-icons
      which-key-nvim
      blink-cmp
      tmux-nvim
      conform-nvim
      grug-far-nvim
      gitsigns-nvim
      cord-nvim
    ];

    extraPackages = with pkgs; [
      # LSP (some might come from pkgs installed in programming module)
      nil
      lua-language-server
      docker-language-server
      yaml-language-server

      # FORMATTERS
      stylua
      prettierd
      prettier
      nixfmt
      ruff
      ormolu
    ];

  };
}
