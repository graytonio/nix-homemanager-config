{ pkgs, ... }: {
    programs.alacritty = {
        enable = true;
        settings = {
            font = {
                normal.family = "FiraCode Nerd Font";
                bold.family = "FiraCode Nerd Font";
                italic.family = "FiraCode Nerd Font";
                bold_italic.family = "FiraCode Nerd Font";
                size = 14.0;
            };

            colors = {
                primary.background = "#282a36";
                primary.foreground = "#f8f8f2";
                primary.bright_foreground = "#ffffff";

                cursor.text = "CellBackground";
                cursor.cursor = "CellForeground";

                vi_mode_cursor.text = "CellBackground";
                vi_mode_cursor.cursor = "CellForeground";

                search.matches = {
                    foreground = "#44475a";
                    background = "#50fa7b";
                };

                search.focused_match = {
                    foreground = "#44475a";
                    background = "#50fa7b";
                };

                footer_bar = {
                    background = "#282a36";
                    foreground = "#f8f8f2";
                };

                hints.start = {
                    foreground = "#282a36";
                    background = "#f1fa8c";
                };

                hints.end = {
                    foreground = "#f1fa8c";
                    background = "#282a36";
                };

                line_indicator = {
                    foreground = "None";
                    background = "None";
                };

                selection = {
                    text = "CellForeground";
                    background = "#44475a";
                };

                normal = {
                    black = "#21222c";
                    red = "#ff5555";
                    green = "#50fa7b";
                    yellow = "#f1fa8c";
                    blue = "#bd93f9";
                    magenta = "#ff79c6";
                    cyan = "#8be9fd";
                    white = "#f8f8f2";
                };

                bright = {
                    black = "#6272a4";
                    red = "#ff6e6e";
                    green = "#69ff94";
                    yellow = "#ffffa5";
                    blue = "#d6acff";
                    magenta = "#ff92df";
                    cyan = "#a4ffff";
                    white = "#ffffff";
                };
            };

            key_bindings = [
                { 
                    key="Return";
                    mods="Command";
                    action="SpawnNewInstance";
                }
            ];
        };
    };

}
