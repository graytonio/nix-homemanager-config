{ pkgs, cfg, ... }: {
    home.username = "graytonio";
    home.homeDirectory = "/home/graytonio";

    home.packages = [
    ];

    programs.git = {
        userEmail = "graytonio.ward@gmail.com";
    };
}
