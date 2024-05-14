{ pkgs, ... }:

let
  unstable = import <nixpkgs-unstable> { };
  # tex = (pkgs.texlive.combine {
  #   inherit (pkgs.texlive)
  #     scheme-medium dvisvgm dvipng
  #     wrapfig amsmath ulem hyperref capt-of;
  # });

in {
  imports = [ ./alacritty.nix ];

  home.packages = with pkgs; [
    # MISC
    tmate
    pkg-config
    protobuf
    grpcurl
    # tex

    # TERMINAL
    htop
    neofetch
    tree
    gnupg
    aria2
    imagemagick
    httpie
    fx
    ghostscript

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
