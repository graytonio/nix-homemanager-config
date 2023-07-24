{ pkgs, cfg, ... }: {	
	home.stateVersion = "23.05";

    nixpkgs.config.allowUnfree = true;
	home.packages = [
        # Utilities
        pkgs.ripgrep
        pkgs.htop

        # Style Packages 
		pkgs.neofetch

        # FS Commands
        pkgs.tree
		pkgs.exa
        pkgs.bat
		
        # DevOps like tools
        pkgs.kubectx
        pkgs.kubectl
        pkgs.k9s

        # Programming tools
        #pkgs.arduino
        pkgs.cargo
        pkgs.rustc
        pkgs.go
        pkgs.nodejs_18
        pkgs.python311
    ];

    imports = [
        ./platform.nix
        ./tmux.nix
        ./starship.nix
        ./fish.nix
        ./neovim.nix
        ./alacritty.nix
    ];

  	programs.home-manager = {
		enable = true;
	};

    programs.git = {
        enable = true;
        userName = "Grayton Ward";
        extraConfig = {
            init.defaultBranch = "main";
            core.editor = "nvim";
            pull.rebase = "false";
            credential.helper = "store";
        };
    };
}
