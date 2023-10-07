{ pkgs, cfg, ... }: {	
	home.stateVersion = "23.05";

    nixpkgs.config.allowUnfree = true;
	home.packages = [
        # Desktop Applications
        pkgs.brave
        pkgs.discord
        pkgs.obs-studio

        # Utilities
        pkgs.spotify-tui
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
        pkgs.cargo
        pkgs.rustc
        pkgs.go
        pkgs.nodejs_18
        pkgs.python311
        pkgs.python311Packages.pip
        pkgs.gcc
    
        # Fonts
        (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
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

    fonts.fontconfig.enable = true;
    services.spotifyd = {
        enable = true;
        settings = {
            global = {
                username = "graytonio";
                password = "";
            };
        };
    };

    programs.git = {
        enable = true;
        userName = "Grayton Ward";
        userEmail = "graytonio.ward@gmail.com";
        extraConfig = {
            init.defaultBranch = "main";
            core.editor = "nvim";
            pull.rebase = "false";
            credential.helper = "store";
        };
    };
}
