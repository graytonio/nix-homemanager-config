{ pkgs, cfg, ... }: {
    home.username = "graytonio";
    home.homeDirectory = "/home/graytonio";

    home.packages = [
    ];

    imports = [];

    programs.git = {
        userEmail = "graytonio.ward@gmail.com";
    };
}
