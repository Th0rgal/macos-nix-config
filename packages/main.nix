{ pkgs, ... }:

{
  imports = [ ./alacritty.nix ];

  home.packages = with pkgs; [
    # MISC
    tmate
    pkg-config
    protobuf

    # TERMINAL
    htop
    neofetch
    tree
    gnupg
    aria2
    imagemagick

    # DEVELOPMENT
    nixfmt
    #nodejs
    #nodePackages.pnpm
    httpie
    black
    mongosh
    deno
  ];

}
