{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting
      fish_vi_key_bindings
    '';

    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  	settings={
		battery.disabled=false;
		character = {
		  success_symbol = "[λ](bold green)";
		  error_symbol = "[λ](bold red)";
		};
	};
  };

  home.packages = with pkgs; [
    grc
  ];
}

