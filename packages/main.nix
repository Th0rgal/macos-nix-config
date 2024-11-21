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
    websocat
    ngrok
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
    nixfmt-classic
    nodejs_18
    gradle
    zulu
    mongodb-tools
    black
    unstable.mongosh
    deno
    awscli2
    gh

    # Fast python env
    unstable.act
    unstable.uv
  ];

  home.sessionVariables = {
    JAVA_HOME = "${pkgs.zulu}";  # Set the JAVA_HOME variable for Zulu Java 21
  };
}
