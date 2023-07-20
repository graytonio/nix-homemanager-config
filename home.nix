{ pkgs, cfg, ... }: {	
	home.username = "graytonio";
	home.homeDirectory = "/home/graytonio";
	home.stateVersion = "23.05";

    nixpkgs.config.allowUnfree = true;
	home.packages = [
        # Browser
        pkgs.brave

        # Style Packages 
		pkgs.neofetch

        # FS Commands
        pkgs.tree
		pkgs.exa
		
        # DevOps like tools
        pkgs.kubectl
        pkgs.k9s

        # Programming tools
        pkgs.arduino
        pkgs.cargo
        pkgs.rustc
        pkgs.go
        pkgs.nodejs_18
        pkgs.python311
        pkgs.gcc
    ];

    imports = [
        ./vscode.nix
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
        userEmail = "graytonio.ward@gmail.com";
        extraConfig = {
            init.defaultBranch = "main";
            core.editor = "nvim";
            pull.rebase = "false";
        };
    };
}
