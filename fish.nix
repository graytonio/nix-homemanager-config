{ pkgs, ... }: { 
	programs.fish = {
		enable = true;
		shellInit = ''
			set -U fish_greeting ""
		'';
		shellAliases = {
			ls = "exa -al --color=always --group-directories-first --icons";
			la = "exa -a --color=always --group-directories-first --icons";
			ll = "exa -l --color=always --group-directories-first --icons";

            grep = "rg";

            cat = "bat";

			tarnow = "tar -acf";
			untar = "tar -zxvf";

			kc = "kubectl";
		};
	};
}
