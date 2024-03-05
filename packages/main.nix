{ pkgs, ... }:

{
  imports = [ ./alacritty.nix ];

  home.packages = with pkgs; [
    # MISC
    tmate
    pkg-config
    protobuf
    grpcurl

    # TERMINAL
    htop
    neofetch
    tree
    gnupg
    aria2
    imagemagick
    fx

    # DEVELOPMENT
    nixfmt
    nodejs_18
    mongodb-tools
    #nodejs
    #nodePackages.pnpm
    httpie
    black
    mongosh
    deno
  ];

}
