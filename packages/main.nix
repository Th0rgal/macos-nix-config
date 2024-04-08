{ pkgs, ... }:

let unstable = import <nixpkgs-unstable> { };
in {
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
    httpie
    fx

    # DEVELOPMENT
    nixfmt
    nodejs_18
    mongodb-tools
    black
    mongosh
    deno
    awscli2
    gh

    # Fast python env
    unstable.act
    unstable.uv
  ];
}
