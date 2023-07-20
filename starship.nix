{ pkgs, ... }: {
    programs.starship = {
		enable = true;
		settings = {
			add_newline = false;
			character = {
				success_symbol = "[➜](bold green)";
				error_symbol = "[✗](bold red)";
			};

			hostname = {
				ssh_only = true;
				format = "<[$hostname]($style)>";
				disabled = false;
			};

			directory = {
				truncation_length = 10;
				truncate_to_repo = true;
				format = "[$path]($style)[$lock_symbol]($lock_style) ";
				style = "bold italic";
			};

			shell = {
				disabled = false;
			};

			kubernetes = {
				disabled = false;
			};

			git_branch = {
				format = "[$symbol$branch]($style) ";
				symbol = "🌱 ";
			};

			git_status = {
				disabled = true;
			};

			username = {
				style_user = "bold dimmed blue";
				style_root = "black bold";
				format = "[$user]($style) ";
				disabled = false;
				show_always = true;
			};
		};
	};
}
