{ pkgs, cfg, ... }: {
    programs.vscode = {
        enable = true;
        package = pkgs.vscode-fhs;
    };
}
